---
title: Deadline plugin
summary: Instructions for using and install the Deadline plugin.
authors:
    - Jesse Lehrman
date: 2019-11-20
---

# Deadline plugin

## Introduction
Conductor is integrated into Deadline via a set of plugins and scripts. This toolset is responsible for sending jobs to Conductor and ensuring these jobs only run on Conductor instances. The uploading of dependencies and the download of the resulting data is handled by Conductor's upload and download daemons respectively.

One of Conductor's underlying principles is to only spin-up an instance when it's needed by a specific job or task. This ensures that customers don't pay for idle machines. This is a shift from Deadline's (and most render farm manager's) paradigm that machines are running but idle until a job is assigned to them. This difference in paradigm is the main factor why Conductor wasn't implemented as a Deadline Cloud Plugin.

Just as with any other instance in a Deadline managed farm, Conductor instances run the Deadline worker.

*As of Deadline 10.1, the term **Slave** has been replaced with **Worker***

## Installation

Download the *[plugin](https://github.com/ConductorTechnologies/deadline-plugin)* from Github

*Steps 3-5 require Super User access in Deadline Monitor*

<ol>
<li>Start <em><a href="../../cli">Conductor uploader and downloader daemons</a></em></li><p>
<li>Copy plugins to the correct folders:
<pre style={color:black;}>
deadline_plugin/custom/scripts/Jobs/* -> <your_deadline_repo>/custom/scripts/Jobs/
deadline_plugin/custom/events/ConductorWorker -> <your_deadline_repo>/custom/events/
</pre></li><p>
     
<li>Add the path of the conductor client tools to the python paths in your repo
<img src="../../../image/deadline/python_path_repo.jpg"/></li>
<li>Add the Conductor paths to the MayaCmd plugin. You only need to add for the versions that you intend to use <img src="../../../image/deadline/maya_path_repo.jpg"/>
    
    <pre>
        /opt/autodesk/maya-io/2016.5/maya-io2016.5.SP0/bin/Render
        /opt/autodesk/maya-io/2016/maya-io2016.SP0/bin/Render
        /opt/autodesk/maya-io/2017/maya-io2017.SP0/bin/Render
        /opt/autodesk/maya-io/2017/maya-io2017.SP3/bin/Render
        /opt/autodesk/maya-io/2017/maya-io2017.SP4/bin/Render
        /opt/autodesk/maya-io/2017/maya-io2017.SP5/bin/Render
        /opt/autodesk/maya-io/2018/maya-io2018.SP0/bin/Render
        /opt/autodesk/maya-io/2018/maya-io2018.SP1/bin/Render
        /opt/autodesk/maya-io/2018/maya-io2018.SP2/bin/Render
        /opt/autodesk/maya-io/2018/maya-io2018.SP3/bin/Render
        /opt/autodesk/maya-io/2018/maya-io2018.SP4/bin/Render
        /opt/autodesk/maya-io/2018/maya-io2018.SP5/bin/Render
        /opt/autodesk/maya-io/2018/maya-io2018.SP6/bin/Render
        /opt/autodesk/maya-io/2019/maya-io2019.SP0/bin/Render
        /opt/autodesk/maya-io/2019/maya-io2019.SP1/bin/Render
        /opt/autodesk/maya-io/2019/maya-io2019.SP2/bin/Render</pre></li>

<li>Add <code>submit_to_conductor.py</code> as a Job menu script. The path to the icon is <code>deadline_plugin/custom/scripts/General/conductor_logo.ico</code>
<img src="../../../image/deadline/script_menu_repo.jpg"/>

<li>The Deadline workers running on Conductor instances need to connect to your repository via a Remote Connection Server (RCS). See the <a href="https://docs.thinkboxsoftware.com/products/deadline/10.0/1_User%20Manual/manual/remote-connection-server.html">Deadline documentation</a> for more details.</li><p>

<li>To properly connect to your Deadline RCS, you need to provide the hostname/port and the client certificate (.pfx). Client certificates with passwords <strong>are not</strong> supported. To provide theses values, you can either set the environment variables <code>CONDUCTOR_DEADLINE_PROXY</code> and <code>CONDUCTOR_DEADLINE_SSL_CERTIFICATE</code> or modify the code directly in the submit script:
<img src="../../../image/deadline/rcs_env_variables.png"/>
</ol>
 

## Usage
### Prerequisites
1. The Conductor upload daemon must be running
2. The Conductor download daemon must be running
3. A dependency sidecar exists for the given job

###Sending Jobs to Conductor
1. From the Deadline Monitor, select one or multiple jobs.
2. From the context menu, select *Scripts->Send to Conductor*
3. A dialog will appear where you can modify the default options for a job
4. Once you click *Submit* the job will be submitted to Conductor
5. The dialog will reappear for each job selected (ex: if you selected five jobs to submit, the dialog will appear five times)
6. It's imperative for a valid dependency sidecar file to be selected. For more details see the section on Dependencies
7. After a few minutes new workers pop-up in the worker panel that have the suffix `-conductor`. Each worker will render exactly one Deadline task. After a worker completes a Deadline task, they will shut down.
8. It's safe to *Delete* the Conductor workers that have completed their task. They will have a state of *Stalled*. This can be done from the Workers panel.

## How it works
The above is achieved by running a special Deadline worker job on Conductor - which is the Deadline worker software with some parameters to ensure it shuts down after it completes exactly one Deadline task. There's some additional logic to create a temporary Deadline group (`conductorautogroup_<jobid>`) to ensure that the submitted Deadline job only runs on the Conductor instances and that the Conductor instances only pick-up the given Deadline job.

An essential step is to ensure that a valid sidecar dependency file exists. If it doesn't, the Conductor instances will not have any of the necessary files to run the task. See the section on dependencies for more details.

Viewing reports and most other functions of a Deadline worker will work with a Conductor deadline worker, except for any operation that involves sending a command directly to the host instance (see below for more details).

<div style="width: 640px; height: 480px; margin: 10px; position: relative;"><iframe allowfullscreen frameborder="0" style="width:640px; height:480px" src="https://www.lucidchart.com/documents/embeddedchart/db7ae6b1-0106-4bef-aaa9-ff87d3558dda" id=".01_Fkrc4X2p"></iframe></div>


## Dependencies
A task can not render if it does not have all of its required dependencies. The list of necessary dependencies is submitted to Conductor as part of the job submission process. The uploader daemon is responsible for performing the actual upload[^1]. Therefore, it's necessary to create this list of dependencies before the job is submitted. There are several ways to do this:

1. Generate the sidecar dependency file when/prior to submitting the job. This can be done manually or as part of the submission to Deadline. Below is a python code snippet on how to do this:
  
        def get_dependencies():
            from conductor.lib import common, maya_utils
            resources = common.load_resources_file()
            dependency_attrs = resources.get("maya_dependency_attrs") or {}
            return maya_utils.collect_dependencies(dependency_attrs)
    
        dependencies = {'dependencies': get_dependencies()}
        
        ma_path = maya.cmds.file(query=True, sceneName=True)
        dependency_sidecar_path = "{}.cdepends".format(ma_path)
    
        with open(dependency_sidecar_path, 'w') as fh:
            json.dump(dependencies, fh)
        
2. Submit an upstream job to Deadline that will generate the dependency sidecar file

Generally, if a DCC software is already open with the scene file loaded, scanning for dependencies is a quick task.

[^1]: It is possible to upload the files at the same time as submitting the job without using the uploader daemon. This can be configured in the Conductor config. However, this method is not recommended when submitting jobs via Deadline due to the potentially long wait times.*

##Notes on the Conductor worker
*There are a few key differences between regular on-site Deadline workers and Conductor workers:*

- Conductor workers are not directly accessible like other workers. They are run from within the Conductor infrastructure. They don't have an exposed IP/hostname and therefore, remote commands do not work.
- Conductor workers can only render the jobs they're assigned. If you try to render a different job, it will fail (as none of the files are available to it).
- Conductor workers will manage themselves. They'll start-up and shut down as needed

##Licensing
As of Deadline 10.1, Deadline workers running on AWS instances don't require any licenses.
Licensing of DCC's and all other software is managed by Conductor and included in the cost.

##Supported software
Currently, the plugin is only set up to support Maya/Arnold renders that use the `MayaCmd` plugin. Additional packages will be available soon. If you require additional DCC's, please contact <support@conductortech.com>





