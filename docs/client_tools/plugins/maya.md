---
title: Maya submitter
summary: Instructions for using the Maya submitter.
authors:
    - Julian Mann
date: 2019-07-23
---

# Maya submitter

## Introduction

The Conductor submitter for Maya allows you to ship Arnold, Vray, or native Maya renders to Conductor. It handles a variety of plugins, such as Yeti, Xgen, Golaem crowd and so on.

## Installation

If you haven't already done so, [install Conductor client tools](../install.md). 

## Launch the submitter.
Once Conductor is installed you'll see a Conductor shelf containing a button. When you are ready to submit a render, click the shelf button to launch the submitter.

Alternatively, enter the following commands in a Python tab in the script editor:

```python
conductor import submitter_maya
submitter_maya.MayaConductorSubmitter.runUi()
```

!!!note
    You must have a scene loaded that exists on disk before the submitter can launch.

The submitter is divided into three tabs:

* General
* Advanced
* Job software

### General

Set the values specific to this submission.

![general][general]
 
--8<-- "client_tools/plugins/snippets/qt_general_options_1.md"

---
#### Render Layers
Specify the layers and cameras you want to render?

!!!note
    Conductor does not currently support Render Setup introduced in Maya 2016.5. As an interim workaround, you can set Maya to use Legacy Render Layers in Preferences->Rendering->Preferred Render Setup System

--8<-- "client_tools/plugins/snippets/qt_general_options_2.md"

### Advanced

Set the download location and notification email addresses.

![advanced][advanced]
 
--8<-- "client_tools/plugins/snippets/qt_advanced.md"
 
--8<-- "client_tools/plugins/snippets/qt_software_1.md"

![job][job]
   
--8<-- "client_tools/plugins/snippets/qt_software_2.md"

--8<-- "client_tools/plugins/snippets/qt_reset.md"

--8<-- "client_tools/plugins/snippets/qt_submit.md"

![submitted][submitted]

[general]: ../../image/maya/general.png
[advanced]: ../../image/maya/advanced.png
[job]: ../../image/maya/job.png
[submitted]: ../../image/maya/submitted.png
 
