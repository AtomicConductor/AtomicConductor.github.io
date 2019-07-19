---
title: Retrieving your files
summary: Use the Conductor shell command to download your output files.  
authors:
    - Julian Mann
date: 2019-07-19
---

# Retrieve your files

## Introduction

As tasks are completed, rendered files are made available to download. You may use the Conductor Downloader tool to fetch files to your local disk. Files are downloaded to the output path specified when the job was submitted.

The Downloader can operate in one of two modes:

* Manual (Explicit mode)  
* Automatic (Daemon mode)

## Manual

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
## Automatic

Alternatively, files can be downloaded automatically as they become available using daemon mode.

To start the downloader in daemon mode, run it with no arguments:

```bash 
conductor downloader
```

!!!note
    For large studios, to free up artist workstations, we recommend running the downloader daemon on a dedicated machine.

### Docker

If you prefer to run the downloader daemon in a docker container, you'll need to specify the following options.

```docker
# Export account name
-e CONDUCTOR_ACCOUNT=my_studio

# Export the path to your API key
-e API_KEY_PATH=/path/to/api_key.json

# Share a set of directories that cover output paths for all jobs to be downloaded.
-v /projects/deadpool:/projects/deadpool
-v /home:/home
```

Instructions for installing docker can be found [here](https://docs.docker.com/installation/).

