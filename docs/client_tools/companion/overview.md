---
title: Companion app
summary: Instructions for using the Companion app.
authors:
    - Julian Mann
date: 2019-11-27
---

# Conductor companion app

## Introduction

The Conductor Companion App provides tools to help manage Conductor from your workstation. It contains a download manager to help retrieve your renders, and a submission toolkit for situations where a plugin submitter is not available for your host appication. 

--8<-- "client_tools/snippets/install_pointer.md"

### Submission kit

Conductor's render nodes have access to many more renderers and applications than those for which we provide native integrations. Some examples are Modo, Silhouette, and Blender. Previously, to use those tools on Conductor, you would need to write submission scripts using the Conductor Python API. The submission kit was introduced to be flexible enough to create almost any submission, while providing a GUI to make most of the tasks intuitive and accessible to non-programmers. Developers may also find the submission kit useful for rapid prototyping.

Use the examples below to get familiar with the submission kit. 

#### Submission kit examples

* [Blender submission kit example](blender.md)
* [Modo submission kit example](modo.md)
* [Silhouette submission kit example](silhouette.md)
* [Arnold Ass file submission kit example](ass.md)

#### Submission kit reference
* [Submission kit reference documentation](submitter.md)

!!!note
    If you want to make a regular submission with Maya, Nuke, or Clarisse, we suggest you use one of the native plugins.


### Download manager
* Retrieve your renders with the [Download manager](./downloader.md)
