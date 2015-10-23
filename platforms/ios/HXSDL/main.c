/*
 *  rectangles.c
 *  written by Holmes Futrell
 *  use however you want
 */

#include "SDL.h"
#include <time.h>
#include "IOSMain_stub.h"
#include "HsFFI.h"
int
main(int argc, char *argv[])
{
    hs_init(&argc, &argv);
    haskell_main();
    return 0;
}
