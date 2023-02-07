# Welcome to a Windows Registry Parser v0.0.7b

After cleaning malware off of Microsoft OS products for many years in degraded and denied situations, it is important to look at some key areas to see what is modified. In this tool, one can baseline the registry in specific areas, make modifications to the OS, and run it again (after saving the log files) to see what artifacts remain. This is about a 60% solution--in that it will not see everything, but a good coarse report. Basically, if one can see changes here, time to do some better garbage claenup!

Read into the scripts to learn what system areas are of interest. Most malware lives here. If you have a rootkit currently installed, these areas may be masked. The output will be skewed and may allow for an educated reason to do more analysis via dismount. If you have the ability, run this as a [system] user.  

Enjoy the cheap ASCII art! Make sure to modify and use templates for your future scripts!

Hardware / Software Requirements:
  * [Windows OS]
  * [Powershell]
  * [Powershell Script Execution Policy Allowed]

## Getting started

Ensure you have a functioning Powershell with allowed execution policy. You will need elevation (administrator privilege)
```
set-executionpolicy unrestricted
```

After running, make sure to

```
set-executionpolicy restricted
```
This will reset your Powershell execution policy to not allow scripts like this.  

## Running the Scripts

Follow the onscreen menu. You can run it once, make changes, run the second option, and then compare changes with the second option.

Type:
```
.\60_percent_artifact_finder_v0.7b.ps1
```

## Changelog v0.0.7b
```
  - removed all CTRL^M chars for easier review on github (actually works now)
  - changed variable name from bro to evo (deconfliction)
  - removed autodelete of tmp files and added option to delete from local directory
  - minor formatting changes / spacing removals
  - tested on win11
```

## Changelog v0.0.5b
```
  - internal working version for testing
```

## Changelog v0.0.3b
```
  - removed some CTRL^M chars for easier review on github
```

## Changelog v0.0.2b
```
  - initial commit to github
```

## Known Issues
```
  - add more registry and filesystem areas
  - log file save location is fixed to local running directory (of note)
```
