---
title: Introduction
summary: Introduction to Conductor
authors:
    - Jesse Lehrman
date: 2019-11-27
---

# Introduction

Conductor is a cloud-based task management application, servicing media and entertainment users.

It enables 3D and compositing artists to have access to large storage and compute resources with minimal configuration, management, and training. From the artistâs point of view, Conductor should be seen as simply an extension of their local resources. Â It is our job to provide a stable and flexible platform which allows them to use cloud resources without changing the way they work.

By using public cloud compute and storage offerings, we can launch thousands of instances on-demand and make those resources available to a customer when they need them. As soon as all work is complete, those resources can be powered off and billing stops. Â Disk usage will continue and render instances have a minimum of 10 minutes. This scalable farm approach allows us to not focus as much on keeping 100% utilization across an entire farm all day, as we always have 100% utilization of the currently running instances.

Conductor is designed to feel very much like using a normal local render farm. It automates all of the difficult "cloud stuff" to create a familiar, effortless process. This isn't your average render service: no FTP uploads, no re-pathing your scene's dependencies, no manual downloads and no human intervention necessary! Our goal is for Conductor to live side-by-side with your local farm to provide additional capacity or, if you're starting anew, alleviate the need to ever have a local farm to begin with!

Simply launch the Conductor submitter plugin from within any supported application, set your render parameters such as frame range and desired machine type, and click "submit!" The submitter will find all dependencies for your scenes - be they models, textures, image sequences, etc. - and securely upload them to the cloud. If you've submitted the scene before, or some of your dependencies were created within Conductor (say, a 3D render going in to a Nuke comp), Conductor detects that it doesn't have to re-upload the things that are already in the cloud. Thanks to sophisticated data de-duplication, even files that have been moved or renamed won't need a re-upload! All file path mappings are handled with Conductor's back end, so no re-pathing of your files is necessary. Once the uploads are finished, your data will automatically synchronize to our high-performance cloud storage system and your render will begin. If no instances are already running, Conductor will create them on-demand. You'll be able to view your job's progress and control its tasks in Conductor's easy-to-use web interface. Once each frame finishes, it will be automatically downloaded back to the local location you'd originally specified at submission time. If the render instances that were started for your job don't have any other tasks to move on to, they're shut down and you're only billed for what you used.

Conductor can manage this process for hundreds or thousands of jobs at the same time, scaling massively to handle the most demanding tasks. If you're a power user, Conductor provides the capacity to upload custom scripts and plugins, replicates your environment variables, and allows you to tag your jobs with arbitrary metadata that you can run reports on later. Its API provides hooks to do all kinds of neat stuff, from cost reporting to job controls.

As a Conductor Tech user, you will fall into one of three categories.

Owner - Â The Owner is identified as the individual that establishes an Account and is responsible for the financial costs incurred during its use. The Owner can make changes at every level of an account, administrate projects and submit jobs. Rights level = Super.

Administrator - Assigned by the Owner, Administrators have the rights to add and change the status of users, monitor and manage cost limits and in the end archive and delete a project. Â Projects can have multiple Admins.

User - Invited by Administrators or Owners, Users are the submitters to the Conductor Service. Users will have the rights to start and restart Jobs/Tasks.

It is also important to understand the 4 components of the Conductor service.

Account â Your Account represents your studio. Â An Account can/will contain multiple Projects.

Project â Projects are containers for file organization, user administration and billing. Â Common files as well as all resulting renders are stored to a project. Users are invited at the project level and all the compute time they consume is billed to the project.

Job â Jobs are a user submittal initiated from the Client Tools within the design app. Each User will submit multiple jobs throughout the life of a project. 

Task â Each instance assigned during a Job submission is a Task. For example, 96 frames assigned in a job will result in 96 tasks.

When you first sign on and are getting used to Conductor, you'll be limited to 100 concurrently running machines or, as we call them in cloud-speak, instances. We put this limit in place to reduce your risk of accidentally overspending while you're still coming up to speed with how cost limits work, and discovering any unexpected kinks pertaining to how your scenes work in Conductor. We'll be happy to increase your instance limit up to 1,000 or more upon request to support@conductortech.com.