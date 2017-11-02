/*
difference(){
color("red")cylinder(50, 100, 10, center=true);
cylinder(200,10,10,center=true);
}
//difference(){
%translate([0,0,-50])cylinder(50,100,100,center=true);

//}
color("green")translate([-2,100,-75])cube([10,2,20]);
//cube([100,])
*/

module holder(width, height, depth, hole_r)
{
	difference(){
	hull(){
	cube([width, depth, height/2], center=true);

	translate([0,0,height/2])rotate([90,0,0])cylinder(depth, height/4, height/4, center=true);

	}
	translate([0,0,height/2])rotate([90,0,0])cylinder(depth+2,hole_r,hole_r,center=true);
	}
}

// settings
holder_height = 30;
holder_depth = 2;
holder_hole = 3;
bottom_length = 100;

// bottom
cube([100, 30,2], center=true);
// holder 1
translate([(-bottom_length/2)+holder_depth,0,holder_height/4])
	rotate([0,0,90])
	holder(30, holder_height, holder_depth, holder_hole);
// holder 2
translate([-20,0,holder_height/4])
	rotate([0,0,90])
	holder(30, holder_height, holder_depth, holder_hole);
// holder 3
translate([0,0,holder_height/4])
	rotate([0,0,90])
	holder(30, holder_height, holder_depth, holder_hole);

