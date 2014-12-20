//cube([20,50,4]);
//gusset
module gusset(s1,s2,t)
{
	intersection()
	{
		cube([s1,s2,t]);
		rotate([0,0,atan(s2/s1)]) translate([0,0,-1]) cube([s1+s2,s1+s2,t+2]);
	}
}

module bracket() difference()
{
	gusset(25,25,3);
	translate([7.5,25-7.5,-1]) cylinder(r=2,h=5,$fa=1);
}

module assembly()
{
	translate([0,0,25]) rotate([-90,0,0]) bracket();
	translate([0,36,25]) rotate([-90,0,0]) bracket();
	difference()
	{
		translate([-3,0,0]) cube([3,120,25]);
		translate([-4,112.5,5]) rotate([0,90,0]) cylinder(r=1.5,h=5,$fa=1);
		translate([-4,112.5,20]) rotate([0,90,0]) cylinder(r=1.5,h=5,$fa=1);
	}
	translate([-43,105,0]) rotate([0,0,-90]) gusset(105,40,3);
}

assembly();
translate([27,5,0]) mirror([1,0,0]) assembly();
