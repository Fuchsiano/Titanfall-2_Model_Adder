import bpy
import mathutils
import math
from bpy.types import Context

##############Texture operation

class ModelRecolor(bpy.types.Operator):
    """Recolor the selected Add-on model. Considering the selected body parts and the Selected color"""
    
    bl_idname = "object.visor_recolor"
    bl_label = "Recolors the selected Pilot visors"

    def recolor_obj(self,context,obj):
        
        tf_settings = context.scene.Titanfall_adder_settings
        for material_slot in obj.material_slots:
            material = material_slot.material

            if not (("_b" in material.name and tf_settings.body_color) or ("_he" in material.name and tf_settings.helmet_color) or ("_j" in material.name and tf_settings.jumpkit_color)):
                continue

            if not material.use_nodes:
                print("Tried to recolor material without nodes. Trying next material")
                continue

            node_tree = material.node_tree

            color_rgb_node = None

            for node in node_tree.nodes:
                if node.name.startswith("RGB"):
                    color_rgb_node = node
                    break

            if not color_rgb_node:
                print("Node not found in " + material.name)
                continue

            if (("_b" in material.name and tf_settings.body_color) or ("_he" in material.name and tf_settings.helmet_color) or ("_j" in material.name and tf_settings.jumpkit_color)):
                color_rgb_node.outputs[0].default_value = tf_settings.light_color
    
    def execute(self, context):


        for obj in bpy.context.selected_objects:
            if obj.type == "ARMATURE":
                for child in obj.children:
                    self.recolor_obj(context,child)
            else:
                self.recolor_obj(context,obj)

        return {"FINISHED"}


class UnlinkMaterial(bpy.types.Operator):
    """Create a new Set of Materials for all Selected Objects"""
    
    bl_idname = "object.unlink_selected"
    bl_label = "Unlink selected S/G Blender Materials"
    materials_created_this_import = []

    def unlink_material(material_slot):

            material = material_slot.material
            
            if not material.use_nodes:
                print("Tried to Unlink material without nodes. Trying next material")
                
            node_tree = material.node_tree

            sg_blender_nodes = [ node for node in node_tree.nodes if node.type == "GROUP" and node.node_tree.name == node_tree_name]

            if not sg_blender_nodes:
                print("Tried to Unlink material without sg_blender_node. Trying next material")

            material_slot.material = material.copy()


            
    def unlink_from_obj(self, obj):
        for material_slot in obj.material_slots:
            material = material_slot.material

            is_duplicate = False

            for wasCreated in self.materials_created_this_import:
                if wasCreated.name.split(".")[0] == material.name.split(".")[0]:
                    material_slot.material = wasCreated
                    is_duplicate = True
                    break

            if is_duplicate:
                continue

            if not material.use_nodes:
                print("Tried to Unlink material without nodes. Trying next material")
                continue

            node_tree = material.node_tree

            sg_blender_nodes = [ node for node in node_tree.nodes if node.type == "GROUP" and node.node_tree.name == node_tree_name]

            if not sg_blender_nodes:
                print("Tried to Unlink material without sg_blender_node. Trying next material")
                continue

            material_slot.material = material.copy()
            self.materials_created_this_import.append(material_slot.material)

    def execute(self, context):
        for obj in bpy.context.selected_objects:
            if obj.type =="ARMATURE":
                for child in obj.children:
                    self.unlink_from_obj(child)
            else:        
                self.unlink_from_obj(obj)

        
        self.materials_created_this_import.clear()
        return {"FINISHED"}


class ReLinkMaterial(bpy.types.Operator):
    
    """Link all Selected Objects to the 'Single-Material'"""
    bl_idname = "object.relink_selected"
    bl_label = "Relink selected S/G Blender Materials"

    def re_link_obj(self,obj):
        for material_slot in obj.material_slots:
                
            materialToReplace = material_slot
            singleMaterial = bpy.data.materials[materialToReplace.name.split(".")[0]]

            if not singleMaterial:
                print("was not able to find: " + materialToReplace.name.split(".")[0])
                self.report(type="WARNING", message="Model was not Relinked correctly")
                continue
            material_slot.material = singleMaterial
                
    def execute(self, Context):
        for obj in bpy.context.selected_objects:
            if obj.type == "ARMATURE":
                for child in obj.children:
                    self.re_link_obj(child)
        else:
            self.re_link_obj(obj)

        return {"FINISHED"}


class DeleteUnusedMaterials(bpy.types.Operator):
    """!!EXPENSIVE!! Delete all Unused Materials. Better to restart Blender than using this"""
    bl_idname = "object.pt_clean_materials"
    bl_label = "delete unused Materials"

    # I dont rly know if this really works ...
    def execute(self, context):
        bpy.ops.object.select_all(action="SELECT")

        # Remove unused material slots
        bpy.ops.object.material_slot_remove_unused()

        return {"FINISHED"}


class GetObjectWith(bpy.types.Operator):
    bl_idname = "object.get_object_with"
    bl_label = "delete unused Materials"

    def execute(self, context):
        for obj in bpy.context.selected_objects:
            print(obj.name)
            print(obj.dimensions.x)
            print(obj.dimensions.y)
            print("")

        return {"FINISHED"}


global version_string
version_string = ""

global node_tree_appended
node_tree_appended = False

global node_tree_name
node_tree_name = "S/G-Blender"

global addon_core_path
global addon_base_path


class SG_Blender_importer(bpy.types.Operator):
    """Adds the basic Node Tree used for Titanfall models to the .blend file"""
    bl_idname = "object.sg_blender_importer"
    bl_label = "append the S/G Blender Node Tree"

    def execute(self, context):
        global node_tree_appended

        if node_tree_name in bpy.data.node_groups:
            print("Tree already imported :D")
            node_tree_appended = True
            return {"FINISHED"}

        print("starting SG_shader import....")
        blend_file_path = addon_core_path + "/SG_shader.blend"
        with bpy.data.libraries.load(blend_file_path, link=False) as (
            data_from,
            data_to,
        ):
            data_to.node_groups = [node_tree_name]
        if node_tree_name in bpy.data.node_groups:
            appended_node_tree = bpy.data.node_groups[node_tree_name]
            print("Appendet Node Tree!")
            node_tree_appended = True
            self.report({"INFO"}, "Thank you & Enjoy :D")
            return {"FINISHED"}

        print("No Node Tree found!")
        return {"CANCELLED"}

##############Object operation
class AddToHand(bpy.types.Operator):
    """Sets a selected Weapon as a Child of a selected Pilot.
    armature names will be used to negotiate which object is child"""
    
    bl_idname = "object.add_to_hand"
    bl_label = "Add a object to the hand of the Armature"

    def execute(self, context):
        gunArmature = None
        pilotArmature = None
        
        for obj in bpy.context.selected_objects:
            if obj.type == "ARMATURE":
                if obj.name.startswith("Guns"):
                    gunArmature = obj
                elif obj.name.startswith("Pilots"):
                    pilotArmature = obj
                    
        # Check if both armatures are found
        if gunArmature and pilotArmature:
            
            bpy.ops.object.mode_set(mode='POSE')
            # Add CHILD_OF constraint to the gunArmature
            prop_hand_name = "ja_r_propHand" 
            # Get the local position of the subtarget bone 
            prop_hand_bone = pilotArmature.pose.bones[prop_hand_name]
            
            child_of_constraint = gunArmature.constraints.new(type='CHILD_OF')
            child_of_constraint.target = pilotArmature
            child_of_constraint.subtarget = prop_hand_name
            
            
            #Bone Rotation is Fucked need to make my own rotation
            wrist_name = "def_r_wrist"

            # Get the bone objects
            wrist_bone = pilotArmature.pose.bones[wrist_name]


            weapon_bone_name = "weapon_bone" 
            weapon_bone = gunArmature.pose.bones[weapon_bone_name]
            

            # Get the rotation difference between the pilot bone and the gun bone
            pilot_bone_rotation = wrist_bone.matrix.to_quaternion()
            gun_bone_rotation = weapon_bone.matrix.to_quaternion()

            rotation_difference = pilot_bone_rotation.rotation_difference(gun_bone_rotation)

            # Convert the rotation difference to Euler angles
            rotation_difference_euler = rotation_difference.to_euler()

            # Convert the rotation difference to Euler angles
            rotation_difference_euler = rotation_difference.to_euler()

            # Decompose the current Euler rotation of the gunArmature
            current_rotation_euler = gunArmature.rotation_euler

            # Add the corresponding angles from the rotation_difference_euler
            new_rotation_euler = [current_angle + diff_angle for current_angle, diff_angle in zip(current_rotation_euler, rotation_difference_euler)]

            # Set the rotation_euler of the gunArmature with the updated Euler angles
            gunArmature.rotation_euler = new_rotation_euler

            print(pilotArmature.rotation_mode);

            pilot_bone_world_pos = pilotArmature.matrix_world @ prop_hand_bone.matrix.translation

            # Get the world space position of the gun bone
            gun_bone_world_pos = gunArmature.matrix_world @ weapon_bone.matrix.translation

            # Calculate the offset between the pilot bone and the gun bone
            offset = pilot_bone_world_pos - gun_bone_world_pos

            # Apply the offset to the gun armature
            gunArmature.location += offset

            bpy.ops.object.mode_set(mode='OBJECT')

            # Update the scene to see the changes
            bpy.context.view_layer.update()

            print("Object added to the hand successfully.")
        else:
            self.report({"ERROR"}, "was not able to find / get armatures.They were either renamed or not selected.")
            return {'CANCELLED'}

        return {'FINISHED'}
        