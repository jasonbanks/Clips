/*
||
||  simple_clip
||
||  module for generating basic clips
||
||  Copyright (c) 2019 jason banks
||
||  Github project - https://github.com/jasonbanks/Clips
*/





//SimpleClip(min_width=5,center=false,qual=12);


module SimpleClip(length=50,width=10,min_width=-100,max_depth=10,min_depth=5,wall=2,center=false,qual=-1)
{
    clip_length = length;
    clip_width = width;
    
    min_use = min_width==-100?width:min_width;
    
    if (qual!=-1)
    {
        $fn=qual;
    }
    
    if (center==true)
    {
        translate([-(length-max_depth-min_depth)/2,0,0])
            Draw(length,width,min_use,max_depth,min_depth,wall);
    }
    else
    {
        translate([max_depth/2,max_depth/2,width/2])
            Draw(length,width,min_use,max_depth,min_depth,wall);
    }
    
    module Draw(clip_length,clip_width,clip_min,max_depth,min_depth,wall)
    difference()
    {
        hull()
        {
            cylinder(r=max_depth/2,h=clip_width,center=true);
            translate([clip_length-((max_depth+min_depth/2)),-(min_depth/2),0])
            {
                cylinder(r=min_depth/2,h=clip_min,center=true);
            }
        }

        hull()
        {
         //   translate([0,0,10])
            {
                cylinder(r=(max_depth-wall-wall)/2,h=clip_width,center=true);
                translate([clip_length-((max_depth+min_depth/2)),-(min_depth/2),0])
                {
                    cylinder(r=(min_depth-wall*1.5)/2,h=clip_width,center=true);
                }    
            }
        }
        
        hull()
        {
            translate([clip_length-((max_depth+min_depth/2)),-(min_depth/2),0])
            {
                rotate([0,0,30])
                {
                    cylinder(r=(min_depth-wall*1.5)/2,h=clip_width,center=true);
                    translate([max_depth+min_depth/2,0,0])
                    {
                        cylinder(r=(min_depth-wall*2)/2,h=clip_width,center=true);
                    }
                }
            }
        }
    }
}