import bpy
import enum

class ImportMethods(enum.Enum):
    USE_SINGLE_MATERIALS = 'use_single_materials'
    COPY_MATERIALS = 'copy_materials'
    ALWAYS_IMPORT_MATERIALS = 'always_import_materials'


class TitanfallAdderSettings(bpy.types.PropertyGroup):


    import_method : bpy.props.EnumProperty(items=[  (ImportMethods.USE_SINGLE_MATERIALS.name ,"single material"," only use one Material for all imports"),
                                                    (ImportMethods.COPY_MATERIALS.name,"copy materials"," copy from base Material"),
                                                    (ImportMethods.ALWAYS_IMPORT_MATERIALS.name ,"always import ","always import model from the ground up")])
    


    helmet_color: bpy.props.BoolProperty(name="Edit Helmet Color", default = True)
    
    body_color: bpy.props.BoolProperty(name="Edit Body Color", default = True)
    
    jumpkit_color: bpy.props.BoolProperty(name="Edit Jumpkit Color", default = True)
    
    light_color: bpy.props.FloatVectorProperty(name="Color",subtype='COLOR',default=(1.0, 1.0, 1.0, 1.0),size=4,min=0.0, max=1.0,description="Light Colors")

