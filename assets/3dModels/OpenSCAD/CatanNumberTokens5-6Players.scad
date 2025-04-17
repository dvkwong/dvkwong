// Settlers of Catan Number Tokens for 5-6 Player Extension
// Modified: Token body half light yellow (top), half blue (bottom); Letters (black) on bottom, Numbers/Dots (brown, or red for 5 dots) on top
// Changes: Red numbers/dots for tokens with 5 dots, half-and-half color, fixed letter visibility, reduced number-dot spacing, equal protrusion
// Parametric design for 3D printing

// Dimensions (in mm)
token_diameter = 25; // Standard Catan token size
token_height = 3; // Total thickness for stackability
number_text_size = 8; // Size for number text
letter_text_size = 8; // Size for letter text
text_height = 0.005; // Height of raised text and dots
dot_diameter = 1.5; // Diameter of probability dots
chamfer = 0.0; // Chamfer for edge to reduce elephant foot
$fn = 50; // Resolution for smooth cylinders
numberFont = "Liberation Sans";
textFont = "Liberation Sans";

// Module: Half Chamfered Cylinder (for top or bottom half)
module half_chamfered_cylinder(h, d, is_top) {
    difference() {
        cylinder(h=h, d=d, $fn=$fn);
        if (is_top) {
            // Top chamfer (for top half)
            translate([0, 0, h-chamfer])
                cylinder(h=chamfer+0.01, d1=d, d2=d-chamfer*2, $fn=$fn);
        } else {
            // Bottom chamfer (for bottom half)
            translate([0, 0, -0.01])
                cylinder(h=chamfer+0.01, d1=d-chamfer*2, d2=d, $fn=$fn);
        }
    }
}

// Module: Number Token with Half-and-Half Color and Conditional Number/Dot Color
module number_token(number, letter, dots) {
    // Top half (light yellow)
    color([1, 1, 0.8]) // Light yellow
        translate([0, 0, token_height/2]) // Start at mid-height
            half_chamfered_cylinder(h=token_height/2, d=token_diameter, is_top=true);
    
    // Bottom half (blue)
    color([0, 0, 1]) // Blue
        half_chamfered_cylinder(h=token_height/2, d=token_diameter, is_top=false);
    
    // Top side: Number (red for 5 dots, brown otherwise)
    color(dots == 5 ? [1, 0, 0] : [0.65, 0.16, 0.16]) // Red for 5 dots, brown otherwise
        translate([0, 2, token_height])
            linear_extrude(height=text_height)
                text(str(number), size=number_text_size, font=numberFont,
                     halign="center", valign="center", $fn=$fn);
    
    // Top side: Probability dots (red for 5 dots, brown otherwise)
    if (dots > 0) {
        color(dots == 5 ? [1, 0, 0] : [0.65, 0.16, 0.16]) // Red for 5 dots, brown otherwise
            for (i = [0:dots-1]) {
                translate([-1.5 * (dots-1) + i * 3, -6, token_height])
                    linear_extrude(height=text_height)
                        circle(d=dot_diameter, $fn=20);
            }
    }
    
    // Bottom side: Black letter (protruding 0.5 mm downward)
    color([0, 0, 0]) // Black
        translate([0, 0, 0]) // Start at bottom
            rotate([180, 0, 0]) // Flip to face downward
                translate([0, 0, text_height]) // Extrude downward
                    linear_extrude(height=text_height) // 0.5 mm protrusion
                        text(letter, size=letter_text_size, font=textFont,
                             halign="center", valign="center", $fn=$fn);
}

// Token Data: Number, Letter, Dots
// Based on 5-6 player extension (28 tokens)
tokens = [
    [2,  "A",  1], [2,  "Zb", 1],
    [3,  "L",  2], [3,  "Za", 2], [3,  "E",  2],
    [4,  "C",  3], [4,  "U",  3], [4,  "N",  3],
    [5,  "B",  4], [5,  "W",  4], [5,  "T",  4],
    [6,  "D",  5], [6,  "Zc", 5], [6,  "K",  5],
    [8,  "G",  5], [8,  "M",  5], [8,  "O",  5],
    [9,  "X",  4], [9,  "V",  4], [9,  "F",  4],
    [10, "S",  3], [10, "J",  3], [10, "P",  3],
    [11, "H",  2], [11, "Q",  2], [11, "I", 2], 
    [12, "R",  1], [12, "Y",  1]
];

// Generate Tokens with Spacing for Preview/Printing
for (i = [0:len(tokens)-1]) {
    translate([(i % 7) * (token_diameter + 5), (i / 7) * (token_diameter + 5), 0])
        number_token(tokens[i][0], tokens[i][1], tokens[i][2]);
}