---
title: Conductor CLI
summary: Use the Conductor shell command  
authors:
    - Julian Mann
date: 2019-07-19
---

# Conductor CLI

## Introduction

The Conductor Command Line Interface (CLI) can be used to upload, download and submit jobs.

##Usage
```bash
conductor <command> <options>
```

##Commands
The CLI has three possible commands: `submit`, `downloader` and `uploader`

###Submit
For a complete list of options, run ```conductor submit --help```

###Downloader
For a complete list of options, run ```conductor downloader --help```

The downloader command can be run in one of two modes; **manual** or **daemon**

####Manual mode####

This mode will download the files for a specific **job** and (optionally) for a **task**

Files for a single job can be downloaded with the following shell command:

```bash 
conductor downloader --job_id <jobid>

# example
conductor downloader --job_id 00014
```

You may also specify a single task with the `task_id` argument. 

```bash 
# example
conductor downloader --job_id 00014 --task_id 010
```

####Daemon mode####

Alternatively, files can be downloaded automatically as they become available using daemon mode.

To start the downloader in daemon mode, run it with no arguments:

```bash 
conductor downloader
```

###Uploader
For a complete list of options, run ```conductor uploader --help```

The uploader command can only be run as a daemon. It will run continuously, uploading files for jobs submitted to your Conductor account.

To start the uploader in daemon mode run:

```bash 
conductor uploader
```

!!!note
    For large studios, to free up artist workstations, we recommend running the downloader and uploader daemons on dedicated machines.



##Docker

If you prefer to run either daemon in a docker container, you'll need to specify the following options when executing `docker run`.

```docker
# Export account name
-e CONDUCTOR_ACCOUNT=my_studio

# Export the path to your API key
-e API_KEY_PATH=/path/to/api_key.json

# Share a set of directories that cover output paths for all jobs to be downloaded.
-v /projects/my_project:/projects/my_project
-v /home:/home
-v /path/to/api_key.json:/path/to/api_key.json
```

Instructions for installing docker can be found [here](https://docs.docker.com/installation/).

