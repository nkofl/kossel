iw = 15.4;
id = 15;
notch = 13;
t = 1;
pinch = 4;

difference()
{

translate([-t,-t,0])cube([iw+2*t,id+t,100]);
translate([iw+t,0,-5])rotate([0,0,pinch])cube([iw+2*t,2*id,110]);
rotate([0,0,-pinch])translate([-iw-3*t,0,-5])cube([iw+2*t,2*id,110]);

translate([0,0,-5])intersection()
{
cube([iw,id*2,110]);
translate([iw,0,0])rotate([0,0,pinch])translate([-iw,0,0])difference()
{
	cube([iw,id*2,110]);
	translate([iw-t,notch,-1])rotate([0,0,-45])cube([iw,id,112]);
}
rotate([0,0,-pinch])difference()
{
	cube([iw,id*2,110]);
	translate([t,notch,-1])rotate([0,0,135])cube([iw,id,112]);
}
}
}