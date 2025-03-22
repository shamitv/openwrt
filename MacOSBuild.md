 # Building OpenWrt on macOS

This guide provides step-by-step instructions to build OpenWrt on macOS. Please note that the build process can require up to 200 GB of disk space, depending on the selected packages and modules. It is highly recommended to use external storage to accommodate this requirement. 

## Prerequisites

Before starting, ensure that your macOS system meets the following prerequisites:

- **Operating System**: macOS Catalina (10.15) or later 
- **Hardware**: Intel-based Mac or Apple Silicon Mac with Rosetta 2 installed 
- **Storage**: At least 200 GB of free disk space, preferably on external storage 

## Setting Up the Build Environment

1. **Install Xcode Command Line Tools**: Open the Terminal application and run: 

   ```bash
   xcode-select --install
   ```
 

2. **Install Homebrew**: Homebrew is a package manager for macOS. Install it by running: 

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
 

3. **Install Required Packages**: Use Homebrew to install essential packages: 

   ```bash
   brew install coreutils gawk gnu-getopt gnu-tar grep make ncurses pkg-config python3 quilt rsync unzip wget
   ```
 

4. **Install Additional GNU Tools**: To ensure compatibility, add GNU tools to your PATH: 

   ```bash
   echo 'export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> ~/.bash_profile
   echo 'export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"' >> ~/.bash_profile
   source ~/.bash_profile
   ```
 

## Preparing External Storage

Given the substantial disk space required for the build process, it's advisable to use external storage: 

1. **Connect External Storage**: Ensure your external drive is connected and properly mounted. 

2. **Format the Drive**: Format the external drive to a case-sensitive file system, such as APFS (Case-sensitive), to avoid potential issues during the build. 

3. **Create a Build Directory**: On the external drive, create a directory for the OpenWrt build environment: 

   ```bash
   mkdir -p /Volumes/ExternalDrive/OpenWrtBuild
   cd /Volumes/ExternalDrive/OpenWrtBuild
   ```
 

   Replace `/Volumes/ExternalDrive` with the actual mount point of your external drive.

## Cloning the OpenWrt Source Code

Clone the OpenWrt source repository into your build directory: 


```bash
git clone https://git.openwrt.org/openwrt/openwrt.git
cd openwrt
```
 

This repository contains the latest OpenWrt source code. 

## Installing Feeds

OpenWrt uses a package management system called "feeds." Initialize and update the feeds by running: 


```bash
./scripts/feeds update -a
./scripts/feeds install -a
```
 

This process fetches all available packages and integrates them into the build system. 

## Configuring the Build

Configure the build system to select the target device and desired packages: 


```bash
make menuconfig
```
 

This command opens a terminal-based configuration menu where you can: 

- **Target System**: Select the architecture of your device (e.g., Atheros AR7xxx/AR9xxx). 
- **Target Profile**: Choose the specific device model. 
- **Package Selection**: Include or exclude packages as needed. 

Use the navigation keys to make selections and save the configuration before exiting. 

## Building OpenWrt

Start the build process with: 


```bash
make -j$(nproc)
```


This command initiates the compilation, utilizing all available CPU cores to expedite the process. 

**Note**: The build process can be time-consuming, ranging from several hours to over a day, depending on your system's performance and the selected configuration. 

## Accessing Build Outputs

Upon completion, the compiled firmware images and packages are located in the `bin/targets/` directory within your build environment. 

## Additional Resources

For more detailed information and advanced configurations, refer to the official OpenWrt documentation:

- [OpenWrt Build System – Installation](https://openwrt.org/docs/guide-developer/build-system/install-buildsystem)
- [OpenWrt Build System – Usage](https://openwrt.org/docs/guide-developer/build-system/use-buildsystem)

These resources provide in-depth guidance on customizing and optimizing your OpenWrt build. 

## Conclusion

Building OpenWrt on macOS is a feasible task with the proper setup and preparation. By following this guide and utilizing external storage, you can successfully compile OpenWrt tailored to your networking device's specifications.  