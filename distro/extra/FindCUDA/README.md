# FindCUDA

Activates incremental builds for [cutorch](https://github.com/torch/cutorch) and [cunn](https://github.com/torch/cunn)

## How to use?

Make sure you have [torch](https://github.com/torch/distro.git) installed

Then do simply:
```
luarocks install findcuda
```
That's it!  cutorch and cunn builds will now be incremental :-)  It's a bit draft, so worst case if something
is not building fully, just:
- (ideally) zip your cutorch directory, and send it to me somehow, so I can take a look
- `rm -Rf build`

## How this source-code was obtained?

- downloaded https://cmake.org/files/v3.5/cmake-3.5.0-rc1.tar.gz
- extracted
- copied Modules/FindCUDA.cmake and Modules/FindCUDA/ folders
- applied a custom fix to allow incremental builds on cutorch, and cunn (might not generalize for other
software)
- added appropriate rocks file and CMakeLists.txt so installable as luarocks module

## FAQ

### Why not just use the Ubuntu standard FindCUDA?

- doesnt contain the fix for incremental builds on cutorch

### Why not just download the gz directly?

- doesnt contain the fix for incremental builds on cutorch

### Why not push the fix upstream into cmake?

working on it :-)  This repo might evolve appropriately as a function of this, or disappear eventually, as
and when upstream is fixed, and a new version of cmake is available

## License

MIT

## Where can I find out more about FindCUDA?

The documentation for FindCUDA is at https://cmake.org/cmake/help/v3.5/module/FindCUDA.html  The author
of the uncustomized FindCUDA module is James Bigler.

