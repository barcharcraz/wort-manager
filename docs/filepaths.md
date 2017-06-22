# overview

There's lots of filepaths used around worts.

the clean-all command should remove all paths, as of writing that command is defined thusly:

```powershell
function Clean-All {
    param([string]$base = $(Get-Location))
    Remove-Item -Recurse "$base/install" -Force
    Remove-Item -Recurse "$base/build" -Force
    Remove-Item -Recurse "$base/source" -Force
    Remove-Item -Recurse "$base/download" -Force
    Remove-Item -Recurse "$base/pkgs" -Force
}
```

As you can see there's five directories

#### Download
This is where downloaded archives are kept. It's assumed that each archive will have a unique name, thus there is no folder tree for download. This is simply a cache, feel free to muck about as much as you like here.

#### install
This is the install tree, will be documented more once multi-config packages are worked out

#### build
The build tree, we build packages here. The tree should look like
- build
    - package_name
        - package_version

#### source
This is where we keep the sources for our packages. Quite handy while debugging. This is seperate from build because we prefer debug buids, however if that's not possible then the source should go in the build directory. That is to say that there should never be build artifacts in this directory

#### pkgs
This is the per-package install directories in the same structure as the build tree.