---
title: Submission kit reference
summary: Reference documentation for the submission kit.
authors:
    - Julian Mann
date: 2019-05-02
---

# Submission kit reference

This document fully describes the Submission Kit features. 

If you are looking to get up and running quickly, check out some of the hands-on tutorials. The Blender example takes just 5 minutes to complete and doesn't require Blender. If you have Maya installed, you can try the more complex Arnold Ass example.

## Introduction

There are several ways to submit jobs to Conductor. You can use tools embedded in your DCC, integrations with other dispatchers like Tractor, or you can construct submissions through the Python API. In all cases, the data sent from your computer to the cloud follows the same format. It describes tasks to be carried out, hardware to run on, the software required to run them, and the environment in which to process.

The **General**, **Files**, **Software**, and **Advanced** panels in the Submission Kit give you control over these properties and help you to construct a valid submission for any host DCC without the need to write code. You can view the raw submission object at any time in the **Preview** panel before submitting it to the farm.




The sections below cover each of these panels in detail.

## The General tab

![general][general]

---
#### Job title
A title to identify your job in the Conductor web dashboard.

---
#### Conductor Project
The project helps you to organize your submissions. The menu is populated when the companion app is started. If you add a project via the web dashboard after the companion app started, you'll need to restart it.

---
#### Frames
The **Frames** field provides a set of numbers to use in the task command. To specify frames, enter a list of arithmetic progressions.  In most cases, this will be a simple range like `1-100`. It's also possible to specify any arbitrary set of numbers in this way. Use spaces and/or commas to separate each progression. Example:

```1,7,10-20, 30-60x3,  1001 1050```

If you specify frames incorrectly, you'll find that no tasks are generated. See the **Preview** tab to check task generation.

See the Task template section to understand how frames are used to construct task commands.

---
#### Chunk Size
A chunk is the set of frames handled by one task. If for example **Chunk size** is 4 and there are a 100 frames, then 25 chunks are generated. If the **Tiles** field is not being used, then there will be one task generated per chunk.

---
#### Tiles
The **Tiles** field allows you to split a large render into smaller pieces. For every chunk of frames, a task is generated for each tile number. You specify tiles in exactly the same way you specify frames. To generate 9 tile numbers for example, enter `1-9`

---
#### Scout Frames
Scout frames are numbers that indicate a set of tasks to to render immediately. When the submission reaches Conductor, only those tasks containing the specified scout frames are started. Other tasks are set to a holding state.

!!!note
    If **chunk_size** is greater than one, then you may find extra frames are rendered that were not listed as scout frames. The smallest unit of execution is a task, and there is no way to specify that part of a task should be started and another part held.

---
#### Instance type
Specify the hardware configuration used to run your job. Higher specification instances are potentially faster and able to handle heavier scenes. You are encouraged to run tests to find the most cost-efficient combination that meets your deadline.

---
#### Preemptible
Preemptible instances are less expensive to run than non-preemptible. The drawback is that they may be stopped at any time by the cloud provider. The probability of an instance being preempted rises with the duration of the task. Conductor does not support checkpointing, so if a task is preempted it is started from scratch on another instance.

---
#### Retries
Set the number of times to retry a failed task.

---
#### Output path
Specify the location where files are written to. When tasks are complete, you'll be able to download any rendered files to this folder on your computer. 

There are some constraints to be aware of.
1. All files produced by the job must be written to a location below the output-path or they won't be available.
2. None of the assets you upload may exist anywhere below the output path. 

!!!note
    Conductor uses a read-only disk to make inoput assets available. It also provides a writable space for output files on a different disk. The paths for these two spaces are mounted on the render node and must not conflict with each other.

---
#### Task template
Use this text area to construct the commands to run on remote instances. To generate a list of different commands, for example, `render -f1, render -f2, .... render -f100`, there are a set of tokens that can be used to produce different values in each task. These values are derived from the Frames, Chunk size, and Tiles fields mentioned earlier. Tokens must be wrapped in angle brackets **&lt;...&gt;** 


1. **&lt;chunk_start&gt;** provides the first value of each chunk. If **Chunk size** is set to 1 then *chunk* 



[general]: ../../image/companion/general_blender2.png
