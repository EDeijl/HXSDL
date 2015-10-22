{-# LANGUAGE ForeignFunctionInterface, OverloadedStrings, CPP #-}
module IOSMain where

import SDL
import Data.Text
import Linear (V4 (..))
import Control.Monad (unless)
import HXSDL

foreign export ccall "haskell_main" main :: IO ()
main = do
  initialize [InitVideo, InitTimer, InitAudio, InitJoystick]
  window <- createWindow "My SDL Application" defaultWindow
  renderer <- createRenderer window (-1) defaultRenderer
  appLoop renderer
