import re
import typing
import bpy
from bpy.types import Context

class ModelRecolor(bpy.types.Operator):
    bl_idname = "object.visor_recolor"
    bl_label = "Recolors the selected Pilot visors"
    
    def execute(self, context):
        
        tf_settings = context.scene.Titanfall_adder_settings
        
        for obj in bpy.context.selected_objects:
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
                    if node.name.startswith('RGB'):
                        color_rgb_node = node
                        break
                
                if not color_rgb_node:
                    print("Node not found in " + material.name)
                    continue
                    
                if ("_b" in material.name and tf_settings.body_color) or ("_he" in material.name and tf_settings.helmet_color) or ("_j" in material.name and tf_settings.jumpkit_color):
                    color_rgb_node.outputs[0].default_value = tf_settings.light_color
        
        return {'FINISHED'}


class UnlinkMaterial(bpy.types.Operator):

    bl_idname = "object.unlink_selected"
    bl_label = "Unlink selected S/G Blender Materials"

    
    def execute(self, context):
        
        materials_created_this_import = []
        
        for obj in bpy.context.selected_objects:
            for material_slot in obj.material_slots:
                
                material = material_slot.material

                is_douplicate = False

                for wasCreated in materials_created_this_import:
                    if wasCreated.name.split('.')[0] == material.name.split('.')[0]:
                        material_slot.material = wasCreated
                        is_douplicate = True
                        break

                if is_douplicate:
                    continue

                if not material.use_nodes:
                    print("Tried to Unlink material without nodes. Trying next material")
                    continue

                node_tree = material.node_tree

                sg_blender_nodes = [node for node in node_tree.nodes if node.type == 'GROUP' and node.node_tree.name == node_tree_name]
                    
                if not sg_blender_nodes:
                    print("Tried to Unlink material without sg_blender_node. Trying next material")
                    continue    

                material_slot.material = material.copy()
                materials_created_this_import.append(material_slot.material)

        return {'FINISHED'}

class ReLinkMaterial(bpy.types.Operator):
    bl_idname = "object.relink_selected"
    bl_label = "Relink selected S/G Blender Materials"

    def execute(self,Context):
        for obj in bpy.context.selected_objects:
            for material_slot in obj.material_slots:
                materialToReplace = material_slot
                singleMaterial = bpy.data.materials[materialToReplace.name.split('.')[0]]

                if not singleMaterial:
                    print("was not able to find: " + materialToReplace.name.split('.')[0])
                    self.report(type='WARNING' , message= "Model was not Relinked correctly")
                    continue
                material_slot.material = singleMaterial
        
        return{'FINISHED'}


        

class DeleteUnusedMaterials(bpy.types.Operator):
    bl_idname = "object.pt_clean_materials"
    bl_label = "delete unused Materials"

    # I dont rly know if this realy works ... 
    def execute(self, context):
        bpy.ops.object.select_all(action='SELECT')
        
        # Remove unused material slots
        bpy.ops.object.material_slot_remove_unused()

        return {'FINISHED'}


class GetObjectWith(bpy.types.Operator):
        
    bl_idname = "object.get_object_with"
    bl_label = "delete unused Materials"

    def execute(self, context):
        for obj in bpy.context.selected_objects:
            print(obj.name)
            print(obj.dimensions.x)
            print(obj.dimensions.y)
            print("")

        return {'FINISHED'}

global version_string 
version_string = ""

global  node_tree_appendet
node_tree_appendet = False 

global node_tree_name
node_tree_name  = "S/G-Blender"

global addon_core_path
global addon_base_path

addon_core_path = bpy.utils.user_resource('SCRIPTS') + r"/addons/Titanfall-2_Model_Adder/" + version_string.replace(".", "_")
addon_base_path = bpy.utils.user_resource('SCRIPTS') + r"/addons/Titanfall-2_Model_Adder/Models/" + version_string.replace(".", "_")

class SG_Blender_importer(bpy.types.Operator):
    bl_idname = "object.sg_blender_importer"
    bl_label = "append the S/G Blender Node Tree"


    def execute(self, context):
        
        global node_tree_appendet
        
        if node_tree_name in bpy.data.node_groups:
            print("Tree already imported :D")
            node_tree_appendet = True
            return {'FINISHED'}
              
        print("starting SG_shader import....")
        blend_file_path = addon_core_path + "/SG_shader.blend"
        with bpy.data.libraries.load(blend_file_path, link=False) as (data_from, data_to):
            data_to.node_groups = [node_tree_name]
        if node_tree_name in bpy.data.node_groups:
            appended_node_tree = bpy.data.node_groups[node_tree_name]
            print("Appendet Node Tree!")
            node_tree_appendet = True
            self.report({'INFO'}, 'Thank you & Enjoy :D')
            return {'FINISHED'}
        
        print("No Node Tree found!")
        return{'CANCELLED'}
