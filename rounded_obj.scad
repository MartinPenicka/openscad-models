
module RCube(size)
{
	minkowski()
	{
		cube(size, center=true);
		translate([size/2,size/2,size/2])sphere(1);
	}
}

RCube(20);