module Ring(height, out_size, in_size)
{
	difference()
	{
		cylinder(height, out_size, out_size, center=true);
		cylinder(height+2, in_size, in_size, center=true);
	}
}
