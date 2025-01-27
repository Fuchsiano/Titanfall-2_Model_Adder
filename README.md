
# Titanfall 2 Model Adder

A Blender Addon to Import prepared Titanfall 2 Models in one click.

> NOTE:
> This add-on is still in development and not all models / features are done yet.

## Table of Contents
* [Featur List](##features)
* [Install Guide](##installation)
* [Usage Guide](##using-the-add-on)
* [Update](##updating-the-addon)
* [Developed by](##developed-by)
* [Credits](##credits)


## Features
- Import all Guns and Pilots in on click (Titans to be coming Soon TM)
- Texture Operations. like changing pilot visor colors
- A system to bind Materials for a better performance

## Installation

first download Blender if you haven't already (supported version is 3.X)

[Blender 3.6](https://www.blender.org/download/releases/3-6/)

then pick a version from the release tab
 (after picking a version, download the "Source code Zip" for first install) 

[Titanfall 2 Model Adder version](https://github.com/Fuchsiano/Titanfall-2_Model_Adder/releases)

and a Blender add-on by Artfunkel (latest version 3.3 is currently not working but 3.2.6 works)

[Blender Source tool download](http://steamreview.org/BlenderSourceTools/archives/)

after installing the two add-ons as zip (don't unpack) you need to add both of them to Blender by going to  

``Edit>Preferences>Add-ons``
and clicking the install an add-on button on the top right of the menu.


## Using the add-on
After creating a new .blend file  open the Properties Shelf (aka n-panel) by pressing N on your keyboard and pressing  on the the Interstellar Library tab you need to Append Node tree from S/G Blender. This has to be done for every new .blend file.
Now you only have to click on the model you want in you scene

![tool showoff](./Images/Model_Adder.gif)

## Updating the Addon

>steps not needed if you are ok with downloading the entire model library again after every update  

When a new version is released there are two zips to chose from to update your addon version.
if the code version was updated download the ``CodeOnly.zip`` if the model data was updated download the ``ModelsOnly.zip``

Go to your blender addon path.
you can get your path by going to ``Window>Toggle System Console`` and looking up the line ``"your version directory is:"``
The following string will show you your addon Install directory

The addon path should end with either a version number (for example ``Titanfall-2_Model_Adder-0_5_2``) or the branch name
(``Titanfall-2_Model_Adder-Master``) these suffixes need to be removed, meaning you should change it to ``path/to/addon/Titanfall-2_Model_Adder``

you can now unpack your ``CodeOnly.zip`` or ``ModelsOnly.zip`` and replace the files in the  ``Titanfall-2_Model_Adder``
folder

## Developed by

- [Fuchsiano](https://github.com/Fuchsiano)
- [Neoministein](https://github.com/Neoministein)

## Credits 

To learn how to import the models from TF2 Itself go to

[This awesome web page by the Noskill community](https://noskill.gitbook.io/titanfall2/r2-ripping/model-ripping)

or 

[This cool Video by EyelessRook](https://youtu.be/CeO1w9Qe6MY?si=QOaywmcXoPgW1i9T)

When Creating this Add-on we basically did  the same and packed the resulting files in the Model folder to be used by this add-on.

