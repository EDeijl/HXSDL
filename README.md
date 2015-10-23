# HXSDL
Cross Platform Haskell SDL Application that shows a blue screen on iOS and Desktop.

## Prerequisites

For all platforms:
- GHC (tested with 7.10.2)
- Cabal (tested with 1.22.6)
- SDL2 2.0.3 sourcecode and runtime binaries (https://www.libsdl.org/download-2.0.php)
 
For iOS:
- Machine with OSX installed (tested on El Capitan)
- Xcode (tested with 7.1.0)

## Installation

First make sure to have `jobs: $ncpus` commented out in `~/.cabal/config`.

Then run the following commands:

    git clone --recursive https://github.com/EDeijlHXSDL.git
    cd HXSDL
    ./setup.sh

## Building
### Desktop
Just do a `cabal install` and run it with `./dist/build/HXSDL/HXSDL`.

### iOS
For SDL to work the SDL iOS libraries need to be compiled.
Download the SDL source from the website, and unpack it somewhere.
Follow the instructions [here](http://lazyfoo.net/tutorials/SDL/52_hello_mobile/ios_mac/index.php) to build the libraries.
After the libraries have been built, place them in the iOS project folder at `platforms/ios/HXSDL/SDL/lib`.

Installing the dependencies for this project is not straight forward, [because cabal doesn't support cross compilation of packages with `Type: Custom`](https://github.com/haskell/cabal/issues/1493) so we need to do it ourselves.

navigate somewhere easy where you will be able to find the libraries, `~/code` is a good place.
In this directory execute the following command:

    cabal get bytes-0.15.0.1 reflection-2.1 distributive-0.4.4 \
    comonad-4.2.7.2 semigroupoids-5.0.0.4 lens-4.13 \
    linear-1.19.1.3 sdl2-2.0.0

This will download the source of the dependencies that need manual compilation.
Some of the libraries in that command are dependent on others, so we need to compile the libraries in the correct order. the order is as follows:
1. bytes
2. reflection
3. distributive
4. comonad
5. semigroupoids
6. lens
7. linear
8. sdl2

In that order, change the `Type` in the .cabal file from `Custom` to `Simple` and execute `arm-apple-darwin10-cabal install` and `i386-apple-darwin11-cabal`, the packages `reflection` and `linear` must be installed with the flag `-f-template-haskell`.

On my machine the cross compileres weren't able to generate working packages for iOS, manually repackaging the `.o` files in `.a` files fixed this issue.

In the package folder (replace $packagename-$version with the packagename and it's version ex: `reflection-2.1.a`):

`libtool -static dist/arm/build/**/*.o -o libHS$packagename-$version.a` (pressing tab after /\*\*/\*.o will expand it to all matching files in `zsh`, I don't know the `bash` or `sh` method)

Copy the resulting library to the installation folder of the package (On OSX 10.11 this is ~/Library/Haskell/ghc-7.8.3-arm/lib).

example: `cp libHSreflection-2.1.a ~/Library/Haskell/ghc-7.8.3-arm/lib/reflection-2.1/libHSreflection-2.1.a`

After all these steps are completed for each library (Yes, I really need a way to automate this) the application can be built.

In the project folder run `arm-apple-darwin10-cabal configure -fios && arm-apple-darwin10-cabal build exe:HXSDLStaticLib`
This will generate a static library in `dist/arm/build/HXSDLStaticLib`.
Copy this library into `platforms/ios/HXSDL/SDL/lib`.
You should now be able to run the project on a device from Xcode.

### Android
*coming soon...*
