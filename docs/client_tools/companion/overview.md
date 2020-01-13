---
title: Companion app
summary: Instructions for using the Companion app.
authors:
    - Julian Mann
date: 2019-11-27
---

# Conductor companion app

## Introduction

The Conductor Companion App provides tools to help manage Conductor from your workstation. It contains a download manager to help retrieve your renders and a submission toolkit for situations where a plugin submitter is not available for your host application. 

--8<-- "client_tools/snippets/install_pointer.md"

### Submission kit
While Conductor provides native integrations for Maya, Nuke, and Clarisse, we also provide other rendering applications. Some examples are Modo, Silhouette, and Blender. Previously you would need to write scripts using the Conductor Python API to render with those apps. The Submission Kit was introduced to help you create almost any submission without the need to write code. Developers may also find the submission kit useful for rapid prototyping.

!!!note
    If you want to make a regular submission with Maya, Nuke, or Clarisse, we suggest you use one of the native plugins.

#### Submission kit examples

* [Blender submission kit example](blender.md)
* [Modo submission kit example](modo.md)
* [Silhouette submission kit example](silhouette.md)
* [Arnold Ass file submission kit example](ass.md)

#### Submission kit reference
* [Submission kit reference documentation](submitter.md)



### Download manager
* Retrieve your renders with the [Download manager](./downloader.md)
