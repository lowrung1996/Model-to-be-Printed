// This is Michael's model of an Archimedes screw, resized and slightly modified in order to fit with the spiral ramp that the 

// ball will roll down. We plan to print it first, in order to test the workability of using an archimedes screw in order to 

// raise the ball to the top of our ramp, allowing the RGB machine to cycle indefinitely. The RGB is modular, with the screw 

// and the ramp fitting together, but printed seperately. Once the screw has been tested, the rest of the model is ready to 

// print,on the same scale as the screw. In this model, the screw and its exterior casing are printed speperately as well, in 

// order to allow for the removal of support structures after printing. They will fit together once printed. 





module screw(xsc, ysc, zsc) {           // draws the screw using rotating steps, and a changing z value  

    translate([xsc, ysc, zsc])
    /*Why are we translating an extra 100 in x for this whole for loop?  I can see why, but
    you don't say why, and I might not be so clever from just glancing between the code and the
    model*/
    translate([100, 0, 0]) 
    /*Where did 1080 come from?*/
    for ( z = [1:1080]) {// seperates different components for easy printing
        color("green") 
        /*Why 7?  Or 0.27, etc?*/
        rotate(z*7) 
        translate([0,0,z*.27]) 
        rotate([45,0,0]) 
        cube(size = [28,2.5,4], center = false);

                                                                
        // Actually draws out and positions the rungs
        difference() { // a small cubic indent in the bottom of the screw allows

                                                                
            // to interface with a motor, given a custom printed connector
            color("blue") 
            cylinder(h = 300, r = 10);
            translate([0, 0, 0]) 
            cube(5, center = true);

        }
     } 
}


/*All zeros, meaning... don't translate?*/
screw(0, 0, 0);

// code below makes makes up sleeve in order to hold ball in 
// place as screw is in operation


/*OK, this and the other two blocks make a sleeve.  But, how?*/
color("red", 0.1) 
difference() {
    
    translate([0, 0, 15]) 
    cylinder(h = 270, r = 37);
    translate([100, 0, 15]) 
    cylinder(h = 270, r = 35);

}


/*What is this?  It is nearly identical to the thing
below.  Why are they separated?*/
difference() {                          

    cylinder(h = 15, r = 37);

    union() {

        translate([-40, 0, 0]) 
        cube(80, center = false);

        translate([0, 0, 0]) 
        cylinder(h = 270, r = 36);

    }

}






/*What is this?*/
translate([0, 0, 285]) 
difference() {

    cylinder(h = 15, r = 36);

    union() {

        translate([-40, 0, 0]) 
        cube(80, center = false);

        translate([0, 0, 0]) 
        cylinder(h=270, r = 35);

    }

}