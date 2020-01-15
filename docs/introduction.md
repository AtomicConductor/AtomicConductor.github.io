#Introduction

**Conductor is a cloud-based task management application, dramatically easing the onramp to massive scale cloud resources for the Media and Entertainment Industry.**

### Architecture
Conductor enables studios and artists to have access to any scale of compute resources with minimal configuration, management, and training. We handle every size project, from render stills needing a single machine to big-budget films, leveraging hundreds of thousands of cores simultaneously. 

From the artist’s point of view, Conductor should be seen as simply an extension of their local environment. It is our job to provide a stable and extensible platform that allows them to use cloud resources without changing the way they work.


<figure class="image">
  <img src="/image/introduction/diagram.png">
  <figcaption>Figure 1: Conductor Architecture</figcaption>
</figure>


 
### Dynamic Scale 
By using multiple vendors for public cloud computing from AWS or GCP, we can launch tens of thousands of instances on-demand and make those resources available to a customer when they need them. As soon as all work is complete, resources can be powered off, providing the most cost-efficient usage. 

This just-in-time, scalable farm approach allows us to focus on the capacity needed for each shot, shifting away from the traditional attempts to maximize in-house or co-located resources, where studios constantly chase forecasts for finding peak future demand. We believe render demand should be accommodated down to the minute, based on render time, not on wasteful weekly or monthly forecasts.


<figure class="image">
  <img src="/image/introduction/graph.png">
  <figcaption>Figure 2: Usage Chart Showing Varied Bursts of Compute</figcaption>
</figure>


Conductor is designed to feel very much like using a normal local render farm. It automates all of the difficult "cloud stuff" to create a familiar, effortless process. This isn't your average render service: no FTP uploads, no re-pathing your scene's dependencies, no manual downloads and no human intervention necessary! Our goal is for Conductor to live side-by-side with your local farm to provide additional capacity or, if you're starting anew, alleviate the need to ever have a local farm to begin with!

 
<figure class="image">
  <img src="/image/introduction/viewport1.png">
  <figcaption>Figure 3: Maya Plugin for Shot Submissions</figcaption>
</figure>

### DCC Plugins
Simply launch the Conductor submitter plugin or custom submitter UI, set your render parameters such as frame range and desired machine type, and click "submit!" The submitter will find all dependencies for your scenes - be they models, textures, image sequences, etc. - and securely upload them to the cloud. 

If you've submitted the scene before, or some of your dependencies were created within Conductor (say, a 3D render going into a Nuke comp), Conductor detects that it doesn't have to re-upload assets that are already in the cloud. Thanks to sophisticated data de-duplication, even files that have been moved or renamed won't need a re-upload. All file path mappings are handled with Conductor's back end, so no re-pathing of your files is necessary. 

Once the uploads are finished, your data will automatically synchronize to our high-performance cloud storage system and your render will begin. If no instances are already running, Conductor will create them on-demand. 


### Web dashboard
You'll be able to view your job's progress and control its tasks in Conductor's easy-to-use web interface. Once each frame finishes, it will be automatically downloaded back to the location you'd originally specified at submission time or to another location through our new Companion App. If the render instances that were started for your job don't have any other tasks to move on to, they're shut down and you're only billed for what you used, down to the minute.

<figure class="image">
  <img src="/image/introduction/companion.png">
  <figcaption>Figure 4: Conductor Companion Download and Review</figcaption>
</figure>

### Flexibility
Conductor can manage this process for hundreds or thousands of jobs at the same time, scaling massively to handle the most demanding tasks. Even if you're not a power user, Conductor provides the capacity to upload custom scripts and plugins, replicates your environment variables, and allows you to tag your jobs with arbitrary metadata that you can run reports on later. Its API provides hooks to do all kinds of neat stuff, from cost reporting to job controls.

### Account Roles and Permissions

**As a Conductor user, you will fall into one or more of the following roles:**

1. Owner - The Owner is identified as the individual that establishes an Account and is responsible for the financial costs incurred during its use. The Owner can make changes at every level of an account, administrate projects and submit jobs. Rights level = Super.

2. Administrator - Assigned by the Owner, Administrators have the rights to add and change the status of users, monitor and manage cost limits and in the end archive and delete a project.  Projects can have multiple Admins.

3. User - Invited by Administrators or Owners, Users are the submitters to the Conductor Service. Users will have the right to start and restart Jobs/Tasks. 

<figure class="image">
  <img src="/image/introduction/dash.png">
  <figcaption>Figure 5: Account Administration Tabs</figcaption>
</figure>


### Hierarchy and Definitions

**It is important to understand the 4 components of the Conductor service.**


* **Account** – Your Account represents your studio. An Account contains multiple Projects.

* **Project** – Projects are containers for file organization, user administration, and billing.  Common files, as well as all resulting renders, are stored in a project. Users are invited at the project level and all the compute time they consume is billed to the project.

* **Job** – Jobs are a user submittal initiated from the client tools within the design app. A user will submit multiple jobs throughout the life of a project. 

* **Task** – Each instance assigned during a job submission is a task. For example, 96 frames assigned in a job will result in 96 tasks.

### Initial Use - Limits

When you first sign on and are getting used to Conductor, you'll be limited to 100 concurrently running machines or, as we call them in cloud-speak, instances. We put this limit in place to reduce your risk of accidentally overspending while you're still coming up to speed with how cost limits work and discovering any unexpected kinks about how your scenes work in Conductor. We're happy to remove your instance limit upon request to support@conductortech.com.