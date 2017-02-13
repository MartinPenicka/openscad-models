include <motor.scad>

wood_color = "BurlyWood";
battery_color = "DarkGray";

translate([-40,-5,2]) scale([0.75,0.75,0.75]) motor_unit();
rotate([0,0,120])translate([-40,-5,2]) scale([0.75,0.75,0.75]) motor_unit();
rotate([0,0,-120])translate([-40,-5,2]) scale([0.75,0.75,0.75]) motor_unit();

// Robot lower plate
color(wood_color)cylinder(2,50,50);

// Battery
color(battery_color)translate([0,1,-10.5])cube([20,10,10]);
color(battery_color)translate([0,-11,-10.5])cube([20,10,10]);