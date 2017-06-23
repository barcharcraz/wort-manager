# Naming
Worts (the install scripts) have some method to their naming scheme. Quite a bit of information is contained in
the filename and although the filename has no real effect on any part of the worts system it should match up
with the established naming convention documented here.

- wort.ps1: This is the main wort file. Every wort should have one and it should do things that are common to all varients of the wort
- wort.binary.system.ps1: this should download a precompiled binary from upstream. the system part of the filename should match the system that the binary can run on.
- wort.source.ps1: for a generic source build
- wort.source.system.ps1: sometimes packages need to be build differently on different systems. That's what this file is for

In general you can seperate any kind of configuration types into seperate files, however the "shorter" or "more base" files should not use the more specific ones. You will typically extend a wortfile using dot sourcing.