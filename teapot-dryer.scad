include <BOSL2/std.scad>

/* command-line parameters */
PNG = !is_undef(PNG);

/* [General] */
Height = 120;
// (use -1 to disable)
Legs = 6;

/* [Arm] */
Tube_diameter = 5;
Top_outer_diameter = 20;
Bottom_outer_diameter = 50;

module all() {
    stroke_height = Height - Tube_diameter;
    leg_separation_angle = 360 / Legs;
    first_leg = leg_separation_angle / 2;
    rotations = [for (i=[0:(ceil(Legs/2)-1)]) first_leg + i * leg_separation_angle];
    translate([0, 0, Tube_diameter / 2])
    yflip_copy()
    zrot_copies(rotations)
    stroke(
        helix(h=Height-Tube_diameter, d2=Top_outer_diameter-Tube_diameter, d1=Bottom_outer_diameter-Tube_diameter, turns=1),
        width=Tube_diameter

    );
}

$vpd = 362;
$fn=20;
//$fn=(PNG || !$preview) ? 90 : 20;
$slop = 0.2;

all();
