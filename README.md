Fay Canvas
==========

Canvas bindings for Fay. This project is *experimental* and not suitable for
production purposes.

The intent of this library is to be a 1-to-1 mapping of existing Canvas API calls in order to build more idiomatic library for Fay.

Usage
-----

To use this with fay, cabal install the package which will put the
source files in fay ~/.cabal/share/fay-jquery-0.0.1.0/src. You can then
compile with fay using

in fay >= 0.12:
```bash
fay --package fay-canvas MyFile.hs
```

in fay < 0.12:
```
fay --include=~/.cabal/share/fay-canvas-0.0.1.0/src MyFile.hs
```

Supported API calls
-------------------

All getter/setter +

arc
arcTo
beginPath
bezierCurveTo
clearRect
clip
closePath
fill
fillRect
fillText
isPointInPath
isPointInStroke
lineTo
moveTo
quadraticCurveTo
rect
restore
rotate
save
scale
scrollPathIntoView
setTransform
stroke
strokeRect
transform
translate

Still to do
-----------

Handling of images

Canvas API calls to be implemented:
- createImageData()
- createLinearGradient()
- createPattern()
- createLinearGradient()
- drawCustomFocusRing()
- drawImage()
- drawSystemFocusRing()
- getImageData()
- getLineDash()
- measureText()
- putImageData()
- setLineDash()
- strokeText()