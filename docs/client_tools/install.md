# Install client tools

To install the Conductor client tools, choose an installer from the list below. If you are working in a shared environment, it is recommended that you install manually to a shared location and set some environment variables for your studio.

### Downloads

|Operating system| Download link | 
|:------------|:-------------|
|Centos el7 installer|  [conductor-v2.11.3-0.el7.x86_64.rpm](https://github.com/AtomicConductor/conductor_client/releases/download/v2.11.3/conductor-v2.11.3-0.el7.x86_64.rpm) |
|Windows 10 installer|  [conductor-v2.11.3.exe](https://github.com/AtomicConductor/conductor_client/releases/download/v2.11.3/conductor-v2.11.3.exe) |
|Mac installer|  [conductor-v2.11.3.pkg](https://github.com/AtomicConductor/conductor_client/releases/download/v2.11.3/conductor-v2.11.3.pkg) |
|Manual install|  [v2.11.3.tar.gz](https://github.com/AtomicConductor/conductor_client/archive/v2.11.3.tar.gz) |

#### Others

For other versions, please visit the [Github releases page](https://github.com/AtomicConductor/conductor_client/releases)
 

### To run an installer

- Choose the appropriate link to download an installer for your operating system.

- Run the installer. The Conductor client API and DCC integrations are installed and you are ready to submit jobs to Conductor. 

### To install manually
 
Copy the downloaded source directory to a location of your choice and set the following environment variables. The examples below use Bash, and Powershell for Windows. You should adjust for your chosen environment.

``` bash fct_label="Mac"
export CONDUCTOR_LOCATION="/path/to/conductor_client"
export CONDUCTOR_CONFIG="${HOME}/Library/Application Support/Conductor/config.yml"
# Python
export PYTHONPATH="${PYTHONPATH}:${CONDUCTOR_LOCATION}:${CONDUCTOR_LOCATION}/installers/osx/python/lib/python2.7/site-packages"
# Maya
export XBMLANGPATH=${CONDUCTOR_LOCATION}/conductor/resources:${XBMLANGPATH}
export MAYA_SHELF_PATH="${CONDUCTOR_LOCATION}/maya_shelf"
# Nuke
export NUKE_PATH= "${NUKE_PATH}:${CONDUCTOR_LOCATION}/nuke_menu"
# Conductor command line utilities
export PATH="${CONDUCTOR_LOCATION}/bin:$PATH"

```

``` bash fct_label="Linux" 
export CONDUCTOR_LOCATION="/path/to/conductor_client"
export CONDUCTOR_CONFIG="${HOME}/.conductor/config.yml"
# Python
export PYTHONPATH="${PYTHONPATH}:${CONDUCTOR_LOCATION}:${CONDUCTOR_LOCATION}/python/lib/python2.7/site-packages"
# Maya
export XBMLANGPATH=${CONDUCTOR_LOCATION}/conductor/resources:${XBMLANGPATH}
export MAYA_SHELF_PATH="${CONDUCTOR_LOCATION}/maya_shelf"
# Nuke
export NUKE_PATH= "${NUKE_PATH}:${CONDUCTOR_LOCATION}/nuke_menu"
# Conductor command line utilities
export PATH="${CONDUCTOR_LOCATION}/bin:$PATH"
```

``` powershell fct_label="Windows"
$Env:CONDUCTOR_LOCATION = "C:\path\to\conductor_client"
$Env:CONDUCTOR_CONFIG = "$Env:HOME\AppData\Roaming\Conductor Technologies\Conductor\config.yml"

# python
$Env:PYTHONPATH += ";$Env:CONDUCTOR_LOCATION"
$Env:PYTHONPATH += ";$Env:CONDUCTOR_LOCATION\installers\windows\python\Lib\site-packages"
# Maya
$Env:XBMLANGPATH+="$Env:CONDUCTOR_LOCATION\conductor\resources"
$Env:MAYA_SHELF_PATH+="$Env:CONDUCTOR_LOCATION\maya_shelf"
# Nuke
$Env:NUKE_PATH = "$Env:CONDUCTOR_LOCATION\nuke_menu"
# Conductor command line utilities
$Env:Path += ";$Env:CONDUCTOR_LOCATION/bin"
```

### Use Conductor tools

To submit jobs to Conductor from your content creation application, follow the instructions in the links below:

* [Maya](plugins/maya.md)
* [Nuke](plugins/maya.md)
* [Clarisse](plugins/maya.md)

Or to use Conductor's client side API to submit jobs from within a Python script, follow the instructions [here](commandline.md).
 