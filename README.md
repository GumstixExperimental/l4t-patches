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

to apply the patches, clone the L4T repositores using Nvidia's script and then
issue the following commands:

    cd <path-to>/Linux_for_Tegra
    ./source_sync.sh -t tegra-l4t-r28.2.1
    cd <this-folder>
    ./kernel_patch.sh <path to>/Linux_for_Tegra/sources

## Adding patches

The `patches` folder in this repository contains the patch files for each modified 
repo. The file name of each patch determines which repo to which the patch should
be applied.  For instance, a patch to the Linux kernel, located at `sources/kernel/kernel-4.4/`
would be named `patches/kernel+kernel-4.4.patch`. 
