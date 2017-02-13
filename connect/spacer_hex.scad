// Openscad
// Connect library
// Martin Penicka 2015 GPLv3

module spacer_hex(length_mm, screw_type, type){

    // type: MM- male male, FF- female female, MF- male female
    
    module body(){

        for(i = [0,1,2,3,4,5]){
        rotate([0,0,i*60])translate([0,-0.5,0])cube([1,1,length_mm]);
        }
    }

    body();
}

spacer_hex(50, 2, "MM");
