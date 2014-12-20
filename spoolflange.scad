module hex(h,w) 
{
	difference()
	{
		cylinder(h=h,r=w,center=true,$fs=1);
		translate([w,0,0])cube(size=[w,w,h*2],center=true);
		translate([-w,0,0])cube(size=[w,w,h*2],center=true);
		rotate(a=[0,0,120])
		{
			translate([w,0,0])cube(size=[w,w,h*2],center=true);
			translate([-w,0,0])cube(size=[w,w,h*2],center=true);
		};
		rotate(a=[0,0,240])
		{
			translate([w,0,0])cube(size=[w,w,h*2],center=true);
			translate([-w,0,0])cube(size=[w,w,h*2],center=true);
		};
	};
};

difference()
{
	cube([40,36,20]);
	translate([20,10,-5]) cube ([24,16,40]);
	translate([22,18,-5]) cylinder(d=16, h=40);
	translate([14,18,10])rotate([0,90,0]) hex(10,12.54);
	translate([-5,18,10])rotate([0,90,0]) cylinder(r=4,h=40);
}