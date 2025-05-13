# Multi-Split-Container
Allow splitting elements into containers with the same size in the canvas rectangle.

<a href="https://www.buymeacoffee.com/twister" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174" border-radius="25"></a>

[![Godot Engine 4.3](https://img.shields.io/badge/Godot_Engine-4.x-blue)](https://godotengine.org/) ![ToolHack](https://img.shields.io/badge/Tool-Addon-green) ![Copyrights License](https://img.shields.io/badge/License-MIT-blue)

>[!NOTE]
>This plugin was initially created to be used by [Script-Spliter v0.2](https://github.com/CodeNameTwister/Script-Spliter) addon.

# Features
* Auto Split in columns by child node count. (Work on nodes with base as Control)
* Auto Split in rows by you max columns value setted.
* Lines Size/Color Changeables.
* Drag Button Size/Color Changeables.
* Drag Button Icon Changeables.
* Reset offset splited container on double click on line.
* Auto show content on focus.
* Smooth Expand Container.
* Custom Initial Offset.


# Preview
### Video Example Scene.
[![video preview](https://github.com/CodeNameTwister/Misc/blob/main/media/video/gd_msc.png?raw=true)](https://youtu.be/5JU3snjbRMU)
### Image Example Scene before/after move splited container by drag buttons.
![image_preview2](images/example_full.png)
### Image Example Scene 2 nested child.
![image_preview2](images/example_wchild.png)


# How Work
After enable this plugin, you can see the new node called **MultiSplitContainer**.

This node automatically creates a **SplitContainerItem** node that will be managed by **MultiSplitContainer** for split/resize.

# Nodes

>[!TIP]
>This nodes are extends by Control and work with any nodes type control.
>
>*example: Label, ColorRect, TextureRect, other controls...*
### MultiSplitContainer
This is the root and you can add any child node, this node auto add the child node to a new **SplitContainerItem**.

### SplitContainerItem
This node is created by **MultiSplitContainer** and you can add any child to this node.

##

>  You can put a issue request for bugs/changes and remember support me for more good things hey!

Copyrights (c) CodeNameTwister. See [LICENSE](LICENSE) for details.

[godot engine]: https://godotengine.org/

