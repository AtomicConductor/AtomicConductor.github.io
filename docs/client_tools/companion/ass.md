---
title: Ass Submission
summary: Submit a Ass scene to Conductor for rendering.
authors:
    - Julian Mann
date: 2019-12-02
---


# Arnold ass file example

## Get prepared

--8<-- "client_tools/snippets/install_pointer.md"

In this tutorial you'll render the motion-blur example scene provided by SolidAngle. You'll need to have Maya installed.

* Download and unzip: [Motion_blur.zip](https://docs.arnoldrenderer.com/download/attachments/71009630/Motion_blur.zip?version=2&modificationDate=1524498738000&api=v2)


The scene **Motion_blur.ma** contains a three frame animation of pool balls.

![poolballs][poolballs]

## Export ass files.

* Open the scene in Maya and render a test frame so you know what to expect.
* Open **Render Settings->Common** tab and set **Frame Padding** to `4`. Change **Frame/Animation ext** if necessary.
* Choose **File->Export All []** and set the export options as illustrated. *Turn off the option to export the color manager.*
* Press **Export All** then choose a location and export the files.

![exportass][exportass]
 
## Configure the submission

#### Files

* Open the Companion app, sign in to your account, and go to the **Submission Kit** page.
* Go to the **Files** tab and use the folder button to browse for the new ass files.
* Browse again to add the pool ball textures that came with the scene.

![files][files]

Head over to the **Preview** tab if you like to check the files are included in the upload_paths field.

#### General tab

* Fill in the form fields in the **General** tab as illustrated below. You may have to choose a different instance type and a project that exists in your account.
* Browse for an output directory where your renders are ultimately downloaded to. 

![general][general]

!!!warning
    The output directory must not contain any of your input files.

!!!note
    Due to a limitation in the file dialog, the button to choose a directory is labeled "Upload". Don't worry, nothing is uploaded at this time.

#### Task Template.

The Task Template is where you specify the CLI command to run on each render node in the cloud. 

* Paste the following command there. Be sure to use your actual working directory for the path to `ass` files.
* 
```
kick -nostdin -i /Users/me/projects/Motion_blur/pool_balls.<pad chunk_start 4>.ass -dw -dp -v 5 -ds 4 -ss 4 -as 6 -of exr -o <output_path>/pool_balls.<pad chunk_start 4>.exr
```

`kick` is SolidAngle's command to render a single ass file. The command sets the following flags to override the render settings in the scene:

* **-nostdin** Ignore input from stdin
* **-v** Verbosity level
* **-dw** Disable render window
* **-dp** Disable progressive rendering
* **-as** Anti-aliasing samples
* **-ds** Diffuse samples
* **-ss** Specular samples
* **-of** Output format
* **-o** Output filename

Use `kick --help` in a command shell on your computer, or browse the Arnold documentation for a full list of options.

Notice the `-o` flag that specifies the out file location. Rather than specify the whole output filename in the template, we use the `<output_path>` token, which pulls the value directly from the output folder field above.

Several other tokens are available. We use the `<chunk_start>` token in our template with a special modifier to pad the number to four digits `<pad chunk_start 4>`. This is required because our ass files were exported with padded frame numbers.
 
If you go to the **Preview** tab you'll see how the the ass filenames and output paths have been resolved in the `tasks_data` section. 

Take a moment to save the state of the submission. 

* Choose **Save As** from the **More Menu** in the bottom left corner of the panel and save it in your working directory as `pool_ball_ass.json`.

![generalSave][generalSave]

#### Software.

You must specify all the host software and plugin services you need in order for them to be made available to the render nodes and to have their environments correctly set.

* Go to the **Software** tab and choose a recent version of Arnold for Maya. 

![software][software]

If you head back to the **Preview** tab now you'll see the environment section contains several paths required for rendering Maya with Arnold. However, there's one path missing. Since the scene was created in Maya, the ass files use Arnold versions of Maya shaders and the path to these shaders is not made available to Arnold standalone by default. 

Fortunately we can override the `ARNOLD_PLUGIN_PATH` variable in the **Advanced** tab.

#### Advanced tab.

The exact path to be appended depends on the Arnold software version you chose. It is the shaders directory which is a sibling to the plugins directory.

For example, if you chose **Arnold Maya 2019-3.3.0-2** software, then the default value for `ARNOLD_PLUGIN_PATH`, which you can check in the **Preview** tab, will be:

```
/opt/solidangle/arnold-maya/3/arnold-maya-maya2019-3.3.0-2./plug-ins
```

You need to append the shaders path:

```
/opt/solidangle/arnold-maya/3/arnold-maya-maya2019-3.3.0-2./shaders
```

So the full path to enter as an environment override is:

```
/opt/solidangle/arnold-maya/3/arnold-maya-maya2019-3.3.0-2./plug-ins:/opt/solidangle/arnold-maya/3/arnold-maya-maya2019-3.3.0-2./shaders
```

![advanced][advanced]


!!!note
    The above technique is also how you'd make available proprietary or 3rd party shader libraries, along with adding them to the upload files of course.
 

#### Python Location.

The submission is processed using Conductor's client side Python API, and therefore you need to ensure you have Python 2.7 available. In the **Advanced** tab, if the **Python Location** field is empty, press the reset button which will try to locate Python 2.7. If it fails, browse for a valid Python 2.7 installation on your system. If Python 2.7 is not installed, you'll need to install it before you can submit your job.

## Submit.

You can now press **Submit**. You should see some activity in the status bar. If you click the small icon in the status bar you'll see the whole log, where you can identify submission errors if any. If the submission is successful you'll be presented with a link to the job in Conductor's web UI.

![submitted][submitted]


## Appendix

* If in production you choose to export the color manager you'll need to upload the synColor files from your Maya installation.



[poolballs]: ../../image/companion/poolballs.png
[exportass]: ../../image/companion/export_ass.png
[general]: ../../image/companion/general_arnold.png
[generalSave]: ../../image/companion/general_arnold2.png
[files]: ../../image/companion/files_arnold.png
[software]: ../../image/companion/software_arnold.png
[advanced]: ../../image/companion/advanced_arnold.png
[submitted]: ../../image/companion/submitted_arnold.png



