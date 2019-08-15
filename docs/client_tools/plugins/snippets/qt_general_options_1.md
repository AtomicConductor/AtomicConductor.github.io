---
#### Frame Range
The **start**, **end**, and **step** values that specify the range to render.

---
#### Frame Chunk Size
A **chunk** is the set of frames handled by one task. If your renders are fast but loading the scene is slow, it may make sense to render many frames per task. If this is the case, set **chunk size** to a value greater than one.

---
#### Instance Type
Specify the hardware configuration used to run your tasks. Higher specification instances are potentially faster and able to handle heavier scenes. You are encouraged to run tests to find the most cost-efficient combination that meets your deadline.
 
---
#### Preemptible
Preemptible instances are less expensive to run than non-preemptible. The drawback is that they may be stopped at any time by the cloud provider. The probability of an instance being preempted rises with the duration of the task. Conductor does not support checkpointing, so if a task is preempted it is started from scratch on another instance. For this reason, yoo are encouraged to specify non-preemptible instances if your renders take several hours.

!!!note
    It is possible to change the preemptible setting in the web dashboard after the job has been submitted.

---
#### Project
The Conductor project allows you to track usage and set cost limits on a project by project basis.
