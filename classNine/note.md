CSS visibility

The visibility property controls whether an element is visible or hidden.

1. visibility: visible

Element is visible. This is the default.

<p class="visible">I am visible</p>
.visible {
  visibility: visible;
}
2. visibility: hidden

Element becomes invisible, but it still occupies space.

<div class="box">Box 1</div>
<div class="hidden-box">Box 2</div>
<div class="box">Box 3</div>
.box {
  width: 100px;
  height: 50px;
  background: lightblue;
  margin: 10px;
}


.hidden-box {
  width: 100px;
  height: 50px;
  background: red;
  margin: 10px;
  visibility: hidden;
}

The space for Box 2 remains, even though you cannot see it.

visibility vs display
Property	Element visible?	Space occupied?
visibility: visible	✅ Yes	✅ Yes
visibility: hidden	❌ No	✅ Yes
display: none	❌ No	❌ No
CSS overflow

The overflow property controls what happens when content is larger than its container.

Example:

<div class="box">
  This is a very long text that does not fit inside the box.
  This text will overflow outside the container.
</div>
.box {
  width: 200px;
  height: 80px;
  border: 2px solid black;
}
1. overflow: visible

Default behavior.

.box {
  overflow: visible;
}

Content can come outside the box.

+----------------+
| This is a very |
| long text that  |
+----------------+
       text continues
       outside
2. overflow: hidden

Extra content is hidden.

.box {
  overflow: hidden;
}
+----------------+
| This is a very |
| long text that  |
| is hidden...   |
+----------------+

Useful when you don't want content to escape a container.

3. overflow: scroll

Always shows scrollbars.

.box {
  overflow: scroll;
}

The user can scroll to see the hidden content.

4. overflow: auto

Scrollbars appear only when necessary.

.box {
  overflow: auto;
}

This is commonly used for containers where the content size can change.

overflow-x and overflow-y

You can control horizontal and vertical overflow separately.

Horizontal
.box {
  overflow-x: auto;
}
Vertical
.box {
  overflow-y: auto;
}

Example:

.box {
  width: 300px;
  height: 150px;
  overflow-y: auto;
}

This creates a vertical scroll when the content becomes too tall.

Easy way to remember
visibility
    ↓
Controls whether the element can be seen


overflow
    ↓
Controls what happens when content doesn't fit



There are 5 main values:

static
relative
absolute
fixed
sticky

And we use z-index to control which element appears on top.

1. position: static

static is the default position of every element.

<div class="box">Box</div>
.box {
  position: static;
  top: 50px;
  left: 50px;
}

top, left, right, and bottom do not work with static.

Example
<div>Box 1</div>
<div>Box 2</div>
<div>Box 3</div>
div {
  width: 100px;
  height: 50px;
  margin: 10px;
  background: lightblue;
}

The elements follow the normal document flow.

2. position: relative

relative keeps the element's original space but allows you to move it.

.box {
  position: relative;
  top: 20px;
  left: 30px;
}

The box moves:

Original position
      ↓
   +-------+
   |  Box  |
   +-------+


After top: 20px and left: 30px


          +-------+
          |  Box  |
          +-------+
Important

The original space is still reserved.

<div class="box">Box 1</div>
<div>Box 2</div>
.box {
  position: relative;
  left: 50px;
}

Box 2 does not move into the original position of Box 1.

Common use

relative is very commonly used as a parent for an absolute element.

3. position: absolute

absolute removes the element from the normal document flow.

.box {
  position: absolute;
  top: 50px;
  left: 100px;
}

The element is positioned relative to its nearest positioned ancestor.

Usually we create:

.parent {
  position: relative;
}


.child {
  position: absolute;
  top: 10px;
  right: 10px;
}
HTML
<div class="parent">
  <div class="child">Child</div>
</div>
CSS
.parent {
  width: 300px;
  height: 200px;
  background: lightblue;
  position: relative;
}


.child {
  width: 80px;
  height: 50px;
  background: red;
  position: absolute;
  top: 10px;
  right: 10px;
}

The child appears at the top-right corner of the parent.

Very common pattern
.parent {
  position: relative;
}


.child {
  position: absolute;
}

Examples:

Notification badge
Icon inside an input
Text over an image
Dropdown
Close button
Card labels
4. position: fixed

A fixed element stays attached to the browser window (viewport).

.box {
  position: fixed;
  bottom: 20px;
  right: 20px;
}

When you scroll, the element stays in the same place.

Example
<button class="help">Help</button>
.help {
  position: fixed;
  right: 20px;
  bottom: 20px;
  padding: 15px 25px;
}

The button remains at the bottom-right of the screen.

Common uses
Chat button
Back-to-top button
Floating action button
Fixed navbar
Cookie notification
5. position: sticky

sticky behaves like relative initially, but when you scroll to a specified position, it sticks.

.header {
  position: sticky;
  top: 0;
}

Example:

<div class="header">My Header</div>


<p>Lots of content...</p>
<p>Lots of content...</p>
<p>Lots of content...</p>
.header {
  position: sticky;
  top: 0;
  background: white;
}

As you scroll, the header sticks to the top of the screen.

Common uses
Sticky navbar
Table headers
Sidebar
Section headings
6. z-index

z-index controls the stacking order of positioned elements.

Think of it as:

Which element should appear on top?

.box1 {
  position: absolute;
  z-index: 1;
}


.box2 {
  position: absolute;
  z-index: 2;
}

box2 will appear above box1.

Example
<div class="box red">Red</div>
<div class="box blue">Blue</div>
.box {
  width: 150px;
  height: 150px;
  position: absolute;
}


.red {
  background: red;
  top: 50px;
  left: 50px;
  z-index: 1;
}


.blue {
  background: blue;
  top: 100px;
  left: 100px;
  z-index: 2;
}

Because:

blue z-index = 2
red  z-index = 1

The blue box appears on top.