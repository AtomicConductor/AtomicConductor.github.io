---
title: Configuration file
summary: Set common configuration options
authors:
    - Julian Mann
date: 2019-07-05
---

# Configuration file

Conductor client tools rely upon a configuration file named `config.yml`.

The default location for this file varies by platform:


``` fct_label="Mac"
~/Library/Application Support/Conductor/config.yml

```

``` fct_label="Linux"
~/.conductor/config.yml
```

``` fct_label="Windows"
C:\Users\<username>\AppData\Roaming\Conductor Technologies\Conductor\config.yml
```


## Settings

The available settings are specified with [YAML](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html) keys as described below.

<table>
    <tr>
        <td><code>environment</code>
        </td>
        <td>Additional environment variable assignments to be included in submissions. For example, you may want to upload and run a pre-render script. You can use this key to add the path to the script.</td>
        <td>
``` yaml
environment:
  PATH: /path/to/my/scripts
```
        </td>
    </tr>
    <tr>
        <td><code>output_dir</code></td>
        <td>By default, files are downloaded to the directory that was specified on submission. Use this key to override that directory and download to the specified location.</td>
        <td>
``` yaml
output_dir: /special/path/to/my/renders
```
        </td>
    </tr>
    <tr>
        <td><code>local_upload</code></td>
        <td>Specify whether uploads should run on the workstation where jobs are submitted. Set this key to False if you have a dedicated machine to run an uploader daemon.</td>
        <td>
``` yaml
local_upload: False
```
        </td>
    </tr>
    <tr>
        <td><code>api_key_path</code></td>
        <td>Full path to the location of a file containing your API_KEY. This is optional if you are not running an uploader or downloader daemons.</td>
        <td>
``` yaml
api_key_path: /path/to/my/conductor_api_key.json
```
        </td>
    </tr>
    <tr>
        <td><code>location</code></td>
        <td>Tag your submissions with a location. This allows you to download only those tagged jobs while running the downloader daemon.</td>
        <td>
``` yaml
location: london_studio
```
        </td>
    </tr>
    <tr>
        <td><code>upload_paths</code></td>
        <td>A list of additional paths to be uploaded. Both files and directories are valid.</td>
        <td>
``` yaml
upload_paths:
  - /path/to/my/scripts/prerender.py
  - /assets/not/detected/during/dependency/scan/
```

        </td>
    </tr>
</table>

## Sample `config.yaml`

``` yaml
local__upload: False
output_dir: /dev/wmd/conductor/images
location: wmd_studio
environment:
    MAYA_SCRIPT_PATH: /dev/wmd/conductor/maya/scripts
upload_paths:
    - /dev/wmd/conductor/maya/plugins
    - /dev/wmd/conductor/maya/scripts
api_key_path: /dev/wmd/conductor/conductor_api_key.json
```
