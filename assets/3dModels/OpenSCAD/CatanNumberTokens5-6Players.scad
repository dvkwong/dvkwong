// Settlers of Catan Number Tokens for 5-6 Player Extension
// Modified: Token body half light yellow (top), half blue (bottom); Letters (black) on bottom, Numbers/Dots (brown, or red for 5 dots) on top
// Changes: Red numbers/dots for tokens with 5 dots, half-and-half color, fixed letter visibility, reduced number-dot spacing, equal protrusion
// Parametric design for 3D printing. Custommize for any game!
// Author: David Wong 18th April 2024
// https://github.com/dvkwong

// Token Data: Number, Letter, Dots for Catan
// Based on 5-6 player extension (28 tokens)
// Customize for any game!
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

// Dimensions (in mm)
token_diameter = 25;
// Dimensions (in mm)
token_height = 3; 

// Number Font Size
number_text_size = 8; // Size for number text
// Number font
numberFont = "Black Han Sans"; // [Aldo, Anton, Archivo Black, Asap, Bangers, Black Han Sans, Bubblegum Sans, Bungee, Changa One, Chewy, Concert One, Fruktur, Gochi Hand, Griffy, Inter, Inter Tight, Itim, Jockey One, Kanit, Kavoon, Komikazoom, Lato, Liberation Sans, Lilita One, Lobster, Lora, Luckiest Guy, Merriweather Sans, Merriweather, Mitr, Montserrat, Montserrat Alternates, Montserrat Subrayada, Nanum Pen, Norwester, Noto Emoji, Noto Sans, Nunito, Nunito Sans, Open Sans, Open Sans Condensed, Orbitron, Oswald, Palanquin Dark, Passion One, Patrick Hand, Paytone One, Permanent Marker, Playfair Display, Playfair Display SC, Plus Jakarta Sans, PoetsenOne, Poppins, Rakkas, Raleway, Raleway Dots, Roboto, Roboto Condensed, Roboto Flex, Roboto Mono, Roboto Serif, Roboto Slab, Rubik, Rubik 80s Fade, Rubik Beastly, Rubik Broken Fax, Rubik Bubbles, Rubik Burned, Rubik Dirt, Rubik Distressed, Rubik Doodle Shadow, Rubik Doodle Triangles, Rubik Gemstones, Rubik Glitch Pop, Rubik Glitch, Rubik Iso, Rubik Lines, Rubik Maps, Rubik Marker Hatch, Rubik Maze, Rubik Microbe, Rubik Mono One, Rubik Moonrocks, Rubik One, Rubik Pixels, Rubik Puddles, Rubik Scribble, Rubik Spray Paint, Rubik Storm, Rubik Vinyl, Rubik Wet Paint, Russo One, Saira Stencil One, Shrikhand, Source Sans 3, Spicy Rice, Squada One, Titan One, Ubuntu, Ubuntu Condensed, Ubuntu Mono, Ubuntu Sans, Ubuntu Sans Mono, Work Sans] // Selectable font list
// Number color
numberColor = "black";
// Number background color
numberBackgroundColor = "Wheat";

// Text Font Size
letter_text_size = 8; // Size for letter text
// Text Font
textFont = "Black Han Sans";  // [Aldo, Anton, Archivo Black, Asap, Bangers, Black Han Sans, Bubblegum Sans, Bungee, Changa One, Chewy, Concert One, Fruktur, Gochi Hand, Griffy, Inter, Inter Tight, Itim, Jockey One, Kanit, Kavoon, Komikazoom, Lato, Liberation Sans, Lilita One, Lobster, Lora, Luckiest Guy, Merriweather Sans, Merriweather, Mitr, Montserrat, Montserrat Alternates, Montserrat Subrayada, Nanum Pen, Norwester, Noto Emoji, Noto Sans, Nunito, Nunito Sans, Open Sans, Open Sans Condensed, Orbitron, Oswald, Palanquin Dark, Passion One, Patrick Hand, Paytone One, Permanent Marker, Playfair Display, Playfair Display SC, Plus Jakarta Sans, PoetsenOne, Poppins, Rakkas, Raleway, Raleway Dots, Roboto, Roboto Condensed, Roboto Flex, Roboto Mono, Roboto Serif, Roboto Slab, Rubik, Rubik 80s Fade, Rubik Beastly, Rubik Broken Fax, Rubik Bubbles, Rubik Burned, Rubik Dirt, Rubik Distressed, Rubik Doodle Shadow, Rubik Doodle Triangles, Rubik Gemstones, Rubik Glitch Pop, Rubik Glitch, Rubik Iso, Rubik Lines, Rubik Maps, Rubik Marker Hatch, Rubik Maze, Rubik Microbe, Rubik Mono One, Rubik Moonrocks, Rubik One, Rubik Pixels, Rubik Puddles, Rubik Scribble, Rubik Spray Paint, Rubik Storm, Rubik Vinyl, Rubik Wet Paint, Russo One, Saira Stencil One, Shrikhand, Source Sans 3, Spicy Rice, Squada One, Titan One, Ubuntu, Ubuntu Condensed, Ubuntu Mono, Ubuntu Sans, Ubuntu Sans Mono, Work Sans] // Selectable font list
// Text Color
textColor = "black";
// Text background color
textBackgroundColor = "cyan";

/* [AdditionalSettings] */

// Color for 5 dots (red)
// This color will be used for both the number and dots when there are 5 dots
fiveDotColor = "red";

// Diameter of probability dots
dot_diameter = 1.5; 

/* hidden */
// Minimum height of raised text, numbers and dots
text_height = 0.4;

// Minimun height of text protrusion
text_protrusion_height = 0.1; 

// Resolution for smooth cylinders
$fn = 50; 

// Module: Number Token with Half-and-Half Color and Conditional Number/Dot Color
module number_token(number, letter, dots) {
    // Top half
    color(numberBackgroundColor) 
        translate([0, 0, token_height/2]) // Start at mid-height
            cylinder(h=token_height/2, d=token_diameter);
    
    // Bottom half
    color(textBackgroundColor)
        cylinder(h=token_height/2, d=token_diameter);
    
    // Top side: Number (red for 5 dots, brown otherwise)
    color(dots == 5 ? fiveDotColor : numberColor) // Alt color for five dots
        translate([0, 2, token_height - text_height])
            linear_extrude(height=text_height + text_protrusion_height) // 0.2 mm protrusion
                text(str(number), size=number_text_size, font=numberFont,
                     halign="center", valign="center", $fn=$fn);
    
    // Top side: Probability dots (red for 5 dots, brown otherwise)
    if (dots > 0) {
            color(dots == 5 ? fiveDotColor : numberColor) // Alt color for five dots
            for (i = [0:dots-1]) {
                translate([-1.5 * (dots-1) + i * 3, -6, token_height -text_height])
                    linear_extrude(height=text_height + text_protrusion_height)
                        circle(d=dot_diameter, $fn=20);
            }
    }
    
    // Bottom side: Black letter (protruding 0.5 mm downward)
    color(textColor)
        rotate([180, 0, 0]) // Flip to face downward
            translate([0, 0, -text_height]) // Extrude downward
                linear_extrude(height=text_height + text_protrusion_height) // 0.5 mm protrusion
                    text(letter, size=letter_text_size, font=textFont,
                            halign="center", valign="center", $fn=$fn);
}

// Generate Tokens with Spacing for Preview/Printing
cols = ceil(sqrt(len(tokens)));
rows = ceil(len(tokens) / cols);

// Calculate total grid dimensions
grid_width = cols * (token_diameter + 5) - 5; // Subtract extra spacing on the last column
grid_height = rows * (token_diameter + 5) - 5; // Subtract extra spacing on the last row

for (i = [0:len(tokens)-1]) {
    translate([
        (i % cols) * (token_diameter + 5) - grid_width / 2,  // Center horizontally
        floor(i / cols) * (token_diameter + 5) - grid_height / 2, // Center vertically
        0
    ])
        number_token(tokens[i][0], tokens[i][1], tokens[i][2]);
}