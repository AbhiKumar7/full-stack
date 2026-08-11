 CSS Display, Visibility & Overflow

Today we will learn how CSS controls how elements appear, take space, and behave inside a webpage.

1. display

The display property decides how an HTML element is displayed on the page.

Common values:

display: block;
display: inline;
display: inline-block;
display: none;

Example:

<!DOCTYPE html>
<html>
<head>
    <style>
        .box {
            display: block;
            background-color: lightblue;
            padding: 10px;
            margin: 5px;
        }
    </style>
</head>
<body>

    <div class="box">Box 1</div>
    <div class="box">Box 2</div>
    <div class="box">Box 3</div>

</body>
</html>
Result

Each <div> appears on a new line because <div> is a block element by default.

2. Block

A block element:

Starts on a new line
Takes the full available width by default
Allows width and height
Allows margin and padding

Common block elements:

<div>
<p>
<h1>
<h2>
<section>
<header>
<footer>
Example
<style>
    .box {
        display: block;
        width: 200px;
        height: 80px;
        background-color: lightblue;
        margin: 10px;
        padding: 10px;
    }
</style>

<div class="box">Box 1</div>
<div class="box">Box 2</div>
<div class="box">Box 3</div>
Important

Even though the width is only 200px, the next block element starts on a new line.

3. Inline

An inline element:

Does not start on a new line
Takes only the required width
width and height generally do not work as expected
It is useful for small portions of text

Common inline elements:

<span>
<a>
<strong>
<em>
Example
<style>
    span {
        display: inline;
        background-color: yellow;
    }
</style>

<p>
    Hello 
    <span>World</span>
    How are you?
</p>

The <span> stays in the same line.

Another example
<span>HTML</span>
<span>CSS</span>
<span>JavaScript</span>

Output:

HTML CSS JavaScript
Block vs Inline
Block
<div>HTML</div>
<div>CSS</div>
<div>JavaScript</div>

Output:

HTML
CSS
JavaScript
Inline
<span>HTML</span>
<span>CSS</span>
<span>JavaScript</span>

Output:

HTML CSS JavaScript
4. Inline-block

inline-block combines the advantages of inline + block.

It:

Stays on the same line like inline
Allows width and height like block
Allows margin and padding
Example
<style>
    .box {
        display: inline-block;
        width: 150px;
        height: 100px;
        background-color: lightblue;
        margin: 10px;
        padding: 10px;
    }
</style>

<div class="box">Box 1</div>
<div class="box">Box 2</div>
<div class="box">Box 3</div>

The boxes appear approximately like:

┌──────────┐  ┌──────────┐  ┌──────────┐
│  Box 1   │  │  Box 2   │  │  Box 3   │
└──────────┘  └──────────┘  └──────────┘
Real-world example

Navigation buttons:

<style>
    .btn {
        display: inline-block;
        width: 100px;
        padding: 10px;
        background-color: blue;
        color: white;
        text-align: center;
        margin: 5px;
    }
</style>

<a href="#" class="btn">Home</a>
<a href="#" class="btn">About</a>
<a href="#" class="btn">Contact</a>
5. visibility

The visibility property controls whether an element is visible.

Main values:

visibility: visible;
visibility: hidden;
visibility: visible

Element is visible normally.

.box {
    visibility: visible;
}
visibility: hidden

The element becomes invisible, but its space remains occupied.

<style>
    .box {
        width: 100px;
        height: 100px;
        background-color: red;
    }

    .hidden {
        visibility: hidden;
    }
</style>

<div class="box">Box 1</div>

<div class="box hidden">
    Box 2
</div>

<div class="box">Box 3</div>

You will see:

Box 1


Box 3

There is still space where Box 2 was.

6. display: none

display: none completely removes the element from the layout.

<style>
    .box {
        width: 100px;
        height: 100px;
        background-color: red;
    }

    .hidden {
        display: none;
    }
</style>

<div class="box">Box 1</div>

<div class="box hidden">
    Box 2
</div>

<div class="box">Box 3</div>

Output:

Box 1

Box 3

There is no space for Box 2.

Important difference
Property	Element visible?	Space occupied?
visibility: visible	Yes	Yes
visibility: hidden	No	Yes
display: none	No	No
7. Overflow

overflow controls what happens when content is larger than its container.

Common values:

overflow: visible;
overflow: hidden;
overflow: scroll;
overflow: auto;
Example
<style>
    .box {
        width: 200px;
        height: 100px;
        border: 2px solid black;
    }
</style>

<div class="box">
    This is a very long text. This text is larger than
    the box and will create an overflow situation.
</div>
8. overflow: visible

This is the default.

The extra content remains visible outside the box.

.box {
    width: 200px;
    height: 100px;
    overflow: visible;
}
9. overflow: hidden

Extra content is cut off.

.box {
    width: 200px;
    height: 100px;
    overflow: hidden;
}

Example:

<style>
    .box {
        width: 200px;
        height: 100px;
        border: 2px solid black;
        overflow: hidden;
    }
</style>

<div class="box">
    This is a very long text. The content that does not fit
    inside the box will be hidden.
</div>
10. overflow: scroll

Scrollbars are added so the user can see the hidden content.

.box {
    width: 200px;
    height: 100px;
    overflow: scroll;
}

Example:

<div class="box">
    This is a very long text. You can scroll to see the
    complete content inside this box.
</div>
11. overflow: auto

The browser adds scrollbars only when they are needed.

.box {
    width: 200px;
    height: 100px;
    overflow: auto;
}

This is commonly used in real projects.

Example
<style>
    .container {
        width: 300px;
        height: 150px;
        border: 2px solid black;
        overflow: auto;
    }
</style>

<div class="container">
    <p>
        This is a large amount of content. 
        When the content becomes larger than the container,
        the browser will automatically provide scrolling.
    </p>

    <p>
        More content here...
    </p>

    <p>
        More content here...
    </p>
</div>
12. overflow-x and overflow-y

You can control horizontal and vertical overflow separately.

.box {
    overflow-x: hidden;
    overflow-y: auto;
}
Meaning
overflow-x → Horizontal
overflow-y → Vertical

Example:

<style>
    .box {
        width: 300px;
        height: 150px;
        border: 2px solid black;

        overflow-x: hidden;
        overflow-y: auto;
    }
</style>

<div class="box">
    Lots of content goes here...
    <br><br>
    More content...
    <br><br>
    More content...
    <br><br>
    More content...
    <br><br>
    More content...
</div>
Quick Comparison
Property	Behavior
display: block	New line + full available width
display: inline	Same line + content width
display: inline-block	Same line + width/height
display: none	Completely removed
visibility: hidden	Hidden but space remains
overflow: visible	Extra content visible
overflow: hidden	Extra content hidden
overflow: scroll	Always provides scrolling
overflow: auto	Scrolling when required