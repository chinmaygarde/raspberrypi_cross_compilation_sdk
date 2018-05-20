GN Cross Compilation Buildroot
==============================

A GN buildroot for setting up cross-compilation environments.

Prerequisites
-------------

* A Mac or Linux host.

Usage for Raspberry Pi
----------------------

* Download the prepared toolchain, sysroot and related tools to the `out` directory `./tools/setup_sdk.sh`.
  * This takes a while and downloads upto 1 GB of data from cloud storage.
* Prepare the build output directory `out` with paths to your toolchain using `./tools/setup_gn.sh`.
* Build using `ninja -C out` on your host.
  * Hack and repeat.
* Push your executable to the Raspberry Pi and run.
  * You should probably mount the `out` directory to the remote Raspberry Pi using SSHFS. That way, the build artifacts automatically end up getting pushed to the Pi.
