
module CogPole(pole_len, pole_width, cog_width, cog_height,cog_th)
{
	rotate([-90,0,0])cylinder(pole_len,pole_width,pole_width);
	cog_num = pole_len/cog_width;

	for(s_x = [0:cog_width:pole_len-cog_width]){
		translate([-(cog_th/2),s_x,(pole_width/2)+1])Cog(cog_width,cog_height,cog_th);
	}

}

module Gear(gear_width, gear_th, cog_height, cog_width)
{
	difference()
	{
		cylinder(gear_th,gear_width,gear_width);
		cylinder(gear_width+2,2,2);
	}

	for(step = [0:15:360])
	{
		
		rotate([0,0,step])translate([-gear_width+0.5,-cog_width/2,0])rotate([0,-90,0])Cog(cog_width,cog_height,gear_th);
	}
}

module Cog(width, height, thickness)
{
	alpha = atan(height/(width/2));
	x = height*sin(90-alpha);
	y = height/sin(alpha);
	difference(){
	difference(){
		cube([thickness, width, height]);
		rotate([alpha,0,0])translate([-1,0,0])cube([thickness+2,y,x]);
	}
	translate([0,width,0])rotate([90-alpha,0,0])translate([-1,x,0])rotate([90,0,0])cube([thickness+2,y,x]);
}
}

CogPole(100,3,5,5,2);
translate([-1,0,28])rotate([0,90,0])Gear(20,2,5,5);