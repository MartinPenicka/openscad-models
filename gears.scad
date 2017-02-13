

module Gear(depth, radius_top, radius_bottom, cog_n)
{
	//cog_angle = atan(abs(radius_bottom-radius_top)/depth);
	//echo(cog_angle);
	//rotate([0,-cog_angle,0])
	cog_pos = radius_bottom > radius_top ? radius_bottom : radius_top;

	for(angle = [0:360/cog_n:360])
	{
		rotate([0,0,angle])
		translate([cog_pos,0,0])
		cube([2,2,depth], center=true);
	}

	cylinder(depth,radius_bottom,radius_top, center=true);
}

module Box(width, height, depth, th)
{
	difference()
	{
		cube([width, height,depth], center=true);

		translate([0,0,(th/2)+0.1])
		cube([width-(2*th), height-(2*th), depth-th], center=true);
	}
}

/*
// input
translate([31,0,0])rotate([0,0,-($t*2)*360])color("Blue")Gear(3,10,10,15);

// second set
translate([0,0,3])rotate([0,0,$t*360])color("Salmon")Gear(3,10,10,15);
rotate([0,0,$t*360])color("Red")Gear(3,20,20,30);

// third set
translate([-31,0,3])rotate([0,0,-($t/2)*360])color("Green")Gear(3,20,20,30);
translate([-31,0,20])rotate([0,0,-($t/2)*360])color("DarkGreen")Gear(3,10,10,15);
translate([-31,0,12])rotate([0,0,-($t/2)*360])color("Green")cylinder(20,2,2,center=true);

// radial gear set
translate([-21,0,31.5])rotate([0,90,0])rotate([0,0,-10-($t/2)*360])color("Yellow")Gear(3,10,10,15);
*/


translate([31,0,0])rotate([0,0,-($t*2)*360])color("Blue")Gear(3,10,10,15);

//rotate([0,0,$t*360])translate([0,0,8])cube([3,3,20], center=true);
rotate([0,0,$t*360])color("Red")Gear(3,20,20,30);

%translate([10,0,0])Box(70,45,10,1);
translate([10,0,5])cube([70,45,1], center=true);