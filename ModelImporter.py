import math
import os
import re
import bpy

from . import Utils , AddonSettings





def generateColor(material, shader_node,color):


    image_node = None
    nodes = material.node_tree.nodes

    rgb_node = nodes.new(type='ShaderNodeRGB')
    rgb_node.outputs[0].default_value = color


    material.node_tree.links.new(rgb_node.outputs[0], shader_node.inputs["Blank Emission Color"])

    for node in material.node_tree.nodes:
        if node.type == 'TEX_IMAGE' and node.image.name.startswith("Blank_Emission"):
                image_node = node
                break
        
    if not image_node:
        return {'CANCELLED'}


    mix_node = nodes.new(type='ShaderNodeMixRGB')
    mix_node.blend_type = 'COLOR'
    mix_node.inputs['Fac'].default_value = 1.0

    material.node_tree.links.new(image_node.outputs[0], mix_node.inputs["Color1"])
        
    material.node_tree.links.new(rgb_node.outputs[0], mix_node.inputs["Color2"])
    material.node_tree.links.new(mix_node.outputs[0], shader_node.inputs["Emission input"])

    print("Changed Color on: " + material.name)

def CleanModelAfterImport(model_type,model_name,model_subtype):
        #--------------------------------------------------------        
        # Collections
        #--------------------------------------------------------

        # new name for the collection
        new_name = model_name + "/" + model_subtype
        
        # Check if the new name already exists
        if new_name in bpy.data.collections:
            # Choose a unique name by appending a number
            counter = 1
            while new_name + str(counter) in bpy.data.collections:
                counter += 1
            new_name = new_name + str(counter)
        
        scene = bpy.context.scene
        coll_target = bpy.data.collections.new(new_name)
        scene.collection.children.link(coll_target)
        print("Linking to collection " + coll_target.name)
        
        # Go through all selected objects and unparent them to later set them to the last collection
        collections_to_delete_later = []
        
        for obj in bpy.context.selected_objects:
            for coll in obj.users_collection:
                coll.objects.unlink(obj)
                collections_to_delete_later.append(coll)

            coll_target.objects.link(obj)

            if re.search(r"(physics|pete_mri|headshot|legs)", obj.name,re.IGNORECASE):
                bpy.data.objects.remove(obj)

        for coll_deleting in collections_to_delete_later:
            if coll_deleting is not coll_target:
                print(f"Deleted collection: {coll_deleting.name}")
                bpy.data.collections.remove(coll_deleting)
        
        #--------------------------------------------------------        
        # Rotation
        #--------------------------------------------------------
        if model_subtype == "Gun_new":
            bone_names_to_keep = ["muzzle_flash", "Def_c_magazine", "def_c_proscreen", "ja_ads_attachment", "def_c_bolt", "def_c_sight_on", "ja_c_propGun", "weapon_bone"]
            for obj in bpy.context.selected_objects:
                if obj.type == "ARMATURE":

                    # Create a set of bone names to efficiently check inclusion
                    bone_names_set = set(bone_names_to_keep)

                    bpy.context.view_layer.objects.active = obj
                    # Change context mode to 'POSE'
                    bpy.ops.object.mode_set(mode='EDIT')

                    for edit_bone in obj.data.edit_bones:
                        if edit_bone.name not in bone_names_set:
                            # Select and delete the bone from the pose
                            print("Bone removed: " + edit_bone.name)
                            edit_bone.select = True
                            bpy.ops.armature.delete()

                        else:
                            
                            edit_bone.select = False


                    bpy.ops.object.mode_set(mode='OBJECT')
                    # Update the view layer to see the changes
                    bpy.context.view_layer.update()
                    
                    obj.location = bpy.context.scene.cursor.location
                    obj.rotation_euler = (math.radians(90.0), math.radians(0.0), math.radians(0.0))
                    obj.scale = (0.1, 0.1, 0.1)
                    bpy.ops.object.transform_apply(scale=True,rotation=True)
                    obj.name = model_type + "/" + model_name + "/" + model_subtype
                
                bpy.ops.object.origin_set(type="ORIGIN_GEOMETRY")

        elif model_subtype == "Gun_old":
            for obj in bpy.context.selected_objects:
                if "skeleton" in obj.name:
                    obj.rotation_euler = (math.radians(90.0), math.radians(0.0), math.radians(0.0))
                    # Scale the object to 0.1 on all axes
                    obj.scale = (0.1, 0.1, 0.1)
                    bpy.ops.object.transform_apply(scale=True,rotation=True)      
                    obj.name = model_type + "/" + model_name + "/" + model_subtype
        
        for obj in bpy.context.selected_objects:

            if "skeleton" in obj.name:
                obj.rotation_euler = (math.radians(90.0), math.radians(0.0), math.radians(0.0))
                # Scale the object to 0.1 on all axes
                obj.scale = (0.1, 0.1, 0.1)
                bpy.ops.object.transform_apply(scale=True,rotation=True)      
                obj.name = model_type + "/" + model_name + "/" + model_subtype



def FullTextureImport(tex_base_dir,material,self):

    material.use_nodes = True
    node_tree = material.node_tree
    tf_settings = bpy.context.scene.Titanfall_adder_settings

    appended_node_tree = bpy.data.node_groups[Utils.node_tree_name]
    shader_node = node_tree.nodes.new("ShaderNodeGroup")
    shader_node.node_tree = appended_node_tree
    
    # Remove the Principled BSDF node if it exists
    principled_node = next((node for node in node_tree.nodes if isinstance(node, bpy.types.ShaderNodeBsdfPrincipled)), None)
    if principled_node:
        node_tree.nodes.remove(principled_node)
                        
    # Find the output node
    output_node = next((node for node in node_tree.nodes if isinstance(node, bpy.types.ShaderNodeOutputMaterial)), None)
    if output_node and shader_node:
        # Connect S/G-Blender node to the output node
        output_socket = output_node.inputs["Surface"]
        bsdf_socket = shader_node.outputs["BSDF"]
                        
        node_tree.links.new(output_socket, bsdf_socket)
                        
    # Apply Textures               
    if not os.path.exists(tex_base_dir):
        # os.path.exists("C:\Users\fuchs\AppData\Roaming\Blender Foundation\Blender\3.3\scripts/addons/Titanfall 2_Model_Adder/Models/Guns/Volt/hemlock_smg")
        print(tex_base_dir)
        print("No Mat dir. skip!")
        return {'CANCELLED'}
                        
    print("Dir: " + tex_base_dir)
                    
    #per file in directory
    for file_name in os.listdir(tex_base_dir):
                        
        print( "Found file: " + file_name.split(".")[0])
                        
        #Filter files I cant deal with
        if file_name.startswith("0x") or not file_name.endswith(".png"):
            print("useless file found " + file_name +" !")
            continue
                        
        image_node  = node_tree.nodes.new("ShaderNodeTexImage")
        image_node.image = bpy.data.images.load(tex_base_dir + "/" + file_name)
                        
        output_socket = image_node.outputs["Color"]

        try:
            input_socket = shader_node.inputs[file_name.split(".")[0].replace("_", " ")]                
            node_tree.links.new(output_socket, input_socket)
        except:
            print("")
            print("Was not able to add " + file_name)
            print(file_name + " is probably not named correctly")
            print("")
            self.report({'WARNING'}, 'The model was not importet correctly')

    if ("_b" in material.name and tf_settings.body_color) or ("_he" in material.name and tf_settings.helmet_color) or ("_j" in material.name and tf_settings.jumpkit_color):
        generateColor(material,shader_node,tf_settings.light_color)
                      
def CleanForReTexturing(material):
    node_tree = material.node_tree
    material_output_node = None


    for node in node_tree.nodes:
        if node.type == 'OUTPUT_MATERIAL':
            material_output_node = node
            break

    if material_output_node:
        # Delete all nodes except the Material Output node
        for node in node_tree.nodes:
            if node != material_output_node:
                node_tree.nodes.remove(node)


def GetTexturePath(material,model_type,model_name) -> str:
    
    textureDir = Utils.addon_base_path + model_type + "/" + model_name + "/" + material.name.split(".")[0]
          
    if model_type.startswith("Gun")  and ("sight" in material.name or "scope" in material.name or "optic" in material.name or "pro_screen" in material.name or "aog" in material.name):
        textureDir = Utils.addon_base_path + "Sights/" + material.name.split(".")[0]

    return textureDir;

class Model_importer(bpy.types.Operator):
    bl_idname = "wm.model_importer"
    bl_label = "spawn Pilot Models"

    model_type : bpy.props.StringProperty()
    model_name: bpy.props.StringProperty()
    model_subtype: bpy.props.StringProperty()


    def execute(self, context):

        tf_settings = context.scene.Titanfall_adder_settings

        if not Utils.node_tree_name in bpy.data.node_groups:
            bpy.ops.object.sg_blender_importer()
            print("Node tree not appended :(")
            self.report({"ERROR"}, "Append Node tree first")
            return {'CANCELLED'}
        else:
             Utils.node_tree_appendet = True
        
        print("Spawning "+ self.model_name +"....")

        directory_to_subtype = Utils.addon_base_path  + self.model_type + "/" + self.model_name + "/" + self.model_subtype
        file_type = ".qc"
        
        # Get the file path
        qc_file_path = next((os.path.join(directory_to_subtype, file) for file in os.listdir(directory_to_subtype) if file.endswith(file_type)),None)
        
        if not qc_file_path:
            print("qc File not found");
            return {'CANCELLED'}


        bpy.ops.import_scene.smd(filepath=qc_file_path,doAnim=False)
        

        CleanModelAfterImport(self.model_type,self.model_name,self.model_subtype)

        #--------------------------------------------------------        
        # Texturing
        #--------------------------------------------------------
        
        # Use the appended NodeTree in the active material's node tree
        print("Going through " + str(len(bpy.context.selected_objects)) + " Objects")
        
        materials_created_this_import = []

        #Object spcae
        for obj in bpy.context.selected_objects:
            
            print("")
            print( "Number of materials " + str(len(obj.material_slots)) + " On obj " + obj.name)
            print("")
            
            #Material in object space
            for slot in obj.material_slots:
                material = slot.material
                
                is_douplicate = False
                for wasCreated in materials_created_this_import:
                    if wasCreated.name.split('.')[0] == material.name.split('.')[0]:
                        slot.material = wasCreated
                        is_douplicate = True
                        break

                if is_douplicate:
                    continue
                
                # if Single material is not build full import
                material.use_nodes = True
                node_tree = material.node_tree
                sg_blender_nodes = [node for node in node_tree.nodes if node.type == 'GROUP' and node.node_tree.name == Utils.node_tree_name]
                
                if not sg_blender_nodes:
                    materials_created_this_import.append(material)
                    textureDir = GetTexturePath(material,self.model_type,self.model_name)
                    
                    FullTextureImport(textureDir,material,self)
                    continue

                if tf_settings.import_method == AddonSettings.ImportMethods.COPY_MATERIALS.name:
                    bpy.ops.object.unlink_selected()
                    bpy.ops.object.visor_recolor()

                elif tf_settings.import_method == AddonSettings.ImportMethods.USE_SINGLE_MATERIALS.name:
                    print("Using same material for new model")
                    
                    bpy.ops.object.visor_recolor()
                else:
                    #when ImportMethods == ALWAYS_IMPORT_MATERIALS or something went wrong full import
                    newMaterialCopy = material.copy()
                    materials_created_this_import.append(newMaterialCopy)
                    CleanForReTexturing(newMaterialCopy)

                    textureDir = GetTexturePath(material,self.model_type,self.model_name)

                    FullTextureImport(textureDir,newMaterialCopy,self)
                    slot.material = newMaterialCopy
                        
                        
                    
        print("Materials created : " + str(len(materials_created_this_import)))
        print([m for m in materials_created_this_import])
        materials_created_this_import.clear()
        
        
        return {'FINISHED'}



class Model_ReTexture(bpy.types.Operator):
    bl_idname = "object.nodel_retexture"
    bl_label = "spawn Pilot Models"

    def execute(self, context):
        model_type = ""
        model_name = ""
        
        print()
        print("Starting re-import...")

        for obj in bpy.context.selected_objects:
            if obj.type == 'ARMATURE':
                print("currtently re-importing " + obj.name + " ...")
                model_type = obj.name.split("/")[0]
                model_name = obj.name.split("/")[1]
                for child in obj.children:
                    for material_slot in child.material_slots:
                        CleanForReTexturing(material_slot.material)
                        textureDir = GetTexturePath(material_slot.material,model_type,model_name)
                        FullTextureImport(textureDir,material_slot.material,self)
        
        if model_type == "":
            self.report({"ERROR"}, "was not able to find / get name from armature. Its was either renamed or not selected.")
            return {'CANCELLED'}
    
        print("done!")
        return {'FINISHED'}
