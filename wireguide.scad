difference()
{
	union()
	{
		translate([-1.5,-1.625,0]) cube([1.5,3.25,10]);
		translate([0,-7.5,0]) cube([3,15,10]);
		translate([3,-7.5,0]) cube([20,2,10]);
		translate([3,5.5,0]) cube([20,2,10]);
		translate([23,0,0]) difference(){
			cylinder(h=10,r=7.5,$fs=1);
			translate([0,0,-1]) cylinder(h=12,r=5.5,$fs=1);
		}
	}
	translate([-4,0,2.5]) rotate([0,90,0]) cylinder(r=1.5,h=8,center=false,$fs=1);
	translate([-4,0,7.5]) rotate([0,90,0]) cylinder(r=1.5,h=8,center=false,$fs=1);
	translate([23,4,5]) rotate([0,90,0]) cylinder(r=1.5,h=12,center=false,$fs=1);
	translate([23,-4,5]) rotate([0,90,0]) cylinder(r=1.5,h=12,center=false,$fs=1);
}