include <configuration.scad>;

use <vertex.scad>;

$fs=0.1;
$fa=1;
$fn=0;

offset=92;
offset2=-151.7;
offset3 = -12.5;

module frame()
{
translate([0,0,-15]) 
{
//vertices
	translate([0, offset2, 7.5]) vertex(extrusion, idler_offset=3, idler_space=12.5);
	rotate([0,0,120]) translate([0, offset2, 7.5]) vertex(extrusion, idler_offset=3, idler_space=12.5);
	rotate([0,0,240]) translate([0, offset2, 7.5]) vertex(extrusion, idler_offset=3, idler_space=12.5);
	//extrusions
	translate([-120,offset-7.5,0]) cube([240,15,15]);
	rotate([0,0,120]) translate([-120,offset-7.5,0]) cube([240,15,15]);
	rotate([0,0,240]) translate([-120,offset-7.5,0]) cube([240,15,15]);
}
//glass
difference()
{
	color("lightgray") translate([0,0,3]) cylinder(r=170/2, h=3);
	color("lightgray") translate([0,0,2]) cylinder(r=168/2, h=5);
}
}

//frame();
//clips

module clip() color("blue") difference()
{
	translate([offset3,offset+7.5-35,0]) cube([25,35,7]);
	translate([0,0,3]) cylinder(r=170/2, h=3.4);
	translate([0,0,3]) cylinder(r=169.5/2, h=3.6);
	translate([0,0,3]) cylinder(r=169/2, h=3.8);
	translate([0,0,3]) cylinder(r=168.5/2, h=5);
	translate([0,0,-1]) cylinder(r=160/2, h=8);
	translate([offset3+5,offset,-1]) cylinder(r=1.5,h=10);
	translate([offset3+20,offset,-1]) cylinder(r=1.5,h=10);
	translate([offset3+5,offset,4]) cylinder(r=3.5,h=10);
	translate([offset3+20,offset,4]) cylinder(r=3.5,h=10);
}



translate([0,-63,0]) clip();
//translate([30,-63,0]) clip();
//rotate([0,0,180]) translate([-15,-138,0]) clip();
