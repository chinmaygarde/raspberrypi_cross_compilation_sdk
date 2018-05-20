GN Cross Compilation Buildroot
==============================

A GN buildroot for setting up cross-compilation environments.

Usage for Raspberry Pi
----------------------

* Download the prepared toolchain and sysroot to the `out` directory `./tools/setup_sdk.sh`.
  * This takes a while downloads about 600 MB of data from cloud storage.
* Prepare the build output directory `out` with paths to your toolchain using `./tools/setup_gn.sh`.
* Tell `gn` to use this out directory `gn gen out`.
* Build using `ninja -C out` on your host.
  * Hack and repeat.
* Push your executable to the Raspberry Pi and run.
  * You should probably mount the `out` directory to the remote Raspberry Pi using SSHFS. That way, the build artifacts automatically end up getting pushed to the Pi.
