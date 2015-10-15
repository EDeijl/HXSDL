{-# LANGUAGE ForeignFunctionInterface, CPP #-}
module IOSMain where

import HXSDL

foreign export ccall "haskell_main" main :: IO ()
main = startSDL
