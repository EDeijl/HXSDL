{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import SDL
import Data.Text
import Linear (V4 (..))
import Control.Monad (unless)
import HXSDL

main :: IO ()
main = do
  initialize [InitVideo, InitAudio, InitTimer, InitJoystick]
  window <- createWindow "My SDL Application" defaultWindow
  renderer <- createRenderer window (-1) defaultRenderer
  appLoop renderer

