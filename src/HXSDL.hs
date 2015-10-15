{-# LANGUAGE OverloadedStrings #-}
module HXSDL (startSDL) where

import Control.Concurrent (threadDelay)
import Foreign.C.Types
import Linear
import qualified SDL

import Paths_HXSDL (getDataFileName)

screenWidth, screenHeight :: CInt
(screenWidth, screenHeight) = (640, 480)

startSDL :: IO ()
startSDL = do
  SDL.initialize [SDL.InitVideo]
  window <- SDL.createWindow "SDL Tutorial" SDL.defaultWindow { SDL.windowInitialSize = V2 screenWidth screenHeight }
  SDL.showWindow window
  screenSurface <- SDL.getWindowSurface window

  helloWorld <- getDataFileName "hello_world.bmp" >>= SDL.loadBMP

  SDL.surfaceBlit helloWorld Nothing screenSurface Nothing
  SDL.updateWindowSurface window

  threadDelay 2000000

  SDL.destroyWindow window
  SDL.freeSurface helloWorld
  SDL.quit


