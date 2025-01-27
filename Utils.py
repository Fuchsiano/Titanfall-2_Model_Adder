import bpy
from mathutils import Euler
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
    

class KeyframeModelRecolor(bpy.types.Operator):
    
    bl_idname = "object.key_visor_recolor"
    bl_label = "Recolors the selected Pilot visors at key"

    def recolor_objAndKey(self,context,obj):
        
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
                color_rgb_node.outputs[0].keyframe_insert(data_path="default_value", frame = context.scene.frame_current)
    
    def execute(self, context):

        for obj in bpy.context.selected_objects:
            if obj.type == "ARMATURE":
                for child in obj.children:
                    self.recolor_objAndKey(context,child)
            else:
                self.recolor_objAndKey(context,obj)

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

class SetBackgroundTransparent(bpy.types.Operator):
    """Set Film to Transparent"""
    bl_idname = "object.set_film_transparent"
    bl_label = "Set Film Transparent"
    bl_options = {'REGISTER', 'UNDO'}
    
    def execute(self, context):
        context.scene.render.film_transparent = True
        self.report({'INFO'}, "Film set to Transparent!")
        return {'FINISHED'}

global version_string
version_string = ""

global model_version_string
model_version_string = ""

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
#seems like the imported armatures are fucked need to think of a solution
class AddToHand(bpy.types.Operator):
    """Sets a selected Weapon as a Child of a selected Pilot.
    armature names will be used to negotiate which object is child"""
    
    bl_idname = "object.add_to_hand"
    bl_label = "Add a object to the hand of the Armature"



    def execute(self, context):
            

        magicRotation = Euler((math.radians(41), math.radians(20), math.radians(0)), 'XYZ')
        
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
            prop_hand_bone = pilotArmature.pose.bones[prop_hand_name]
            
            child_of_constraint = gunArmature.constraints.new(type='CHILD_OF')
            child_of_constraint.target = pilotArmature
            child_of_constraint.subtarget = prop_hand_name
            
            gunArmature.rotation_mode = 'XYZ'
            gunArmature.rotation_euler = pilotArmature.rotation_euler
            
            gunArmature.rotation_euler.x += magicRotation.x
            gunArmature.rotation_euler.y += magicRotation.y
            gunArmature.rotation_euler.z += magicRotation.z

            pilot_bone_world_pos = pilotArmature.matrix_world @ prop_hand_bone.matrix.translation
            

            gunArmature.location = pilot_bone_world_pos

            bpy.ops.object.mode_set(mode='OBJECT')

            # Update the scene to see the changes
            bpy.context.view_layer.update()

        else:
            self.report({"ERROR"}, "was not able to find / get armatures.They were either renamed or not selected.")
            return {'CANCELLED'}

        return {'FINISHED'}

class GunSetOrigin(bpy.types.Operator):
    """set the new Origin to the gun's grip"""
    
    bl_idname = "object.gun_set_origin"
    bl_label = "set the new Origin to the gun's grip"



    def execute(self, context):

        for obj in context.selected_objects:
            if obj.type != "ARMATURE" and not "Guns" in obj.name: 
                continue

            cursor = bpy.context.scene.cursor
            origin_backup = cursor.location.copy()
            cursor.location = obj.matrix_world @ obj.pose.bones["weapon_bone"].head
            bpy.ops.object.origin_set(type='ORIGIN_CURSOR')
            cursor.location = origin_backup
            obj.location = origin_backup                
        
        return {'FINISHED'}



class NewArmature(bpy.types.Operator):
    """Create a new Armature for the selected Pilots"""
    
    bl_idname = "object.pilot_new_armature"
    bl_label = "Create a new Armature for the selected Pilots"

    def traverse_bones(self, old_armature, new_armature, bone,boneParent = None, level=0):
        print("  " * level + f"Bone: {bone.name}")
        
        # Create a new bone in the new armature
        new_bone = new_armature.edit_bones.new(bone.name)
        
        if boneParent:
            new_bone.head = boneParent.tail
        else:
            #its a backup
            new_bone.head = bone.head_local

        new_bone.tail = bone.tail_local
        
        # Set the parent bone
        if bone.parent:
            new_bone.parent = new_armature.edit_bones[bone.parent.name]
            new_bone.use_connect = True
        
        # Check if the bone has children
        if bone.children:
            for child in bone.children:
                self.traverse_bones(old_armature, new_armature, child, boneParent= bone, level = level + 1)
        else:
            print(f"{bone.name} has no children")
            # If no children, create a continuation bone
            direction = (bone.tail_local - bone.head_local).normalized()
            new_bone.tail = bone.tail_local + direction * (bone.length / 4)
    
    def execute(self, context):
        for obj in context.selected_objects:
            if obj.type != "ARMATURE" and not "Guns" in obj.name: 
                continue
            
            old_armature = obj
            head_bone = old_armature.pose.bones["jx_c_delta"]
            
            # Create a new armature
            bpy.ops.object.armature_add()
            new_armature_obj = bpy.context.object
            new_armature_obj.show_in_front  = True

            new_armature = new_armature_obj.data
            
            # Switch to Edit mode
            bpy.context.view_layer.objects.active = new_armature_obj
            new_armature.display_type = "STICK"
            bpy.ops.object.mode_set(mode='EDIT')
            new_armature.edit_bones.remove(new_armature.edit_bones['Bone'])
            # Traverse and create bones
            self.traverse_bones(old_armature, new_armature, head_bone.bone, 0)
            
            # Return to Object mode
            bpy.ops.object.mode_set(mode='OBJECT')
            
            # Parent objects to the new armature
            for child in old_armature.children:
                child.parent = new_armature_obj

            # Store the old armature's name
            old_armature_name = old_armature.name

            # Delete the old armature
            bpy.data.objects.remove(old_armature, do_unlink=True)

            # Rename the new armature to the old armature's name
            new_armature_obj.name = old_armature_name

        
        return {'FINISHED'}