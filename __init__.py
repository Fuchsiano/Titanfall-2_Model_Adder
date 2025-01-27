bl_info = {
    "name": "Titanfall 2 Model Adder",
    "author": "Interstellar",
    "version": (0, 6, 0),
    "blender": (3, 3, 0),
    "location": "View3 > Titanfall2 Library",
    "description": "Add and modify all common models from Titanfall 2",
    "warning": "It's in Alpha phase, can cause crashes and long import times",
    "wiki_url": "I haven't made one lul",
    "category": "Add Mesh"
}
import bpy
import os
from . import ModelImporter, GUI, Utils, AddonSettings 
import glob

RegisterClasses = [
    
    AddonSettings.TitanfallAdderSettings,
    
    ModelImporter.Model_importer,
    ModelImporter.Model_ReTexture,

    Utils.SG_Blender_importer,
    Utils.ModelRecolor,
    Utils.UnlinkMaterial,
    Utils.ReLinkMaterial,
    Utils.DeleteUnusedMaterials,
    Utils.GetObjectWith,
    Utils.AddToHand,
    Utils.GunSetOrigin,
    Utils.NewArmature,
    Utils.KeyframeModelRecolor,
    Utils.SetBackgroundTransparent,

    GUI.MainPanel,
    GUI.SpawnPilots,
    GUI.SpawnGuns,
    GUI.SpawnMisc,
    GUI.PerformanceSettings
]

def check_node_tree_on_startup(dummy):
    if Utils.node_tree_name in bpy.data.node_groups:
        Utils.node_tree_appended = True

##########################################################################################################################
def register():
    
    bpy.utils.register_class(AddonSettings.TitanfallAdderSettings)
    
    bpy.types.Scene.Titanfall_adder_settings = bpy.props.PointerProperty(type=AddonSettings.TitanfallAdderSettings)
    


    for classItem in RegisterClasses[1:]:
       bpy.utils.register_class(classItem) 
    
    Utils.version_string = ".".join(map(str, bl_info["version"]))

    Utils.addon_core_path = bpy.utils.user_resource('SCRIPTS') + r"/addons/Titanfall-2_Model_Adder-" + "_".join(map(str, bl_info["version"]))
    
    filePathForMasterVersionImport =  bpy.utils.user_resource('SCRIPTS') + r"/addons/Titanfall-2_Model_Adder-master"
    print()
    print("===================================================================")
    print(bl_info["name"])
    print("===================================================================")
    print()
    print("trying to link version to dir...")

    if os.path.exists(Utils.addon_core_path):
        Utils.addon_base_path = bpy.utils.user_resource('SCRIPTS') + r"/addons/Titanfall-2_Model_Adder-" + "_".join(map(str, bl_info["version"])) + "/Models/"
        print("found link for version " + Utils.version_string)

    elif os.path.exists(filePathForMasterVersionImport):
        print("found link for version 'master'")
        Utils.addon_core_path = bpy.utils.user_resource('SCRIPTS') + r"/addons/Titanfall-2_Model_Adder-master" 
        Utils.addon_base_path = bpy.utils.user_resource('SCRIPTS') + r"/addons/Titanfall-2_Model_Adder-master/Models/"
    
    else:
        #when the path isn't found it means its ether a error getting the version or the Version less master
        print("Couldn't link dir to version.... Trying without version")
        Utils.addon_core_path = bpy.utils.user_resource('SCRIPTS') + r"/addons/Titanfall-2_Model_Adder/"
        Utils.addon_base_path = bpy.utils.user_resource('SCRIPTS') + r"/addons/Titanfall-2_Model_Adder/Models/"
        
        if not os.path.exists(Utils.addon_core_path):
            print("Failed!")
            print("Unable to find add-on dir. Cant run " + bl_info["name"])
            print("tried dir " + Utils.addon_core_path)
            print("Did you install the code only version without having a copy of the full version ?")
        else:
            print("Success! \n")
    bpy.app.handlers.load_post.append(check_node_tree_on_startup)
    print("your version directory is: " + Utils.addon_core_path)
    Utils.model_version_string = open( Utils.addon_base_path + 'Model_lib_Version.txt', 'r').read()
    
def unregister():
    for classItem in RegisterClasses:
        bpy.utils.unregister_class(classItem)

    bpy.app.handlers.load_post.remove(check_node_tree_on_startup)

if __name__ == "__main__":
    bpy.context.view_layer.objects.active = None

    register()

    

