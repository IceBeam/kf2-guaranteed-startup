# README

This is a Killing Floor 2 crash-protection batch script, which guarantees a successful KF2 startup and needs to be executed only once.

## What problem does it solve?

Routine pointing, clicking and tapping process, which needs to be repeated over 9000 times in order to get Killing Floor 2 running. Countless manual restarts are certainly not fun.

The game often crashes on startup for an unknown reason, prompting a user to send a BugSplat error report.
This problem persists since the days of Early Access and still doesn't have a 100% working solution. Unfortunately, I don't know what exactly causes it, and any information you can provide on that matter would be greatly appreciated. However, until the source of the issue is identified, something needs to be done to make launching Killing Floor 2 a less annoying process.

## What does it do?

The script starts KFgame.exe, waits for it to close and makes the next decision based on the exit code:

- abnormal exit (issue, error, crash): close the BugSplat window, restart KFGame.exe.
- clean exit without any errors / problems: this would normally happen when a user closes the game via in-game menu. In this case, let the user know that everything is OK and the crash-protection script can be closed.

## How to download

[Direct link to the ZIP archive](https://github.com/IceBeam/kf2-guaranteed-startup/archive/master.zip)

If you download it as a ZIP archive, extract the contents to any directory.

If you're using Git, run the following command in your terminal to clone the repository:

```bash
git clone https://github.com/IceBeam/kf2-guaranteed-startup.git
```

## How to use

1. Open __kf2-guaranteed-startup.cmd__ with any text editor.

    __Note #1__: if Windows Notepad messes up the spaces and line endings, use any other editor of your choice, such as Sublime Text, Atom, Notepad++.

    __Note #2__: WordPad is also a viable option, although I would not recommend using it, since it has formatting symbols and non-printing characters, which can be typed by accident.

2. Find the following line:

    ```cmd
    set KFGameExePath="C:\Program Files (x86)\Steam\SteamApps\common\killingfloor2\Binaries\Win64\"
    ```

    This is the default path to Killing Floor 2 executable (KFGame.exe). If you have Killing Floor 2 installed somewhere else, you'll need to change it. Otherwise, skip to step 6.

3. Go to your Killing Floor 2 installation directory. Steam Client can automatically open it for you:
    - Open Steam.
    - Select "Library".
    - Right-click "Killing Floor 2".
    - Select "Properties" from the drop-down list.
    - Switch to the "Local Files" tab.
    - Click "Browse Local Files".

4. From there, change directory to ```Binaries```, and then to ```Win64```. If you're using Windows Explorer to browse files, you should be able to get the full path by right-clicking any part of the address bar and choosing "Copy address as text".

5. Paste the full path between the quotes (it is important to keep the quotes if your path has spaces).

    ```cmd
    set KFGameExePath="C:\YourSteamDir\SteamApps\common\killingfloor2\Binaries\Win64\"
    ```

    __Note__: directory `"C:\YourSteamDir\SteamApps\common\killingfloor2\Binaries\Win64\"` is used as an example. Yours will be different.

6. If you run the game with additional launch parameters, assign them to the `LaunchOptions` variable. Paste them in the next line, after the `=` character:

    ```cmd
    set LaunchOptions=-nostartupmovies -and -something -else
    ```

7. Save the changes.

8. Congratulations! The setup is done, and you can use __kf2-guaranteed-startup.cmd__ whenever you need to be sure that Killing Floor 2 starts when you tell it to.

    __Note__: if your Killing Floor 2 installation resides in a system partition ( e.g. `C:\Program Files (x86)` ), the script will __not__ see KFGame.exe until you run it as Administrator due to insufficient privileges.
