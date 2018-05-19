GN Cross Compilation Buildroot
==============================

A GN buildroot for setting up cross-compilation environments.

Usage for Raspberry Pi
----------------------

* Build or Download Clang for `arm-linux-gnueabihf` (at a path referred to here as `TOOLCHAIN_PATH`).
* Build or Download Binutils for `arm-linux-gnueablhf` (at the same `TOOLCHAIN_PATH`).
* `rsync` files off a Raspberry Pi (at a path referred to here as `SYSROOT_PATH`).
* `gn args out` to open your editor so you can enter in cross-compilation options.
  * Available options are listed in `//build/config/toolchain/BUILD.gn` in the `declare_args` section.
* Build using `ninja -C out` on your host.
* Push your executable to the Raspberry Pi and run.
  * You should probably mount the `out/` directory to the remote Raspberry Pi using SSHFS. That way, the build artifacts automatically end up getting pushed to the Pi.

Sample args.gn file for Raspberry Pi
------------------------------------

```
toolchain_path = "<TOOLCHAIN_PATH>"
sysroot_path = "<SYSROOT_PATH>"
target_triple = "arm-linux-gnueabihf"
extra_system_include_dirs = ["/opt/vc/include"]
extra_system_lib_dirs = ["/opt/vc/lib"]

```
