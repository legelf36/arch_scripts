(define (script-fu-sharpen-fixed image drawables)
  (let* (
         (drawable  (vector-ref drawables 0))
         (radius    2.250)
         (amount    1.250)
         (threshold 0.300)
         (filter    (car (gimp-drawable-filter-new drawable
                                                   "gegl:unsharp-mask"
                                                   "Sharpen")))
        )
    (gimp-image-undo-group-start image)
    (gimp-drawable-filter-configure filter
                                    LAYER-MODE-REPLACE 1.0
                                    "std-dev"   radius
                                    "scale"     amount
                                    "threshold" threshold)
    (gimp-drawable-merge-filter drawable filter)
    (gimp-image-undo-group-end image)
    (gimp-displays-flush)
  )
)

(script-fu-register-filter
  "script-fu-sharpen-fixed"
  "Sharpen (4.4 / 0.75 / 0.3)"
  "Unsharp mask with Radius 4.4, Amount 0.75, Threshold 0.3"
  "Your Name"
  "Your Name"
  "2026"
  "*"
  SF-ONE-OR-MORE-DRAWABLE
)

(script-fu-menu-register "script-fu-sharpen-fixed" "<Image>/Filters/Enhance")
