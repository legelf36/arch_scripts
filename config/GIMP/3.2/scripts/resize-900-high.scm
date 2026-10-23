(define (script-fu-resize-900-high image drawables)
  (let* (
         (orig-width  (car (gimp-image-get-width image)))
         (orig-height (car (gimp-image-get-height image)))
         (new-height  900)
         (new-width   (max 1 (inexact->exact
                               (round (/ (* orig-width new-height) orig-height)))))
        )
    (gimp-image-undo-group-start image)
    (gimp-image-scale image new-width new-height)
    (gimp-image-undo-group-end image)
    (gimp-displays-flush)
  )
)

(script-fu-register-filter
  "script-fu-resize-900-high"
  "Resize to 900 High"
  "Scales the image to 900 pixels high, keeping the aspect ratio"
  "Your Name"
  "Your Name"
  "2026"
  "*"
  SF-ONE-OR-MORE-DRAWABLE
)

(script-fu-menu-register "script-fu-resize-900-high" "<Image>/Image")
