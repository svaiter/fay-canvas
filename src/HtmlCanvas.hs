{-# LANGUAGE EmptyDataDecls #-}

module HtmlCanvas where

import           FFI
import           Prelude

class Eventable a

addEventListener :: String -> Fay () -> Bool -> Fay ()
addEventListener = ffi "window['addEventListener'](%1,%2,%3)"

--------------------------------------------------------------------------------
-- | Mini DOM
-- TODO: Check if Cinder installed
--------------------------------------------------------------------------------
-- data Element
-- instance Eventable Element

-- Image
data Image
instance Eventable Image

newImage :: Fay Image
newImage = ffi "new Image()"

src :: Image -> Fay String
src = ffi "%1['src]"

setSrc :: String -> Image -> Fay ()
setSrc = ffi "%2['src'] = %1"

-- Canvas
data Canvas
instance Eventable Canvas

-- | Get an element by its ID.
getElementById :: String -> Fay Canvas
getElementById = ffi "document['getElementById'](%1)"

getContext :: String -> Canvas -> Fay Context
getContext = ffi "%2['getContext'](%1)"

--------------------------------------------------------------------------------
-- CanvasRenderingContext2D
-- | A canvas context.
data Context

--- Attributes
-- fillStyle
fillStyle :: Context -> Fay String
fillStyle = ffi "%1['fillStyle']"

setFillStyle :: String -> Context -> Fay ()
setFillStyle = ffi "%2['fillStyle']=%1"

-- font
font :: Context -> Fay String
font = ffi "%1['font']"

setFont :: String -> Context -> Fay ()
setFont = ffi "%2['font']=%1"

-- globalAlpha
globalAlpha :: Context -> Fay Double
globalAlpha = ffi "%1['globalAlpha']"

setGlobalAlpha :: Double -> Context -> Fay ()
setGlobalAlpha = ffi "%2['globalAlpha']=%1"

-- globalCompositeOperation
globalCompositeOperation :: Context -> Fay String
globalCompositeOperation = ffi "%1['globalCompositeOperation']"

setGlobalCompositeOperation :: String -> Context -> Fay ()
setGlobalCompositeOperation = ffi "%2['globalCompositeOperation']=%1"

-- lineCap
lineCap :: Context -> Fay String
lineCap = ffi "%1['lineCap']"

setLineCap :: String -> Context -> Fay ()
setLineCap = ffi "%2['lineCap']=%1"

-- lineDashOffset
lineDashOffset :: Context -> Fay Double
lineDashOffset = ffi "%1['lineDashOffset']"

setLineDashOffset :: Double -> Context -> Fay ()
setLineDashOffset = ffi "%2['lineDashOffset']=%1"

-- lineJoin
lineJoin :: Context -> Fay String
lineJoin = ffi "%1['lineJoin']"

setLineJoin :: String -> Context -> Fay ()
setLineJoin = ffi "%2['lineJoin']=%1"

-- lineWidth
lineWidth :: Context -> Fay Double
lineWidth = ffi "%1['lineWidth']"

setLineWidth :: Double -> Context -> Fay ()
setLineWidth = ffi "%2['lineWidth']=%1"

-- miterLimit
miterLimit :: Context -> Fay Double
miterLimit = ffi "%1['miterLimit']"

setMiterLimit :: Double -> Context -> Fay ()
setMiterLimit = ffi "%2['miterLimit']=%1"

-- shadowBlur
shadowBlur :: Context -> Fay Double
shadowBlur = ffi "%1['shadowBlur']"

setShadowBlur :: Double -> Context -> Fay ()
setShadowBlur = ffi "%2['shadowBlur']=%1"

-- shadowColor
shadowColor :: Context -> Fay String
shadowColor = ffi "%1['shadowColor']"

setShadowColor :: String -> Context -> Fay ()
setShadowColor = ffi "%2['shadowColor']=%1"

-- shadowOffsetX
shadowOffsetX :: Context -> Fay Double
shadowOffsetX = ffi "%1['shadowOffsetX']"

setShadowOffsetX :: Double -> Context -> Fay ()
setShadowOffsetX = ffi "%2['shadowOffsetX']=%1"

-- shadowOffsetY
shadowOffsetY :: Context -> Fay Double
shadowOffsetY = ffi "%1['shadowOffsetY']"

setShadowOffsetY :: Double -> Context -> Fay ()
setShadowOffsetY = ffi "%2['shadowOffsetY']=%1"

-- strokeStyle
strokeStyle :: Context -> Fay String
strokeStyle = ffi "%1['strokeStyle']"

setStrokeStyle :: String -> Context -> Fay ()
setStrokeStyle = ffi "%2['strokeStyle']=%1"

-- textAlign
textAlign :: Context -> Fay String
textAlign = ffi "%1['textAlign']"

setTextAlign :: String -> Context -> Fay ()
setTextAlign = ffi "%2['textAlign']=%1"

-- textBaseline
textBaseline :: Context -> Fay String
textBaseline = ffi "%1['textBaseline']"

setTextBaseline :: String -> Context -> Fay ()
setTextBaseline = ffi "%2['textBaseline']=%1"

--- Methods
-- last is optional
arc :: Double -> Double -> Double -> Double -> Double -> Bool -> Context -> Fay ()
arc = ffi "%7['arc'](%1,%2,%3,%4,%5,%6)"

arcTo :: Double -> Double -> Double -> Double -> Double -> Context -> Fay ()
arcTo = ffi "%6['arcTo'](%1,%2,%3,%4,%5)"

beginPath :: Context -> Fay ()
beginPath = ffi "%1['beginPath']()"

bezierCurveTo :: Double -> Double -> Double -> Double -> Double -> Double -> Context -> Fay ()
bezierCurveTo = ffi "%7['bezierCurveTo'](%1,%2,%3,%4,%5,%6)"

clearRect :: Double -> Double -> Double -> Double -> Context -> Fay ()
clearRect = ffi "%5['clearRect'](%1,%2,%3,%4)"

clip :: Context -> Fay ()
clip = ffi "%1['clip']()"

closePath :: Context -> Fay ()
closePath = ffi "%1['closePath']()"

-- TODO: createImageData()

-- TODO: createLinearGradient()
-- should return nsIDOMCanvasGradient
-- createLinearGradient :: Context -> Double -> Double -> Double -> Double -> Fay ()
-- createLinearGradient = ffi "%1['createLinearGradient'](%2,%3,%4,%5)"

-- TODO: createPattern()

-- TODO: createLinearGradient()
-- should return nsIDOMCanvasGradient
-- createRadialGradient :: Context -> Double -> Double -> Double -> Double -> Double -> Double -> Fay ()
-- createRadialGradient = ffi "%1['createRadialGradient'](%2,%3,%4,%5,%6,%7)"

-- TODO: drawCustomFocusRing()

drawImage :: Image -> Double -> Double -> Context -> Fay ()
drawImage = ffi "%4['drawImage'](%1,%2,%3)"

drawImageSize :: Image -> Double -> Double -> Double -> Double -> Context -> Fay ()
drawImageSize = ffi "%7['drawImage'](%1,%2,%3,%4,%5,%6)"

drawImageSpecific :: Image -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> Context -> Fay ()
drawImageSpecific = ffi "%10['drawImage'](%1,%2,%3,%4,%5,%6,%7,%8,%9)"

-- TODO: drawSystemFocusRing()

fill :: Context -> Fay ()
fill = ffi "%1['fill']()"

fillRect :: Double -> Double -> Double -> Double -> Context -> Fay ()
fillRect = ffi "%5['fillRect'](%1,%2,%3,%4)"

-- last is optional
fillText :: String -> Double -> Double -> Double -> Context -> Fay ()
fillText = ffi "%5['fillText'](%1,%2,%3,%4)"

-- TODO: getImageData()

-- TODO: getLineDash()

isPointInPath :: Double -> Double -> Context -> Fay Bool
isPointInPath = ffi "%3['isPointInPath'](%1,%2)"

isPointInStroke :: Double -> Double -> Context -> Fay Bool
isPointInStroke = ffi "%3['isPointInStroke'](%1,%2)"

lineTo :: Double -> Double -> Context -> Fay ()
lineTo = ffi "%3['lineTo'](%1,%2)"

-- TODO: measureText()

moveTo :: Double -> Double -> Context -> Fay ()
moveTo = ffi "%3['moveTo'](%1,%2)"

-- TODO: putImageData()

quadraticCurveTo :: Double -> Double -> Double -> Double -> Context -> Fay ()
quadraticCurveTo = ffi "%5['quadraticCurveTo'](%1,%2,%3,%4)"

rect :: Double -> Double -> Double -> Double -> Context -> Fay ()
rect = ffi "%5['rect'](%1,%2,%3,%4)"

restore :: Context -> Fay ()
restore = ffi "%1['restore']()"

rotate :: Double -> Context -> Fay ()
rotate = ffi "%2['rotate'](%1)"

save :: Context -> Fay ()
save = ffi "%1['save']()"

scale :: Double -> Double -> Context -> Fay ()
scale = ffi "%3['scale'](%1,%2)"

scrollPathIntoView :: Context -> Fay ()
scrollPathIntoView = ffi "%1['scrollPathIntoView']()"

-- TODO: setLineDash()

setTransform :: Double -> Double -> Double -> Double -> Double -> Double -> Context -> Fay ()
setTransform = ffi "%7['setTransform'](%1,%2,%3,%4,%5,%6)"

stroke :: Context -> Fay ()
stroke = ffi "%1['stroke']()"

strokeRect :: Double -> Double -> Double -> Double -> Context -> Fay ()
strokeRect = ffi "%5['strokeRect'](%1,%2,%3,%4)"

-- TODO: strokeText()

transform :: Double -> Double -> Double -> Double -> Double -> Double -> Context -> Fay ()
transform = ffi "%7['transform'](%1,%2,%3,%4,%5,%6)"

translate :: Double -> Double -> Context -> Fay ()
translate = ffi "%3['translate'](%1,%2)"
