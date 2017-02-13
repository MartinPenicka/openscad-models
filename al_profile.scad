
module PrSquare(length, width, al_th)
{
	inner_gap = width - (2*al_th);

	translate([-1-(inner_gap/2), 0, 0])cube([al_th, inner_gap+(al_th*2), length], center=true);
	translate([(inner_gap/2)+1, 0, 0])cube([al_th, inner_gap+(al_th*2), length], center=true);
	// top & bottom
	translate([0,(inner_gap/2)+1,0])cube([inner_gap, al_th, length], center=true);
	translate([0,-(inner_gap/2)-1,0])cube([inner_gap, al_th, length], center=true);
}

module PrL(length, width_top, width_side, al_th)
{
	//side
	translate([-(width_top/2)+(al_th/2),0,0])
		cube([al_th,width_side,length], center=true);
	//top
	translate([0,(width_side/2)-(al_th/2),0])
		cube([width_top,al_th,length], center=true);
}

module AlPrKombi(length)
{
	al_th = 2;
	profile_width = 30;
	side_gap = 8;
	inner_gap = 10;
	col = "Silver";
	// ----
	side_size = (profile_width-side_gap)/2;

	color(col)PrSquare(length, inner_gap+(2*al_th), al_th);
	
	for(angle = [0, 90, 180, 270])
	{
		rotate([0,0,angle])
		translate([-(inner_gap/2)-(al_th/2),(inner_gap/2)+(al_th/2),0])
		rotate([0,0,-45])
		translate([-inner_gap/2,0,0])
		color(col)
		cube([side_size,al_th,length], center=true);

		rotate([0,0,angle])
		translate([-(profile_width-inner_gap)/2,(profile_width-inner_gap)/2,0])
		color(col)
		PrL(length, side_size, side_size, al_th);
	}

}

sc = 0.2;
sq_size = 500;

for(angle = [0,90,180,270])
{
	scale(sc)
	rotate([angle,0,0])
	translate([0,-sq_size/2,0])
	AlPrKombi(sq_size);
}