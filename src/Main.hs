{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Graphics.UI.SDL as SDL
import Graphics.UI.SDL.Surface
import Control.Concurrent

main =
  withInit [InitEverything] $
  withWindow "Hello World!" (Position 100 100) (Size 640 480) [WindowShown] $ \win ->
  withRenderer win (Device (-1)) [Accelerated, PresentVSync] $ \ren -> do
    renderClear ren
    renderPresent ren

    threadDelay (10^6 * 2)
    return ()
