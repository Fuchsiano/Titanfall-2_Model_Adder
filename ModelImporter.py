import math
import os
import re
import bpy

from . import Utils , AddonSettings
from mathutils import Vector

def generateColor(material, shader_node,color):


    image_node = None
    nodes = material.node_tree.nodes

    rgb_node = nodes.new(type='ShaderNodeRGB')
    rgb_node.outputs[0].default_value = color
    rgb_node.hide = True
    rgb_node.location = texture_pos_dict.get("RGB", Vector((0,0)))

    material.node_tree.links.new(rgb_node.outputs[0], shader_node.inputs["Blank Emission Color"])

    for node in material.node_tree.nodes:
        if node.type == 'TEX_IMAGE' and node.image.name.startswith("Blank_Emission"):
                image_node = node
                break
        
    if not image_node:
        return {'CANCELLED'}


    image_node.location = texture_pos_dict.get("Blank_Emission", Vector((0,0)))
    image_node.hide = True

    mix_node = nodes.new(type='ShaderNodeMixRGB')
    mix_node.blend_type = 'COLOR'
    mix_node.inputs['Fac'].default_value = 1.0
    mix_node.location = texture_pos_dict.get("Color", Vector((0,0)))
    mix_node.hide = True

    material.node_tree.links.new(image_node.outputs[0], mix_node.inputs["Color1"])
        
    material.node_tree.links.new(rgb_node.outputs[0], mix_node.inputs["Color2"])
    material.node_tree.links.new(mix_node.outputs[0], shader_node.inputs["Emission input"])

    print("Changed Color on: " + material.name)

def CleanModelAfterImport(model_type,model_name,model_subtype):
        
        tf_settings = bpy.context.scene.Titanfall_adder_settings

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
                
                if  "Scene Collection" in coll.name:
                    continue
                
                collections_to_delete_later.append(coll)

            coll_target.objects.link(obj)

            if re.search(r"(physics|pete_mri|headshot|legs)", obj.name,re.IGNORECASE):
                bpy.data.objects.remove(obj)

        for coll_deleting in collections_to_delete_later:
            if coll_deleting is not coll_target:
                print(f"Deleted collection: {coll_deleting.name}")
                bpy.data.collections.remove(coll_deleting)
        
        #--------------------------------------------------------        
        # Rotation && scale
        #--------------------------------------------------------

        # Scale the object to 0.01 on all axes
        #TODO: tried using 0.025352 because the scaling is scuffed in newer Blender source tool version. Working on fix
        # Used to be this scale but something broke while upgrading to the new blender version :/ 

        #defaultScaleFactor = (0.01, 0.01, 0.01)
        defaultScaleFactor = tf_settings.import_scale
        
        if model_subtype == "Gun_new":
            bone_names_to_keep = ["muzzle_flash","shell", "Def_c_magazine", "def_c_proscreen", "ja_ads_attachment", "def_c_bolt", "def_c_sight_on", "ja_c_propGun", "weapon_bone"]
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
                    

                    obj.scale = defaultScaleFactor
                    bpy.ops.object.transform_apply(scale=True,rotation=True)
                    obj.name = model_type + "/" + model_name + "/" + model_subtype
                
                    if tf_settings.weapon_Origin: 
                        bpy.ops.object.gun_set_origin()

                if not tf_settings.weapon_Origin:     
                    bpy.ops.object.origin_set(type="ORIGIN_GEOMETRY")

        elif model_subtype == "Gun_old":
            for obj in bpy.context.selected_objects:
                if "skeleton" in obj.name:
                    obj.rotation_euler = (math.radians(90.0), math.radians(0.0), math.radians(0.0))
                    obj.scale = defaultScaleFactor
                    bpy.ops.object.transform_apply(scale=True,rotation=True)      
                    obj.name = model_type + "/" + model_name + "/" + model_subtype

            if tf_settings.weapon_Origin: 
                bpy.ops.object.gun_set_origin()
        
        for obj in bpy.context.selected_objects:

            if "skeleton" in obj.name:
                obj.rotation_euler = (math.radians(90.0), math.radians(0.0), math.radians(0.0))
                obj.scale = defaultScaleFactor
                bpy.ops.object.transform_apply(scale=True,rotation=True)      
                obj.name = model_type + "/" + model_name + "/" + model_subtype



texture_pos_dict = {}
texture_pos_dict["Diffuse_map"] = Vector((-456.2249, -80.7665))
texture_pos_dict["AO_map"] = Vector((-453.5826, -112.5437))
texture_pos_dict["Specular_map"] = Vector((-452.2580, -152.2646))
texture_pos_dict["Glossiness_map"] = Vector((-452.2579, -190.6617))
texture_pos_dict["Cavity_map"] = Vector((-453.5802, -231.7069))
texture_pos_dict["Normal_map"] = Vector((-452.1403, -283.6068))
texture_pos_dict["Color"] = Vector((-174.5535, -564.0383))
texture_pos_dict["Blank_Emission"] = Vector((-514.4103, -635.5396))
texture_pos_dict["RGB"] = Vector((-460.1884, -716.3024))


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
        print(tex_base_dir)
        print("No Mat dir. skip!")
        return {'CANCELLED'}
                       
    print("\nDir: " + tex_base_dir)
                    
    #per file in directory
    for file_name in os.listdir(tex_base_dir):
                        
        print( "Found file: " + file_name.split(".")[0])
                        
        #Filter files I cant deal with
        if file_name.startswith("0x") or not file_name.endswith(".png"):
            print("useless file found " + file_name +" ! \n")
            continue
                        
        image_node  = node_tree.nodes.new("ShaderNodeTexImage")
        image_node.image = bpy.data.images.load(tex_base_dir + "/" + file_name)

        image_node.location = texture_pos_dict.get(file_name.split(".")[0], Vector((0,0)))
        image_node.hide = True

        output_socket = image_node.outputs["Color"]

        try:
            input_socket = shader_node.inputs[file_name.split(".")[0].replace("_", " ")]                
            node_tree.links.new(output_socket, input_socket)
        except:
            print("")
            print("Was not able to add " + file_name)
            print(file_name + " is probably not named correctly")
            print("")
            self.report({'WARNING'}, 'The model was not imported correctly')
    print()
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
    
    if not os.path.exists(textureDir):
        textureDir = Utils.addon_base_path + "Sights/" + material.name.split(".")[0]
    
    if not os.path.exists(textureDir):
        textureDir = Utils.addon_base_path + model_type + "/" + model_name + "/" + material.name.split(".")[0]

    return textureDir;

class Model_importer(bpy.types.Operator):
    """Spawns the specified Model to the Origin Point !!!CAN FEEZE BLENDER FOR A TIME"""
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
             Utils.node_tree_appended = True
        
        print();
        print("Spawning "+ self.model_name +"....")

        directory_to_subtype = Utils.addon_base_path  + self.model_type + "/" + self.model_name + "/" + self.model_subtype
        file_type = ".qc"
        
        # Get the file path
        qc_file_path = next((os.path.join(directory_to_subtype, file) for file in os.listdir(directory_to_subtype) if file.endswith(file_type)),None)
        
        if not qc_file_path:
            print("qc File not found in path: " + directory_to_subtype);
            return {'CANCELLED'}


        bpy.ops.import_scene.smd(filepath=qc_file_path,doAnim=False)
        

        CleanModelAfterImport(self.model_type,self.model_name,self.model_subtype)

        #--------------------------------------------------------        
        # Texturing
        #--------------------------------------------------------
        
        # Use the appended NodeTree in the active material's node tree
        print("Going through " + str(len(bpy.context.selected_objects)) + " Objects")
        
        materials_created_this_import = []

        #Object space
        for obj in bpy.context.selected_objects:
            
            print("")
            print( "Number of materials " + str(len(obj.material_slots)) + " On obj " + obj.name)
            print("")
            
            #Material in object space
            for slot in obj.material_slots:
                material = slot.material
                
                is_duplicate = False
                for wasCreated in materials_created_this_import:
                    if wasCreated.name.split('.')[0] == material.name.split('.')[0]:
                        slot.material = wasCreated
                        is_duplicate = True
                        break

                if is_duplicate:
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
                    
                    #this gets a special method for unlinking  a single material without duplicate check! 
                    Utils.UnlinkMaterial.unlink_material(slot)
                    
                    materials_created_this_import.append(slot.material)

                elif tf_settings.import_method == AddonSettings.ImportMethods.USE_SINGLE_MATERIALS.name:
                    print("\n Using same material for new model")
                    
                    bpy.ops.object.visor_recolor()
                else:
                    #when ImportMethods == ALWAYS_IMPORT_MATERIALS or something went wrong -> Full import
                    newMaterialCopy = material.copy()
                    materials_created_this_import.append(newMaterialCopy)
                    CleanForReTexturing(newMaterialCopy)

                    textureDir = GetTexturePath(material,self.model_type,self.model_name)

                    FullTextureImport(textureDir,newMaterialCopy,self)
                    slot.material = newMaterialCopy
                        
        #Recolor outside of object loop on copy so it doesn't effect the single Material which it would do inside the loop           
        if tf_settings.import_method == AddonSettings.ImportMethods.COPY_MATERIALS.name:  
            bpy.ops.object.visor_recolor()
            
        print("Materials created : " + str(len(materials_created_this_import)))
        #print([m for m in materials_created_this_import])
        bpy.ops.view3d.view_selected()
        materials_created_this_import.clear()
        print("Spawning "+ self.model_name +" Done!")
        print("_________________________________________________________________")
        return {'FINISHED'}



class Model_ReTexture(bpy.types.Operator):
    """Tries to use the armature name to re-texture the selected objects"""
    bl_idname = "object.model_retexture"
    bl_label = "spawn Pilot Models"

    def execute(self, context):
        model_type = ""
        model_name = ""
        
        print()
        print("Starting re-import...")

        for obj in context.selected_objects:
            if obj.type == 'ARMATURE':
                print("_________________________________________________________________")
                print("currently re-importing " + obj.name + " ...")
                model_type = obj.name.split("/")[0]
                model_name = obj.name.split("/")[1]
                for child in obj.children:
                    for material_slot in child.material_slots:
                        CleanForReTexturing(material_slot.material)
                        textureDir = GetTexturePath(material_slot.material,model_type,model_name)
                        FullTextureImport(textureDir,material_slot.material,self)
        
        if model_type == "":
            self.report({"ERROR"}, "was not able to find / get any names from armatures. Its was either renamed or not selected.")
            return {'CANCELLED'}
    
        print("done!")
        return {'FINISHED'}
