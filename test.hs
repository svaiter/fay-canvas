module Test (main) where

import           FFI
import           HtmlCanvas
import           Prelude

main :: Fay ()
main = do
  addEventListener "load" start False

start :: Fay ()
start = do
  canvas <- getElementById "can"
  context <- getContext "2d" canvas
  setFillStyle "rgb(200,0,0)" context
  fillRect 0 0 10 10 context
