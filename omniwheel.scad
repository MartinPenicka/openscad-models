
module omniwheel_rovio(body_color, roller_color){

    module roller(color){
    
	    difference(){
    	color(color)scale([1,1,3])sphere(5);

	    union(){
            translate([-5,-5,7])cube(10);
            translate([-5,-5,-17])cube(10);
	    }
        }
    }

    module wheel_top(){

	    difference(){
    	scale([3,3,1])sphere(25);
    	union(){
	    	translate([-100,-100,10])cube([200,200,30]);
		    translate([-100,-100,-30])cube([200,200,30]);
    	}
	    }
    }

    module wheel_holes(){

        hole_length = 60;
        hole_pos = (hole_length/2);

        for(i = [0:5]){
            rotate([0,0,i*72])translate([-70,hole_pos,-5])rotate([90,0,0])cylinder(hole_length,20,20);	
        }

        hole_pos_top = -30;
        for(i = [0:5]){
            rotate([0,0,36+(i*72)])translate([-70,hole_pos_top,40])rotate([-90,0,0])cylinder(hole_length,20,20);
        }
    }

    module wheel_body(){

        cylinder(30,75,75);
        translate([0,0,30])wheel_top();
        rotate([180,0,0])wheel_top();
    }

    module wheel_skeleton(){

        difference(){

            color(body_color)wheel_body();
            wheel_holes();
        }
        // add rollers
        roll_sc = 3.4;
        for(i = [0:5]){
        rotate([0,0,i*72])translate([-65,0,0])rotate([90,0,0])scale([roll_sc,roll_sc,roll_sc])roller("DarkSlateGray");
        }
        for(i = [0:5]){
        rotate([0,0,36+(i*72)])translate([-65,0,38])rotate([90,0,0])scale([roll_sc,roll_sc,roll_sc])roller("DarkSlateGray");
        }

        color(body_color)translate([0,0,40])cylinder(30,15,15);
        color(body_color)translate([0,0,60])cylinder(30, 10,10);
    }

        wheel_skeleton();
}


scale([0.5,0.5,0.5])omniwheel_rovio("DarkGray");
