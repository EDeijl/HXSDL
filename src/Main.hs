{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Graphics.UI.SDL as SDL
import HXSDL

main =
  withInit [InitEverything] $
  withWindow "Hello World!" (Position 100 100) (Size 640 480) [WindowShown] $ \win ->
  withRenderer win (Device (-1)) [Accelerated, PresentVSync] $ \ren -> do mainLoop ren

