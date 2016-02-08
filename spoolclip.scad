module gusset() 
{
	polyhedron(
   	points=[ [0,0,0],[0,20,0],[0,0,-15],[3,0,0],[3,20,0],[3,0,-15]],
   	faces=[ [0,2,1],[3,4,5],[0,1,4,3],[1,2,5,4],[2,0,3,5] ]                                	);
};

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

rotate([180,0,0]) translate([0,0,5]) difference()
{
	union()
	{
		translate([-15,-15,0])
		{ 
			cube(size=[30,40,5], center=false);
		};
		translate([-15,0,-15])
		{ 
			cube(size=[30,5,15], center=false);
		};
		translate([12,5,0])
		{
			gusset();
		};
		translate([-15,5,0])
		{
			gusset();
		};
		translate([0,15,-4]) rotate(a=[0,0,30]) difference()
		{
			cylinder(h=8,r=10,center=true,$fs=1);
			hex(10,12.54);
		};
	};
	translate([-10,-7.5,0])
	{
		cylinder(h=10,r=1.5,center=true,$fs=1);
	};
	translate([10,-7.5,0])
	{
		cylinder(h=10,r=1.5,center=true,$fs=1);
	};
	translate([-10,-7.5,8.5])
	{
		cylinder(h=10,r=3,center=true,$fs=1);
	};
	translate([10,-7.5,8.5])
	{
		cylinder(h=10,r=3,center=true,$fs=1);
	};
	translate([0,15,0])
	{
		cylinder(h=12,r=4,center=true,$fs=1);
	};
};
