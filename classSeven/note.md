1. CSS Colors

CSS colors are used to set the text color, background color, border color, etc.

Basic Example
<!DOCTYPE html>
<html>
<head>
    <style>
        h1 {
            color: red;
        }

        p {
            color: blue;
        }
    </style>
</head>
<body>

    <h1>Hello Students</h1>
    <p>This is a CSS color example.</p>

</body>
</html>
Common Color Names
color: red;
color: blue;
color: green;
color: yellow;
color: black;
color: white;
color: orange;
color: purple;
2. RGB

RGB = Red, Green, Blue

RGB uses values from 0 to 255.

Syntax
color: rgb(red, green, blue);
Examples
color: rgb(255, 0, 0);      /* Red */
color: rgb(0, 255, 0);      /* Green */
color: rgb(0, 0, 255);      /* Blue */
color: rgb(0, 0, 0);        /* Black */
color: rgb(255, 255, 255);  /* White */
Example
<h1 style="color: rgb(255, 0, 0);">
    Red Heading
</h1>
Understanding RGB
rgb(255, 0, 0)
     │    │  │
     R    G  B

255 = Red
0   = Green
0   = Blue
3. RGBA

RGBA = Red + Green + Blue + Alpha

The A (Alpha) controls transparency.

Alpha value ranges from:

0   = Completely transparent
0.5 = 50% transparent
1   = Completely visible
Syntax
color: rgba(red, green, blue, alpha);
Examples
color: rgba(255, 0, 0, 1);
color: rgba(255, 0, 0, 0.5);
color: rgba(255, 0, 0, 0.2);
Example
<div style="background-color: rgba(255, 0, 0, 0.5);">
    Transparent Red Background
</div>
Practical Example
<!DOCTYPE html>
<html>
<head>
    <style>
        .box {
            width: 300px;
            height: 150px;
            background-color: rgba(0, 0, 255, 0.5);
        }
    </style>
</head>

<body>

    <div class="box">
        RGBA Example
    </div>

</body>
</html>
4. HEX Color

HEX means Hexadecimal Color.

HEX colors use:

#RRGGBB

Each pair represents:

RR = Red
GG = Green
BB = Blue

Values range from:

00 → FF
Examples
color: #ff0000; /* Red */
color: #00ff00; /* Green */
color: #0000ff; /* Blue */
color: #000000; /* Black */
color: #ffffff; /* White */
More Examples
color: #ff5733;
color: #3498db;
color: #2ecc71;
color: #9b59b6;
Short HEX

Some HEX colors can be shortened.

#ffffff → #fff
#000000 → #000
#ff0000 → #f00
#00ff00 → #0f0
#0000ff → #00f
5. HSL

HSL = Hue, Saturation, Lightness

Syntax
color: hsl(hue, saturation, lightness);
Hue

Hue represents the color.

It uses degrees:

0°   = Red
120° = Green
240° = Blue
Saturation

Controls the intensity of the color.

0%   = Gray
100% = Full color
Lightness

Controls how light or dark the color is.

0%   = Black
50%  = Normal color
100% = White
Examples
color: hsl(0, 100%, 50%);     /* Red */
color: hsl(120, 100%, 50%);   /* Green */
color: hsl(240, 100%, 50%);   /* Blue */
Example
<h1 style="color: hsl(240, 100%, 50%);">
    HSL Blue
</h1>
6. Background

The CSS background properties are used to control the background of an element.

Important properties:

background-color
background-image
background-repeat
background-position
background-size
background
6.1 background-color

Used to set the background color.

body {
    background-color: lightblue;
}

Example:

<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-color: lightblue;
        }
    </style>
</head>

<body>

    <h1>My Website</h1>
    <p>Welcome to my website.</p>

</body>
</html>
6.2 Background Color with HEX
body {
    background-color: #f2f2f2;
}
6.3 Background Color with RGB
body {
    background-color: rgb(240, 240, 240);
}
6.4 Background Image

The background-image property adds an image to the background.

body {
    background-image: url("image.jpg");
}

Example:

<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-image: url("nature.jpg");
        }
    </style>
</head>

<body>

    <h1>Nature Website</h1>

</body>
</html>
6.5 background-repeat

By default, a background image can repeat.

No Repeat
body {
    background-image: url("image.jpg");
    background-repeat: no-repeat;
}
Repeat Horizontally
background-repeat: repeat-x;
Repeat Vertically
background-repeat: repeat-y;
Normal Repeat
background-repeat: repeat;
6.6 background-size

Controls the size of the background image.

Cover

The image covers the entire element.

background-size: cover;
Contain

The complete image fits inside the element.

background-size: contain;
Specific Size
background-size: 300px 200px;
6.7 background-position

Controls the position of the background image.

background-position: center;

Other values:

background-position: top;
background-position: bottom;
background-position: left;
background-position: right;
background-position: center;
6.8 Complete Background Example
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-image: url("nature.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }

        h1 {
            color: white;
            text-align: center;
        }
    </style>
</head>

<body>

    <h1>Beautiful Nature</h1>

</body>
</html>
7. CSS background Shorthand

Instead of writing multiple properties:

body {
    background-color: black;
    background-image: url("image.jpg");
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}

We can use shorthand:

body {
    background: black url("image.jpg") no-repeat center / cover;
}
8. Practical Class Example

Ask students to create a Profile Card using different color formats.

<!DOCTYPE html>
<html>
<head>

    <style>

        body {
            background-color: #f2f2f2;
        }

        .card {
            width: 300px;
            padding: 30px;
            margin: 50px auto;
            background-color: white;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            color: rgb(30, 100, 200);
        }

        p {
            color: hsl(0, 0%, 40%);
        }

        button {
            background-color: #3498db;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
        }

        button:hover {
            background-color: rgba(52, 152, 219, 0.8);
        }

    </style>

</head>

<body>

    <div class="card">

        <h1>Abhishek</h1>

        <p>
            I am learning HTML and CSS.
        </p>

        <button>
            Contact Me
        </button>

    </div>

</body>
</html>
Quick Revision
Topic	Example
Color Name	color: red;
RGB	rgb(255, 0, 0)
RGBA	rgba(255, 0, 0, 0.5)
HEX	#ff0000
HSL	hsl(0, 100%, 50%)
Background Color	background-color: blue;
Background Image	background-image: url("image.jpg");
Background Repeat	background-repeat: no-repeat;
Background Size	background-size: cover;
Background Position	background-position: center;
Background Shorthand	background: black url("image.jpg") no-repeat center / cover;



 – CSS Typography

Typography means how text looks on a webpage. CSS provides different properties to control fonts, text alignment, spacing, style, and appearance.

1. Fonts

The font-family property is used to choose the font of text.

Syntax
selector {
    font-family: font-name;
}
Example
<!DOCTYPE html>
<html>
<head>
    <style>
        h1 {
            font-family: Arial;
        }

        p {
            font-family: Georgia;
        }
    </style>
</head>
<body>

    <h1>Welcome to CSS</h1>

    <p>
        CSS is used to style webpages.
    </p>

</body>
</html>
Common Fonts
font-family: Arial;
font-family: Verdana;
font-family: Georgia;
font-family: Times New Roman;
font-family: Courier New;
Font Fallback

It is good practice to provide multiple fonts.

p {
    font-family: Arial, sans-serif;
}

The browser will use:

Arial
If Arial is unavailable → sans-serif

Another example:

p {
    font-family: Georgia, "Times New Roman", serif;
}
2. Google Fonts

Google Fonts provides many free fonts that can be used on websites.

One easy method is using the Google Fonts <link> inside <head>.

For example:

<!DOCTYPE html>
<html>
<head>

    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
        rel="stylesheet"
    >

    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>

</head>

<body>

    <h1>Welcome to My Website</h1>

    <p>This text uses Google Fonts.</p>

</body>
</html>
Important
<link ...>

is placed inside:

<head>

Then use the font with:

font-family: 'Poppins', sans-serif;
3. Font Weight

font-weight controls how thick or bold the text appears.

Common Values
font-weight: normal;
font-weight: bold;

You can also use numbers:

font-weight: 100;
font-weight: 200;
font-weight: 300;
font-weight: 400;
font-weight: 500;
font-weight: 600;
font-weight: 700;
font-weight: 800;
font-weight: 900;

Generally:

400 → Normal
700 → Bold
Example
<style>
    .normal {
        font-weight: 400;
    }

    .bold {
        font-weight: 700;
    }

    .extra-bold {
        font-weight: 900;
    }
</style>

<p class="normal">Normal Text</p>
<p class="bold">Bold Text</p>
<p class="extra-bold">Extra Bold Text</p>
4. Font Style

font-style controls whether text is normal, italic, or oblique.

Values
font-style: normal;
font-style: italic;
font-style: oblique;
Example
<style>
    .normal {
        font-style: normal;
    }

    .italic {
        font-style: italic;
    }

    .oblique {
        font-style: oblique;
    }
</style>

<p class="normal">Normal Text</p>
<p class="italic">Italic Text</p>
<p class="oblique">Oblique Text</p>
Most Common
p {
    font-style: italic;
}
5. Text Align

text-align controls the horizontal alignment of text.

Values
text-align: left;
text-align: center;
text-align: right;
text-align: justify;
Example
<style>
    .left {
        text-align: left;
    }

    .center {
        text-align: center;
    }

    .right {
        text-align: right;
    }

    .justify {
        text-align: justify;
    }
</style>

<p class="left">Left aligned text</p>

<p class="center">Center aligned text</p>

<p class="right">Right aligned text</p>

<p class="justify">
    CSS provides many properties for controlling the appearance
    and layout of text on a webpage.
</p>
Visual Understanding
LEFT

This is text
------------>


CENTER

      This is text
          ↓


RIGHT

             This is text
                        


JUSTIFY

This is a long paragraph where the text
is spread across the available width.
6. Text Transform

text-transform changes the capitalization of text.

Values
text-transform: uppercase;
text-transform: lowercase;
text-transform: capitalize;
text-transform: none;
Uppercase
h1 {
    text-transform: uppercase;
}

Output:

WELCOME TO CSS
Lowercase
p {
    text-transform: lowercase;
}

Output:

welcome to css
Capitalize
h2 {
    text-transform: capitalize;
}

Output:

Welcome To Css
Complete Example
<style>
    .upper {
        text-transform: uppercase;
    }

    .lower {
        text-transform: lowercase;
    }

    .capital {
        text-transform: capitalize;
    }
</style>

<p class="upper">hello world</p>

<p class="lower">HELLO WORLD</p>

<p class="capital">hello world from css</p>
7. Letter Spacing

letter-spacing controls the space between individual letters.

Syntax
letter-spacing: value;
Example
h1 {
    letter-spacing: 5px;
}

Output looks approximately like:

H E L L O
Normal
letter-spacing: normal;
More Space
letter-spacing: 5px;
Less Space

Negative values can also be used:

letter-spacing: -1px;
Example
<style>
    .normal {
        letter-spacing: normal;
    }

    .wide {
        letter-spacing: 5px;
    }

    .tight {
        letter-spacing: -1px;
    }
</style>

<h2 class="normal">NORMAL TEXT</h2>

<h2 class="wide">WIDE TEXT</h2>

<h2 class="tight">TIGHT TEXT</h2>
8. Line Height

line-height controls the vertical space between lines of text.

This is especially useful for paragraphs.

Example
p {
    line-height: 1.8;
}
Using Pixels
p {
    line-height: 30px;
}
Using a Number
p {
    line-height: 1.5;
}

A value of 1.5 means the line height is approximately 1.5 times the font size.

Example
<style>
    .small {
        line-height: 1;
    }

    .normal {
        line-height: 1.5;
    }

    .large {
        line-height: 2;
    }
</style>

<p class="small">
    This is a paragraph with small line spacing.
    This is another line of the same paragraph.
</p>

<p class="normal">
    This is a paragraph with normal line spacing.
    This is another line of the same paragraph.
</p>

<p class="large">
    This is a paragraph with large line spacing.
    This is another line of the same paragraph.
</p>
9. Complete Typography Example

This example combines all the Class 15 concepts.

<!DOCTYPE html>
<html>
<head>

    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
        rel="stylesheet"
    >

    <style>

        body {
            font-family: 'Poppins', sans-serif;
        }

        h1 {
            font-weight: 700;
            font-style: normal;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 3px;
        }

        p {
            font-weight: 400;
            line-height: 1.8;
            text-align: justify;
        }

        .important {
            font-weight: 600;
            font-style: italic;
            text-transform: capitalize;
        }

    </style>

</head>

<body>

    <h1>CSS Typography</h1>

    <p>
        Typography is an important part of web design.
        CSS provides many properties to control the appearance
        and readability of text.
    </p>

    <p class="important">
        learn css typography step by step
    </p>

</body>
</html>
10. Quick Revision
Property	Purpose	Example
font-family	Changes font	font-family: Arial;
font-weight	Controls thickness	font-weight: 700;
font-style	Normal/italic style	font-style: italic;
text-align	Aligns text	text-align: center;
text-transform	Changes capitalization	text-transform: uppercase;
letter-spacing	Space between letters	letter-spacing: 3px;
line-height	Space between lines	line-height: 1.5;