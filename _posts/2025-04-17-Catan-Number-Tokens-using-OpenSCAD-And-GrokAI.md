---
categories:
  - AI
  - 3d Printing
---

OpenSCAD is a simple programming language for creating 3d models. 

I have used Grok to create Settler of Catan game tokens and published the file to 3MF and scad files to [Makerworld]()

## Useful OpenSCAD links

* [Cheatsheet](https://openscad.org/cheatsheet/)
* [Customize Parameters](https://en.m.wikibooks.org/wiki/OpenSCAD_User_Manual/Customizer)
* [Colors](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Transformations#color)

**The below was all generated using Grok!!!**

To modify the _Catan_ 5–6 player number tokens in OpenSCAD so that tokens with five probability dots (numbers 6 and 8) have their numbers and dots colored red instead of brown, we’ll update the number\_token module to conditionally apply the red color (\[1, 0, 0\]) for these tokens. The rest of the design remains unchanged: tokens are 25 mm in diameter, 3 mm thick, with a half-and-half body (light yellow top \[1, 1, 0.8\], blue bottom \[0, 0, 1\]), black letters (\[0, 0, 0\]) on the bottom, and chamfered edges. The numbers and dots (brown \[0.65, 0.16, 0.16\] for other tokens) and letters are raised 0.5 mm, with reduced number-dot spacing (y = -6) and fixed letter visibility.**Design Changes**

*   **Conditional Color for Numbers and Dots**:
    
    *   For tokens with dots == 5 (numbers 6 and 8), set the number and dot color to red (\[1, 0, 0\]).
        
    *   For all other tokens (dots = 1, 2, 3, or 4), retain brown (\[0.65, 0.16, 0.16\]).
        
*   **Affected Tokens**:
    
    *   From the token data, numbers 6 (L, M, N, O) and 8 (P, Q, R, S) each have 5 dots, totaling 8 tokens.
        
*   **Unchanged Features**:
    
    *   Half-and-half body: Light yellow top half (z = 1.5 to 3), blue bottom half (z = 0 to 1.5).
        
    *   Black letters on the bottom, protruding 0.5 mm downward, visible against the blue half.
        
    *   Dots at y = -6 for reduced spacing.
        
    *   28 tokens, 25 mm diameter, 3 mm thick, 0.3 mm chamfers.
        

**OpenSCAD Code**Below is the updated code, modifying the number\_token module to use red for numbers and dots when dots == 5, while keeping all other features intact.openscad

```bash
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

// Height of raised text, numbers and dots
text_height = 0.02;

 // Chamfer for edge to reduce elephant foot
chamfer = 0.0;

// Resolution for smooth cylinders
$fn = 50; 

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
    // Top half
    color(numberBackgroundColor) 
        translate([0, 0, token_height/2]) // Start at mid-height
            half_chamfered_cylinder(h=token_height/2, d=token_diameter, is_top=true);
    
    // Bottom half
    color(textBackgroundColor)
        half_chamfered_cylinder(h=token_height/2, d=token_diameter, is_top=false);
    
    // Top side: Number (red for 5 dots, brown otherwise)
    color(dots == 5 ? fiveDotColor : numberColor) // Alt color for five dots
        translate([0, 2, token_height])
            linear_extrude(height=text_height)
                text(str(number), size=number_text_size, font=numberFont,
                     halign="center", valign="center", $fn=$fn);
    
    // Top side: Probability dots (red for 5 dots, brown otherwise)
    if (dots > 0) {
            color(dots == 5 ? fiveDotColor : numberColor) // Alt color for five dots
            for (i = [0:dots-1]) {
                translate([-1.5 * (dots-1) + i * 3, -6, token_height])
                    linear_extrude(height=text_height)
                        circle(d=dot_diameter, $fn=20);
            }
    }
    
    // Bottom side: Black letter (protruding 0.5 mm downward)
    color(textColor)
        translate([0, 0, 0]) // Start at bottom
            rotate([180, 0, 0]) // Flip to face downward
                translate([0, 0, text_height]) // Extrude downward
                    linear_extrude(height=text_height) // 0.5 mm protrusion
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
```

**Changes Made**

*   **Conditional Number/Dot Color**:
    
    *   color(dots == 5 ? \[1, 0, 0\] : \[0.65, 0.16, 0.16\])
        
    *   This sets red (\[1, 0, 0\]) for numbers and dots when dots == 5 (tokens for numbers 6 and 8), and brown (\[0.65, 0.16, 0.16\]) otherwise.
        
*   **Affected Tokens**:
    
    *   Number 6: Letters L, M, N, O (4 tokens, 5 dots each).
        
    *   Number 8: Letters P, Q, R, S (4 tokens, 5 dots each).
        
    *   Total: 8 tokens with red numbers and dots.
        
*   **Unchanged Features**:
    
    *   Half-and-half body: Light yellow top half (z = 1.5 to 3), blue bottom half (z = 0 to 1.5).
        
    *   Black letters protruding 0.5 mm downward on the bottom, visible against the blue half.
        
    *   Dots at y = -6 for reduced spacing (~8 mm center-to-center).
        
    *   25 mm diameter, 3 mm thick, 0.3 mm chamfers, 28 tokens.
        

**Explanation**

*   **Dimensions**: 25 mm diameter, 3 mm thick (1.5 mm per half), 0.3 mm chamfers. Numbers (8 mm), letters (5 mm), dots (1.5 mm diameter), all raised 0.5 mm.
    
*   **Top Side**: Light yellow half, brown numbers/dots for numbers 2, 3, 4, 5, 9, 10, 11, 12; red numbers/dots for 6 and 8 (5 dots). Dots at y = -6.
    
*   **Bottom Side**: Blue half, black letters protruding from z = -0.5 to z = 0.
    
*   **Colors**: Light yellow/blue body, red/brown numbers/dots, black letters. Multi-color for preview.
    
*   **Token Data**: 28 tokens (2–12, A–Zb, 1–5 dots).
    
*   **Layout**: 7×4 grid with 5 mm spacing.
    

**Printing Instructions**

*   **Filament**:
    
    *   **Multi-Material Printer**: Use light yellow PLA for the top half, blue PLA for the bottom half, red PLA for numbers/dots (6 and 8), brown PLA for numbers/dots (other numbers), black PLA for letters. A dual-extruder printer can handle two colors (e.g., yellow/blue body); a multi-material printer (e.g., Prusa MMU2S) is ideal for all colors.
        
    *   **Single-Material Printer**: Print in one color (e.g., white PLA) and paint: top half light yellow, bottom half blue, numbers/dots red (for 6 and 8) or brown (others), letters black with acrylic paints or markers.
        
*   **Settings**: 0.2 mm layer height, 100% infill, 1 external perimeter. No supports needed.
    
*   **Export**:
    
    *   Export as AMF to preserve colors for compatible slicers (e.g., PrusaSlicer).
        
    *   For STL, export each token individually or separate in the slicer.
        
    *   For one token, comment out the loop and call number\_token(tokens\[i\]\[0\], tokens\[i\]\[1\], tokens\[i\]\[2\]) for a specific i.
        
*   **Multi-Material Tip**: Configure the slicer to switch filaments at z = 1.5 mm for the yellow/blue body. For red/brown, assign materials based on the dots == 5 condition in the slicer’s multi-material settings.
    
*   **Quantity**: Print 28 tokens.
    

**Verification**

*   **Red Numbers/Dots**: Tokens for numbers 6 (L, M, N, O) and 8 (P, Q, R, S) have red numbers and dots in preview (F5). Others remain brown.
    
*   **Letter Visibility**: Letters protrude from z = -0.5 to z = 0, visible against the blue bottom half. Render (F6) to confirm.
    
*   **Number-Dot Spacing**: Dots at y = -6 maintain reduced gap.
    
*   **Protrusion**: Numbers, dots, and letters protrude 0.5 mm.
    

**Tips**

*   **Preview**: Use F5 to check red numbers/dots for 6 and 8 (5 dots), brown for others, and black letters on blue bottom. Rotate and zoom to verify. Render (F6) if needed.
    
*   **Customization**: Adjust text\_height to 0.7 mm for more pronounced text or tweak red (\[1, 0, 0\]) to a different shade (e.g., \[0.8, 0, 0\]).
    
*   **Font**: Uses “Liberation Sans”; check Help > Font List in OpenSCAD and use “Arial” if needed.
    
*   **Stackability**: Chamfers and flat surfaces ensure stackability despite raised text.
    

**Troubleshooting**

*   **Red Color Not Applied**: Verify the dots == 5 condition in both number and dot color() calls. Check token data for 6 and 8 (5 dots).
    
*   **Letters Not Visible**: Render (F6) to confirm geometry. Increase text\_height to 0.7 mm if needed.
    
*   **Color Misalignment**: In multi-material printing, ensure filament switches at z = 1.5 mm and correct material assignment for red/brown. For painting, use masking tape for clean lines.
    
*   **Seam Issues**: If yellow-blue seam is uneven, adjust z-layer transition or sand post-print.
    

If you encounter issues (e.g., colors not rendering, printing challenges), need further tweaks (e.g., different colors, spacing, or resource tokens), or want a single token’s code, let me know with details. I can also adjust for different letter conventions (e.g., AA–CC instead of Za–Zc).