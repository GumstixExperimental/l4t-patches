(c) 2019 Gumstix Inc.

Author:  Keith Lee

Contact: keith.lee@gumstix.com


# l4t-patches
Patches needed for Linux-for-Tegra on Gumstix Boards


**CURRENT NVIDIA TAG: tegra-l4t-r28.2.1**

## Description

This is a short *bash* script that performs a `git apply` to any repo in the
`Linux_for_Tegra/sources` file system that require updates in order for Gumstix
hardware to operate correctly.

## Usage

to apply the patches, install NVIDIA's JetPack V3.3 and enter the following commands
into the console:

    git clone https://github.com/gumstix/l4t_patches.git
    cd l4t_patches
    ./source_sync -d <path-to-jetpack>/64_TX2/Linux_for_Tegra/sources -t tegra-l4t-r28.2.1

This will clone all of NVIDIA's repositories and apply all patches in the `patches` folder
to the correct locations in the file system.

## Adding patches

The `patches` folder in this repository contains the patch files for each modified 
repo. The file name of each patch determines which repo to which the patch should
be applied.  For instance, a patch to the Linux kernel, located at `sources/kernel/kernel-4.4/`
would be named `patches/kernel+kernel-4.4.patch`. 


## Patch List

Currently, this repo contains patches for:

1. kernel/kernel-4.4.git
  * Adds drivers for OV5640 and OV5670 cameras
  * Modifies Sony IMX214 driver