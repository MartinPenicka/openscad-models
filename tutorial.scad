//circle(r=5);
//square([10,1]);
//polygon([[5,5],[6,5],[6,6],[5,10]],[[0,1,2,3]]);

//sphere(5);
//cylinder(2,0,5);
//cube([5,10,1]);

translate([10,0,0]) sphere(5);
translate([-10,0,0]) sphere(5);
translate([0,10,0]) sphere(5);
translate([0,-10,0]) sphere(5);

translate([-8,-1,-1]) cube([16,2,2]);
translate([-1,-8,-1]) cube([2,16,2]);

translate([10,0,15]) sphere(5);
translate([-10,0,15]) sphere(5);
translate([0,10,15]) sphere(5);
translate([0,-10,15]) sphere(5);

translate([-8,-1,14]) cube([16,2,2]);
translate([-1,-8,14]) cube([2,16,2]);

 translate([0,0,0]) cylinder(15,1,1);