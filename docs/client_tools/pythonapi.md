---
title: Submit via the Python API
summary: Use Conductor libraries to submit a job
authors:
    - Julian Mann
date: 2019-05-02
---

# Submitting with the Python API

## Introduction

The Conductor client tools provide modules and classes to help you craft a submission in cases where a GUI submitter is not suitable.

## Installation

If you haven't already done so, [install Conductor client tools](./install.md). 


## Quick start

The Python code below demonstrates how to use the `Submit` class to create a command line job submission. 


```python 
import logging
from conductor.lib import conductor_submit, package_utils, api_client

# Set up logging (optional)
conductor_submit.set_logging(logging.DEBUG)

# Create a dictionary of arguments for your job.
args = {}

# Give the job a title to help identify it in the web dashboard. 
args["job_title"] = "Test Job: Vray Standalone Test"

# Specify the Conductor project to associate this job with.
args["project"] = "default"

# Specify the what type of instance to use.
args["machine_flavor"] = "standard"
args["cores"] = 2

# Specify the list of file dependencies the job requires. 
# This includes textures, caches, plugins, tools.
# You may add files or directories from anywhere on your filesystem.
args["upload_paths"] = [
    "/path/to/project/batman_0008.vrscene",
    "/path/to/project/batman_0024.vrscene",
    "/path/to/tools/custom_vray"
]

# Indicate that uploading should occur immediately. If this option is `False`, 
# it indicates that uploading will be handled by the Conductor uploader daemon. 
args["local_upload"] =  True

# If your job uses custom tools or plugins, you'll need to provide the necessary 
# environment so they can be found.
custom_environment = {
    "VRAY_PLUGINS_x64": "/path/to/tools/custom_vray/plugin",
    "LD_LIBRARY_PATH": "/path/to/tools/custom_vray/bin"
}

# Indicate which software packages should be made available for the job
# See the notes below for help on finding package IDs for each required 
# software package. 
args["software_package_ids"] = ["7208372e306614d514944938c395e0e7"]

# Request the packages that you want to use from Conductor. 
all_packages = api_client.request_software_packages() 
packages = [p for p in all_packages if p["package_id"] in args["software_package_ids"]]

# Merge the environments from your chosen packages with the custom environment. 
args["environment"] = package_utils.merge_package_environments(packages, base_env=custom_environment)

# Define the task data for the job. 
# Each Task entry defines a command to be excecuted. 
args["tasks_data"] = [ 
    {
        "command":"vray -display=0 -sceneFile=/path/to/project/batman_0008.vrscene -imgFile=/path/to/project/output/output.exr",
        "frames": "8"
    },
    {
        "command":"vray -display=0 -sceneFile=/path/to/project/batman_0024.vrscene -imgFile=/path/to/project/output/output.exr",
        "frames": "24"
    }
]

# Define the directory where rendered images can be found when tasks are complete.
args["output_path"] = "/path/to/project/output"

# Instantiate a Submit object with the job args.
submission = conductor_submit.Submit(args)

# Run the submission
response, response_code = submission.main()

# Inspect the response code
print response_code
# 201

# Inspect the response
print response
# {u'body': u'job submitted.',
#  u'jobid': u'00695',
#  u'status': u'success',
#  u'uri': u'/jobs/00695'}
```


#### Package Ids

Use the Python code below to find `package_id`s for the packages you require.  

``` python
from conductor.lib import api_client

packages = api_client.request_software_packages()
packages = sorted(packages, key=lambda x: x["relative_path"])
print "\n".join(["{} -- {}".format(p["package_id"], p["relative_path"]) for p in packages])
```

## Reference

The list below describes all available submission arguments.

#### autoretry_policy
 
Dictates auto-retry behavior for unsuccessful tasks. This is particularly useful for preemptible instances.

``` python
"autoretry_policy": { 
  "preempted": { "max_retries": 2 },  # when a task is preempted
  "failed":    { "max_retries": 1 }   # when a task fails
}
```

#### chunk_size

The number of frames to render per task.
``` python
"chunk_size": 15
```

#### cores

The number of cpu cores the instance will have (2 minimum for highmem and highcpu instance types)
``` python
"cores": 64
```

#### enforced_md5s

Only relevant when using the uploader daemon. Dictates md5 hash values that specific files must adhere to upon uploading via the uploader daemon. This is a mechanism to ensure that a file has not been modified between the time the job was submitted and the time the uploader daemon started to upload.
``` python
{"/tmp/my_maya_file.ma": "GDVem8GYRUuh4douZwIwFg=="}

```

#### environment

Specifies environment variables to be set om the render machine.
``` python
{"PYTHONPATH": "/tmp/site-packages:/tmp/pipeline/site-packages"}
```

#### job_title

The title displayed in the web dashboard.
``` python
"title": "My maya job"
```

#### local_upload

Dictates whether the submission will upload the job's dependencies immediately (True) or queue them for an uploader daemon to handle (False).
``` python
"local_upload": False
```

#### location

A string that indicates which location the job should be associated with. This option is relevant if you submit jobs from different locations. These could be differing geographic locations or simply machines that have differing file system views. 

Typically each location should have its own Conductor downloader and uploader daemons running. The location feature allows each daemon to target only jobs that match its corresponding location.
``` python
"location": "mars"
```

#### machine_flavor

The instance type to use for the job.  This works together with the cores argument. 
Valid options are:

* standard
* highcpu
* highmem
``` python
"machine_flavor": "highcpu"
```

#### metadata

Add custom metadata data to the job submission to help filter usage reports and so on.
``` python
"metadata": {"shot": "Ez500", "asset": "apple"}
```

#### notify

Emails addresses to be notified when the job is complete.

``` python
"notify": ["fred@flintstones.com", "wilma@flintstones.com"]
```

#### output_path

The directory where images and other output files are written. This is also the location on the local filesystem where files will be downloaded to.
``` python
"output_path": "/tmp/render_output"
```

#### preemptible

Whether the job uses preemptible instances.
``` python
"preemptible": True
```

#### priority

Specify whether this job should take preference over other jobs in your account.
``` python
"priority": 800
```

#### project

The name of the Conductor project to associate this job with.
``` python
    "project": "Spiderman"
```

#### scout_frame

Tasks that contain scout frames are run immediately, while the rest are put on hold.
``` python
"scout_frame": "1-100x5"
```

#### software_package_ids

Ids for software packages to use for the job. Packages are identified by their ID number, which can be queried from Conductor's rest api.
``` python
"software_package_ids": ["ae8026b7d9cfe524a77a3ebe94b9130a",  "7208372e306614d514944938c395e0e7"]
```

#### tasks_data

The definition of tasks. Each task dictionary must contain a command to be executed. It may optionally contain a frames field, which helps to determine whether it is a scout-frame.
``` python
"tasks_data": [
{   
    "command":"vray -display=0 -sceneFile=/tmp/batman_0008.vrscene",
    "frames": "8"
},
{
    "command":"vray -display=0 -sceneFile=/tmp/batman_0024.vrscene",
    "frames": "24"}
]
```

#### upload_paths

A list of files and directories to be uploaded.
``` python
"upload_paths": ["/tmp/sourceimages", "/tmp/my_maya_file.ma"]
```
