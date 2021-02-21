---
layout: post
title: Install VSCodium
description: Installation of non-package-management application
author: polarysekt
modified: 2021-02-21
tags: [install, linux, tar, gz, VSCode, VSCodium, codium]
---

* NOTE: we are assuming the current directory is `~` (`/home/[user]`).
* To navigate to this folder, use `cd`

## Download the .tar.gz
* Main Page: [https://vscodium.com](https://vscodium.com)
* Downloads: [https://github.com/VSCodium/vscodium/releases](https://github.com/VSCodium/vscodium/releases)
* Select the newest version for system-arch
* We will assume the download target is `Downloads/`
* In this example, `VSCodium-linux-x64-1.53.2.tar.gz` is downloaded.

## Verify Download:
* Download the .sha256 file for checksum
* NOTE: we run `sha256sum` from the same folder.
* Change to `Downloads/` folder
``` bash
~ $ cd Downloads/
```
* Run `sha256sum`:
``` bash
~/Downloads/ $ sha256sum -c Downloads/VSCodium[version].sha256
```
* In this example, `VSCodium-linux-x64-1.53.2.sha256` was downloaded.
``` bash
~ $ cd Downloads
~/Downloads/ $ sha256sum -c Downloads/VSCodium-linux-x64-1.53.2.sha256
```

When successful, `sha256sum` should emit: 
``` bash
VSCodium-linux-x64-1.53.2.tar.gz: OK
```

Possible errors may occur if files are not in the same folder, or the command is run from a different working directory:
``` bash
sha256sum: VSCodium-linux-x64-1.53.2.tar.gz: No such file or directory
VSCodium-linux-x64-1.53.2.tar.gz: FAILED open or read
sha256sum: WARNING: 1 listed file could not be read
```

## Create folder `Vendor/vscodium/VSCodium[version]`
* For simplicity we return to home directory `~`.
``` bash
~/Downloads/ $ cd
```
* Then create the folder:
``` bash
~ $ mkdir -p Vendor/vscodium/VSCodium[version]
```
* In this example, `Vendor/vscodium/VSCodium-linux-x64-1.53.2` was created.
``` bash
~/Downloads/ $ cd
~ $ mkdir -p Vendor/vscodium/VSCodium-linux-x64-1.53.2
```
* NOTE: the `-p` parameter will create the entire directory path if non-existent.

## Navigate to folder
* NOTE: expand `[version]` to specific version
``` bash
~ $ cd Vendor/vscodium/VSCodium[version]
```
* In this example, we navigate to `Vendor/vscodium/VSCodium-linux-x64-1.53.2`.
``` bash
~ $ cd Vendor/vscodium/VSCodium-linux-x64-1.53.2
```

## Extract the .tar into folder
* NOTE: expand [version] to specific version
* The `x` option specifies extraction
* The `p` option specifies to preserve the attributes of the extracted files.
* The `v` option specifies verbosity, to show the files extracted.
* The `f` option is specified to tell tar we're giving it a file argument. Because this takes an Argument Option, this is entered last:
* The 
``` bash
~/Vendor/vscodium/VSCodium[version] $ tar -xpvf ../../../Downloads/VSCodium[version].tar.gz
```
* In this example, we use `VSCodium-linux-x64-1.53.2.tar.gz`
``` bash
~/Vendor/vscodium/VSCodium-linux-x64-1.53.2 $ tar -xpvf ../../../Downloads/VSCodium-linux-x64-1.53.2.tar.gz
```

## Create symlink to extracted folder in `Vendor/vscodium`
* If symlink exists, delete it:
``` bash
~/Vendor/vscodium/VSCodium[version] $ rm ../vscodium
```
* Create the symlink
``` bash
~/Vendor/vscodium/VSCodium[version] $ ln -s ./ ../vscodium
```
* In this example, the symlink did indeed exist:
```
~/Vendor/vscodium/VSCodium-linux-x64-1.53.2 $ rm ../vscodium
~/Vendor/vscodium/VSCodium-linux-x64-1.53.2 $ ln -s ./ ../vscodium
```

## Create symlink in /usr/local/bin to symlink in `Vendor/vscodium`
* When new version is installed, this symlink should still work
* NOTE: this command is run by root
* Change to a user with root
``` bash
~/Vendor/vscodium/VSCodium[version] $ su
```
* Create the symlink in `/usr/local/bin`. NOTE: the full path should be used!
``` bash
~/Vendor/vscodium/VSCodium-linux-x64-1.53.2 # ln -s /home/[user]/Vendor/vscodium/vscodium/bin/codium /usr/local/bin/vscodium
```
* In this example, our user can sudo, and a previous link to another location existed:
``` bash
~/Vendor/vscodium/VSCodium-linux-x64-1.53.2 # sudo su
~/Vendor/vscodium/VSCodium-linux-x64-1.53.2 # rm /usr/local/bin/vscodium
~/Vendor/vscodium/VSCodium-linux-x64-1.53.2 # ln -s /home/[redacted]/Vendor/vscodium/vscodium/bin/codium /usr/local/bin/vscodium
```
* NOTE: we want to exit our root shell ASAP!
``` bash
~/Vendor/vscodium/VSCodium[version] # exit
```
* Specifically:
``` bash
~/Vendor/vscodium/VSCodium-linux-x64-1.53.2 # exit
```
* NOTE: `ctrl+d` shortcut can be used when available.

## Test the installation
* DO NOT run as `root` - ensure we are normal user by the commandline, `$` NOT `#` (`root`).
* Worst case scenario, exit/logout shell.
Return to home folder:
``` bash
~ $ cd
```
Test the command:
``` bash
~ $ vscodium
```