(define (script-fu-resize-sharpen image drawables)
  (let* (
         (orig-width  (car (gimp-image-get-width image)))
         (orig-height (car (gimp-image-get-height image)))
         (new-height  900)
         (new-width   (max 1 (inexact->exact
                               (round (/ (* orig-width new-height) orig-height)))))
         (drawable  (vector-ref drawables 0))
         (radius    2.00)
         (amount    1.25)
         (threshold 0.125)
         (filter    (car (gimp-drawable-filter-new drawable
                                                   "gegl:unsharp-mask"
                                                   "Sharpen")))
        )
    (gimp-image-undo-group-start image)
    (gimp-image-scale image new-width new-height)
    (gimp-image-undo-group-end image)
    (gimp-displays-flush)

    (gimp-image-undo-group-start image)
    (gimp-drawable-filter-configure filter
                                    LAYER-MODE-REPLACE 1.0
                                    "std-dev"   radius
                                    "scale"     amount
                                    "threshold" threshold)
    (gimp-drawable-merge-filter drawable filter)
    (gimp-image-undo-group-end image)
    (gimp-displays-flush)
    (gimp-file-save RUN-NONINTERACTIVE image (car (gimp-image-get-imported-file image)))
  )
)

(script-fu-register-filter
  "script-fu-resize-sharpen"
  "Resize Sharpen"
  "Combine resize and Sharpen"
  "Your Name"
  "Your Name"
  "2026"
  "*"
  SF-ONE-OR-MORE-DRAWABLE
)

(script-fu-menu-register "script-fu-resize-sharpen" "<Image>/Image")
