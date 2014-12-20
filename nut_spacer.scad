n_width = 5.5;
n_height = 2.4;
backer = 0.2;
n_clearance = 0.1;

module nut(w,h) intersection()
{
	translate([-w/2,-w,0]) cube([w,w*2,h]);
	rotate([0,0,120]) translate([-w/2,-w,0]) cube([w,w*2,h]);
	rotate([0,0,240]) translate([-w/2,-w,0]) cube([w,w*2,h]);
}

module cutout(d) translate([0,d,backer])nut(n_width+n_clearance, n_height*2);
module stick(l) translate([-n_width/2,0,0]) cube([n_width,l,n_height]);
module detent(d) translate([0,d,backer])cylinder(d=n_width/2, h=n_height*2, $fs=0.1); 



module vertex_bar() difference()
{
	stick(65);
	cutout(11);
	cutout(55);
	detent(63);
}

for(x=[0:n_width+5:120])
{
	translate([x,0,0]) vertex_bar();
}

for(x=[0:n_width+5:30])
{
	translate([90,72+x,0]) rotate([0,0,90]) vertex_bar();
	translate([90,-x-7,0]) rotate([0,0,90]) vertex_bar();
}

//translate([60,33,0])cylinder(d=170, h=0.1);