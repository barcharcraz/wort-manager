# Overview

This document has information for package creators


# Standard Variables

Package information should be stored in variables with the following names

- $pkg_name: the name of the package
- $pkg_ver: the version of the package, preferable as a [version] type. Will change to [SemanticVersion] when PS 6.0 comes out
- $download_dir: the directory to download files into
- $src_dir: the directory to extract sources into
- $build_dir: the directory for building the package
- $install_dir: the package specific installation location
- $download: the file path of the downloaded file
- $url: the url to download from
- $hash: the hash file of the download, sha256 by default, but if you write your own download handler you can use a different algorithm

The Check-Variables cmdlet checks that these variables exist in a given script block. Note that currently it creates a module with the script block for easy removal, thus you need to `Export-ModuleMember -Variable *` at the end of the block. An example would be:

```powershell
Check-Variables -block {. .\worts\aria2\wort.binary.ps1; Export-ModuleMember -Variable *}