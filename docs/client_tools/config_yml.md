---
title: Configuration file
summary: Set common configuration options 
authors:
    - Julian Mann
date: 2019-07-05
---

# Configuration file

## Introduction

Conductor client tools rely upon a configuration file named `config.yml`.

The default location for this file varies by platform:


``` fct_label="Mac"
~/Library/Application Support/Conductor/config.yml

```

``` fct_label="Linux" 
~/.conductor/config.yml
```

``` fct_label="Windows"
C:\Users\<you>\AppData\Roaming\Conductor Technologies\Conductor\config.yml
```


## Keys

The available settings are specified with [YAML](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html) keys as described below.

#### environment

Additional environment variable assignments to be included in submissions. For example, you may want to upload and run a pre-render script. You can use this key to add the path to the script.

``` yaml
environment:
  PATH: /path/to/my/scripts 
```


#### output_dir

By default, files are downloaded to the directory that was specified on submission. Use this key to override that directory and download to the specified location. 

``` yaml
output_dir: /special/path/to/my/renders 
```

#### upload_paths

A list of additional paths to be uploaded. Both files and directories are valid. 

``` yaml
upload_paths: 
  - /path/to/my/scripts/prerender.py
  - /assets/not/detected/during/dependency/scan/
```

#### local_upload

Specify whether uploads should run on the workstation where jobs are submitted. Set this key to False if you have a dedicated machine to run an uploader daemon. 

``` yaml
local_upload: False 
```

#### api_key_path

Full path to the location of a file containing your API_KEY. This is optional if you are not running an uploader or downloader daemons. 

``` yaml
api_key_path: /path/to/my/conductor_api_key.json
```

