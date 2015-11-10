{-# LANGUAGE OverloadedStrings #-}
module HXSDL (mainLoop) where
import Graphics.UI.SDL
import Control.Concurrent
mainLoop :: Renderer -> IO ()
mainLoop renderer = do
         putStrLn "mainloop"
         renderClear renderer
         putStrLn "clear renderer"
         setRenderDrawColor renderer maxBound maxBound maxBound maxBound
         putStrLn "set color"
         renderPresent renderer
         threadDelay (10^6 * 2)
         return ()
