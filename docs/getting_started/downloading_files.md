# Downloading Files

When a task has been completed, the output data from that job is made available to download. Files can be downloaded by using the Conductor Companion or the Conductor command-line interface (CLI).

The Conductor Companion provides a GUI to simplify the process. The Conductor CLI provides a method to run in the background. It's the preferred method for multi-user studios that use shared storage.

When downloading files, they will be copied to what was given as the `output path` parameter. This can be overriden in each of the tools.

!!!note
    If your tasks produce multiple files in sequence (ex: one task renders multiple frames) you still have to wait for the entire task to be completed before downloading the files.

Once you have successfully downloaded the files for a task, its status is set to `Downloaded`

![task downloaded status](../image/getting_started/task_downloaded_status.png)

For tool specific details, see their respective documentation:

  * [Downloading with the Conductor Companion][desktop_companion]
  * [Downloading with the Conductor command-line interface][conductor_cli]


[desktop_companion]: ../client_tools/companion/downloader.md
[conductor_cli]: ../client_tools/cli.md
