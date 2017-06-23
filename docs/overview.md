# Overview

worts is short for ports for windows and it's a powershell based ports system. The goals are to make developing packages as fast as possible, and to make the state of the system fairly transparent. Although binary packages are not explicitly supported you can move the package folders around.

Packages are installed using a stow like system, with symlinks into package specific directories. Insparation is taken from stow and gobolinux.

Also, it works on linux, but you need powershell installed. It may also work on BSD but I'm not sure. Another possibility is to use it remotely via PSRemoteing but I'm not sure how well that works

## Unique Features
* powershell based: This makes it very pleasent to write new ports
* avoids complicated multi-system packages, prefers to have one recipie per system
* keeps rebuilds during development to a minimum
* has methods to check if a recipie is out of date based on an upstream source (in progress)

## Todo List

- general package management commands
- update checking
- package removal (this should probably be global)
- CI (use virtual machines for this)
- package signing (this is hard as upstream rarely signs things)
