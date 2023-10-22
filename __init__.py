bl_info = {
    "name": "Titanfall 2 Model Adder",
    "author": "Interstellar",
    "version": (0, 5,1),
    "blender": (3, 3, 0),
    "location": "View3 > Interstellar Library",
    "description": "Add and modify all common models from Titanfall 2",
    "warning": "It's in Alpha phase, can cause crashes and long import times",
    "wiki_url": "I haven't made one lul",
    "category": "Add Mesh"
}
import bpy

from . import ModelImporter, GUI, Utils, AddonSettings 

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

    GUI.MainPanel,
    GUI.SpawnPilots,
    GUI.SpawnGuns,
    GUI.PerformanceSettings
]

def check_node_tree_on_startup(dummy):
    if Utils.node_tree_name in bpy.data.node_groups:
        Utils.node_tree_appendet = True

##########################################################################################################################
def register():
    
    bpy.utils.register_class(AddonSettings.TitanfallAdderSettings)
    
    bpy.types.Scene.Titanfall_adder_settings = bpy.props.PointerProperty(type=AddonSettings.TitanfallAdderSettings)
    


    for classItem in RegisterClasses[1:]:
       bpy.utils.register_class(classItem) 
    
    bpy.app.handlers.load_post.append(check_node_tree_on_startup)
   
    
def unregister():
    for classItem in RegisterClasses:
        bpy.utils.unregister_class(classItem)

    bpy.app.handlers.load_post.remove(check_node_tree_on_startup)

if __name__ == "__main__":
    bpy.context.view_layer.objects.active = None

    register()

    

