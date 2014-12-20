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

module bracket() rotate([0,0,180]) translate([0,100,0]) color("red")
{

//top plate
	difference()
	{
		translate([26,28,0])cube([21,130,3]);
		translate([36.5,148,-3])cylinder(d=3, h=10);
		translate([36.5,88,-3])cylinder(d=3, h=10);
	}
//gusset 1
	translate([44,28,-45])difference()
	{
		cube([3,130,45]);
		translate([-1,8,-45])rotate([19.1,0,0])cube([7,200,45]);
		translate([-2,110,41])rotate([0,90,0])cylinder(d=3, h=10);
		translate([-2,110-64,41])rotate([0,90,0])cylinder(d=3, h=10);
	}
//gusset 2
	translate([26,55,-45]) difference()
	{
		cube([3,103,45]);
		translate([-1,8,-45])rotate([23.3,0,0])cube([7,200,45]);
	}
//bracket
	rotate([0,0,30])
	{
//vertical plate
		difference()
		{
			translate([50,0,-45])cube([5,35,45]);
			translate([48,30,-40])rotate([0,90,0])cylinder(d=3, h=10);
		}
//top mount
		difference()
		{
			translate([35,0,0])cube([20,35,3]);
			translate([42.5,5,-3])cylinder(d=3, h=10);
			translate([42.5,30,-3])cylinder(d=3, h=10);
		}
	}
	
}

module clip()difference()
{
	union()
	{
		cylinder(r=4,h=3);
		translate([0,13,0])cylinder(r=4,h=3);
		translate([-4,0,0])cube([8,13,3]);
	}
	translate([0,0,-1])cylinder(r=1.5,h=5);
	translate([0,13,-1])cylinder(r=1.5,h=5);
}

translate([-15,-170,3])rotate([180,0,0])
{
	translate([100,0,0])bracket();
	mirror([1,0,0]) bracket();
}
clip();
translate([70,0,0]) clip();
translate([0,30,0]) clip();
translate([70,30,0]) clip();
//translate([-3.965*25.4/2,-260,5])cube([3.965*25.4,3.4*25.4,6*25.4]);
//frame();

