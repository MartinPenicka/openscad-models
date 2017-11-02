module Gear(depth, radius_top, radius_bottom, cog_n, tw)
{
	cog_angle = atan(abs(radius_bottom-radius_top)/depth);
	//echo(cog_angle);
	
	mult = (radius_top == radius_bottom) ? 1 : 2;
	cog_pos = (radius_bottom < radius_top ? radius_bottom : radius_top)*mult;
	cog_len = sqrt(pow(radius_top-radius_bottom, 2)+pow(depth, 2));

	linear_extrude(height=depth, center=true, twist=tw)
	for(angle = [0:360/cog_n:360])
	{
		rotate([0,0,angle])
		translate([cog_pos,0,-(depth/2)])
		//rotate([0,-cog_angle,0])
		//cube([2,2,cog_len], center=true);
		square(2, center=true);
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

module GearPole(len, wid, height, r_l, r_r, cn_l, cn_r)
{
	// iner cube
	cube_len = len - (r_l + r_r);
	cube([cube_len, wid, height], center=true);
	// left gear
	translate([-(cube_len/2),0,0])
	Gear(height, r_l, r_l, cn_l);
	// right gear
	translate([(cube_len/2),0,0])
	Gear(height, r_r, r_r, cn_r);
}

a = $t*360;
go_up = true;

angle = a;
if(go_up == true && a > 90)
{
	angle = -1*a;
	go_up = false;
}
if(go_up == false && a <= 270)
{
	angle = -1*a;
	go_up = true;
}

translate([-15,0,0])
rotate([0,0,-angle])
color("Red")Gear(2,7,7,13);

rotate([0,0,angle])
translate([30-6,0,0])
color("Green")GearPole(60, 7,2,7,5,13,10);

//rotate([0,0,$t*360])color("Blue")Gear(30,20,20,25,-100);
//translate([31,0,0])rotate([0,0,-$t*360])color("Green")Gear(30,10,10,15,100);


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

/*
translate([31,0,0])rotate([0,0,-($t*2)*360])color("Blue")Gear(3,10,10,15);

//rotate([0,0,$t*360])translate([0,0,8])cube([3,3,20], center=true);
rotate([0,0,$t*360])color("Red")Gear(3,20,20,30);

%translate([10,0,0])Box(70,45,10,1);
translate([10,0,5])cube([70,45,1], center=true);
*/

