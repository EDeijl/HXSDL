{-# LANGUAGE OverloadedStrings #-}
module HXSDL (mainLoop) where
import Graphics.UI.SDL

mainLoop renderer = do
         bmp <- loadBMP "hello_world.bmp"
         tex <- createTextureFromSurface renderer bmp
         renderClear renderer
         renderCopy renderer tex Nothing Nothing
         renderPresent renderer
         threadDelay (10^6 * 2)
         return ()
