from cgitb import text
import bpy
from. import ModelImporter , Utils , AddonSettings

class MainPanel(bpy.types.Panel):
    bl_label = "Interstellar Library"
    bl_idname = "OBJECT_PT_MainPanel"
    bl_space_type = "VIEW_3D"
    bl_region_type = "UI"
    bl_category = "Interstellar Library"

    
    
    def draw(self, context):
        layout = self.layout

        node_tree_appendet = False

        if Utils.node_tree_name in bpy.data.node_groups:
            node_tree_appendet = True
        
        if not node_tree_appendet:
            
            row = layout.row()
            row.label(text="Click Append before spawning models", icon="ERROR")
            row = layout.row()
            row.operator(Utils.SG_Blender_importer.bl_idname, text="Append Node tree", icon="CONSOLE")
            row = layout.row()
            row.label(text="Append Tree First")
            return

        

        
        row = layout.row()
        row.label(text="Version: " + Utils.version_string)
        
        tf_settings = context.scene.Titanfall_adder_settings
        

        row = layout.row()

        box = layout.box()

        box.label(text="Texture Operations")
            
        row = box.row()
        row.separator()
        
        box.prop(tf_settings, "light_color", text="Pilot Color")
        box.prop(tf_settings,"helmet_color")
        box.prop(tf_settings,"body_color")
        box.prop(tf_settings,"jumpkit_color")
        
        row = box.row()
        row.separator()
        
        row.operator(Utils.ModelRecolor.bl_idname, text="Recolor Selected", icon="BRUSHES_ALL")
        
        row.separator() 
        row = box.row()     
        row.separator()

        row = box.row()              
        row.operator(Utils.UnlinkMaterial.bl_idname, text="Un-link Selected", icon="UNLINKED")

        row = box.row()
        row.operator(Utils.ReLinkMaterial.bl_idname,text="Re-link selected", icon="DECORATE_LIBRARY_OVERRIDE")

        row = box.row()
        row.operator(ModelImporter.Model_ReTexture.bl_idname,text="Re-import selected", icon="IMPORT")

        row = box.row()
        row.operator(Utils.GetObjectWith.bl_idname,text="print Dimensipons", icon="QUESTION")


        box = layout.box()
        row = box.row()
        box.label(text="Object Operations")
        
        row = box.row()
        row.operator(Utils.AddToHand.bl_idname, text="Add to hand", icon="CON_ARMATURE")
        
        row = box.row()
        row.operator(Utils.GunSetOrigin.bl_idname, text="gun set origin", icon="DECORATE_KEYFRAME")

##########################################################################################################################
class PerformanceSettings(bpy.types.Panel):
    bl_label = "Performance settings"
    bl_idname = "OBJECT_PT_Performance"
    bl_space_type = "VIEW_3D"
    bl_region_type = "UI"
    bl_category = "Interstellar Library"
    bl_parent_id = "OBJECT_PT_MainPanel"
    bl_options = {"DEFAULT_CLOSED"}
    
    @classmethod
    def poll(self, context):
        return Utils.node_tree_name in bpy.data.node_groups
    
    def draw(self, context):
        layout = self.layout
        tf_settings = context.scene.Titanfall_adder_settings

        importMethods = AddonSettings.ImportMethods


        row = layout.row()
        row.label(text="Select import method:")
        row = layout.row()
        row.prop(tf_settings, "import_method", text="")



        if  tf_settings.import_method == importMethods.USE_SINGLE_MATERIALS.name:
            row = layout.row()
            row.label(text="will use the same base Material")
            row = layout.row()
            row.label(text="fast load time")

        elif tf_settings.import_method == importMethods.COPY_MATERIALS.name:
            row = layout.row()
            row.label(text="will have a copy of the base Material")
            row = layout.row()
            row.label(text="slower load time")
        
        elif tf_settings.import_method == importMethods.ALWAYS_IMPORT_MATERIALS.name:
            row = layout.row()
            row.label(text="will always import from the ground up")
            row = layout.row()
            row.label(text="slowest load time")


        row = layout.row()
        row.operator(Utils.DeleteUnusedMaterials.bl_idname, text="Clear unused Materials ", icon="ORPHAN_DATA")

        row = layout.row()
        row.prop(tf_settings,"weapon_Origin", text= "set new origin on import")


##########################################################################################################################
class SpawnPilots(bpy.types.Panel):
    bl_label = "Spawn Pilots"
    bl_idname = "OBJECT_PT_SpawnPilots"
    bl_space_type = "VIEW_3D"
    bl_region_type = "UI"
    bl_category = "Interstellar Library"
    bl_parent_id = "OBJECT_PT_MainPanel"
    bl_options = {"DEFAULT_CLOSED"}
    
    @classmethod
    def poll(self, context):
        return  Utils.node_tree_name in bpy.data.node_groups
    
    def GeneratePilotButtons(self, context,p_class):
        
        layout = self.layout
        col = layout.box().column()
        col.label(text=p_class)
        row = col.row(align=True)
        operation = row.operator(ModelImporter.Model_importer.bl_idname, text= p_class+" m", icon="CONSOLE")
        operation.model_type = "Pilots"
        operation.model_name = p_class
        operation.model_subtype = "Male"

        operation = row.operator(ModelImporter.Model_importer.bl_idname, text= p_class + " f", icon="CONSOLE")
        operation.model_type = "Pilots"
        operation.model_name =  p_class
        operation.model_subtype = "Female"
        

    def draw(self, context):
        layout = self.layout
        
        
        row = layout.row()
        row.label(text="Spawn Pilots")
        
        
        self.GeneratePilotButtons(context,"Phase")
        self.GeneratePilotButtons(context,"Stim")
        self.GeneratePilotButtons(context,"Pulse")
        self.GeneratePilotButtons(context,"Holo")
        self.GeneratePilotButtons(context,"Grapple")
        self.GeneratePilotButtons(context,"Cloak")
        self.GeneratePilotButtons(context,"A-Wall")
        
    
    
##########################################################################################################################
class SpawnGuns(bpy.types.Panel):
    bl_label = "Spawn Guns"
    bl_idname = "OBJECT_PT_SpawnGuns"
    bl_space_type = "VIEW_3D"
    bl_region_type = "UI"
    bl_category = "Interstellar Library"
    bl_parent_id = "OBJECT_PT_MainPanel"
    bl_options = {"DEFAULT_CLOSED"}
    
    @classmethod
    def poll(self, context):
        return  Utils.node_tree_name in bpy.data.node_groups

    def generateGunButtons(self,box_ui,gun_class,subtype):
        
        
        col = box_ui.column()
        operation = col.operator(ModelImporter.Model_importer.bl_idname, text="Spawn "+gun_class, icon="CONSOLE")
        operation.model_type = "Guns"
        operation.model_name = gun_class
        operation.model_subtype = subtype

   

    def draw(self, context):
        layout = self.layout

        row = layout.row()
        row.label(text="Spawn Guns")
        box = layout.box()
        
        box.label(text="AR's")
        self.generateGunButtons(box,"R201","Gun_new")
        self.generateGunButtons(box,"R101","Gun_new")
        self.generateGunButtons(box,"Hemlok","Gun_new")
        self.generateGunButtons(box,"G2A5","Gun_new")
        self.generateGunButtons(box,"Flatline","Gun_new")

        box = layout.box()
        box.label(text="SMG's")
        self.generateGunButtons(box,"Car","Gun_old")
        self.generateGunButtons(box,"Alternator","Gun_new")
        self.generateGunButtons(box,"Volt","Gun_new")
        self.generateGunButtons(box,"R97","Gun_new")
        
        
        box = layout.box()
        box.label(text="LMG's")
        self.generateGunButtons(box,"Spitfire","Gun_new")
        
        # L star custom code because its broken
        col = box.column()
        operation = col.operator(ModelImporter.Model_importer.bl_idname, text="Spawn Lstar (broken)", icon="CONSOLE")
        operation.model_type = "Guns"
        operation.model_name = "Lstar"
        operation.model_subtype = "Gun_new"

        self.generateGunButtons(box,"Devotion","Gun_new")

        
        box = layout.box()
        box.label(text="Sniper's")

        self.generateGunButtons(box,"Kraber","Gun_new")
        self.generateGunButtons(box,"Double_Take","Gun_new")
        self.generateGunButtons(box,"DMR","Gun_new")

        
        box = layout.box()
        box.label(text="Shotgun's")
        self.generateGunButtons(box,"EVA-8","Gun_new")
        
        # custom Mustiff code
        col = box.column()
        operation = col.operator(ModelImporter.Model_importer.bl_idname, text="Spawn Mastiff (broken)", icon="CONSOLE")
        operation.model_type = "Guns"
        operation.model_name = "Mastiff"
        operation.model_subtype = "Gun_new"
        

        '''
        box = layout.box()
        box.label(text="Grenadier's")
        self.generateGunButtons(box,"Sidewinder","Gun_new")
        self.generateGunButtons(box,"EPG","Gun_new")
        self.generateGunButtons(box,"Softball","Gun_new")
        self.generateGunButtons(box,"Cold_war","Gun_new")

        box = layout.box()
        box.label(text="Pistol's")
        self.generateGunButtons(box,"W-man_Elite","Gun_new")
        self.generateGunButtons(box,"Mosambik","Gun_new")
        self.generateGunButtons(box,"RE-45","Gun_new")
        self.generateGunButtons(box,"P-2016","Gun_new")
        self.generateGunButtons(box,"Wingman","Gun_new")

        box = layout.box()
        box.label(text="AT's")
        self.generateGunButtons(box,"Charge_rfl","Gun_new")
        self.generateGunButtons(box,"Mag","Gun_new")
        self.generateGunButtons(box,"Thunderbold","Gun_new")
        self.generateGunButtons(box,"Archer","Gun_new")

        box = layout.box()
        box.label(text="MSC")
        self.generateGunButtons(box,"Pulse_Blade","Gun_new")
        '''