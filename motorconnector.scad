module gusset() 
{
	polyhedron(
   	points=[ [0,0,0],[0,20,0],[0,0,-30],[5,0,0],[5,20,0],[5,0,-30]],
   	faces=[ [0,2,1],[3,4,5],[0,1,4,3],[1,2,5,4],[2,0,3,5] ]                                	);
};

union()
{
	difference()
	{
		cube([40,35,5]);
		translate([5+15.5/16*25.4/2,20,-2]) cylinder(h=10, d=15.5/16*25.4,center=false);
		translate([5+2/16*25.4,20,-2]) cube([13.5/16*25.4,35,10]);
	}

	difference()
	{
		translate([0,0,5]) cube([40,5,45]);
		translate([5,-2,20]) cube([30,10,45]);
	}
	translate([0,5,5]) cube([5,30,25]);
	translate([35,5,5]) cube([5,30,25]);
	translate([0,-15,0]) difference()
	{
		cube([5,15,50]);
		translate([-2,7.5,10]) rotate([0,90,0]) cylinder(h=10,d=3.2);
		translate([-2,7.5,40]) rotate([0,90,0]) cylinder(h=10,d=3.2);
	}
	translate([0,4.99,29.99]) rotate([90,0,0]) gusset();
	translate([35,4.99,29.99]) rotate([90,0,0]) gusset();
	
}