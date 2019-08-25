# Clips
## OpenScad Clip Library
Collection of OpenScad libraries for creating clips and other binders.

Simple download and copy into your OpenScad libraries folder then import the required module.

### SimpleClip
This provides a very basic "money" style clip.

![alt text](https://github.com/jasonbanks/Clips/blob/master/simple_clip.png "simple clip")

#### Usage
```
Use <Clip/Simple_Clip.Scad>

SimpleClip(
  length=length of clip, default to 50mm.
  width=max width of clip, default to 10mm
  min_width=smallest width of clip - matches width if not set
  max_depth=how deep is the clip, defaults to 10mm 
  min_depth=how narrow does the clip become, defaults 50 5mm
  wall = how thick should the walls of the clip be? defaults to 2mm
  center=true/false - should the clip be centered,
  qual = internal $fn
)

e.g.

//-- the default clip
SimpleClip(); 

//-- centers the default clip (image above)
SimpleClip(center=true); 

//-- Draws a 8 cm clip
SimpleClip(length=80, width=20, max_depth=20, min_depth=5);
```
