{-# LANGUAGE ForeignFunctionInterface, OverloadedStrings, CPP #-}
module IOSMain where

import Graphics.UI.SDL as SDL
import HXSDL

foreign export ccall "haskell_main" main :: IO ()
main =
  withInit [InitVideo] $
  withWindow "Hello World!" (Position 100 100) (Size 640 480) [WindowShown] $ \win ->
  withRenderer win (Device (-1)) [Accelerated, PresentVSync] $ \ren -> do mainLoop ren
