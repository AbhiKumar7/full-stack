CSS Grid

CSS Grid is a layout system used to arrange elements into rows and columns.

It is especially useful for:

Website layouts
Cards
Dashboards
Galleries
Forms
Responsive designs
1. Basic Grid
HTML
<div class="container">
  <div>Box 1</div>
  <div>Box 2</div>
  <div>Box 3</div>
  <div>Box 4</div>
</div>
CSS
.container {
  display: grid;
  grid-template-columns: 200px 200px;
  gap: 20px;
}


.container div {
  background-color: lightblue;
  padding: 30px;
  text-align: center;
}
Result
┌────────────┐  ┌────────────┐
│   Box 1    │  │   Box 2    │
└────────────┘  └────────────┘


┌────────────┐  ┌────────────┐
│   Box 3    │  │   Box 4    │
└────────────┘  └────────────┘
2. grid-template-columns

This property defines how many columns you want.

3 equal columns
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}

fr means fraction of available space.

┌────────┐ ┌────────┐ ┌────────┐
│ Box 1  │ │ Box 2  │ │ Box 3  │
└────────┘ └────────┘ └────────┘

You can also write:

grid-template-columns: repeat(3, 1fr);

This is the same as:

grid-template-columns: 1fr 1fr 1fr;
3. Different Column Sizes
.container {
  display: grid;
  grid-template-columns: 200px 1fr;
}

Here:

First column = 200px
Second column = remaining space
┌──────────────┬──────────────────────────┐
│              │                          │
│   200px      │        1fr               │
│              │                          │
└──────────────┴──────────────────────────┘
4. grid-template-rows

Used to define row heights.

.container {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 100px 200px;
}
Row 1 → 100px
┌────────────┬────────────┐
│            │            │
└────────────┴────────────┘


Row 2 → 200px
┌────────────┬────────────┐
│            │            │
│            │            │
└────────────┴────────────┘
5. gap

gap creates space between rows and columns.

.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
}

You can also separately control them:

gap: 20px 30px;

Meaning:

row gap    = 20px
column gap = 30px
6. grid-column

You can make an element occupy multiple columns.

<div class="container">
  <div class="box box1">Box 1</div>
  <div class="box">Box 2</div>
  <div class="box">Box 3</div>
  <div class="box">Box 4</div>
</div>
.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
}


.box1 {
  grid-column: 1 / 3;
}

Box 1 will occupy 2 columns:

┌──────────────────────┬──────────┐
│        Box 1         │  Box 2   │
└──────────────────────┴──────────┘
┌──────────┐
│  Box 3   │
└──────────┘
┌──────────┐
│  Box 4   │
└──────────┘
7. grid-row

Similarly, an element can occupy multiple rows.

.box1 {
  grid-row: 1 / 3;
}
┌──────────┬──────────┐
│          │  Box 2   │
│  Box 1   ├──────────┤
│          │  Box 3   │
└──────────┴──────────┘
8. repeat()

Instead of writing:

grid-template-columns: 1fr 1fr 1fr 1fr;

Use:

grid-template-columns: repeat(4, 1fr);

For 6 columns:

grid-template-columns: repeat(6, 1fr);
9. Responsive Grid

One of the most useful Grid techniques:

.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
}

On smaller screens:

@media (max-width: 768px) {
  .container {
    grid-template-columns: 1fr;
  }
}

Desktop:

┌──────┐ ┌──────┐ ┌──────┐
│ Card │ │ Card │ │ Card │
└──────┘ └──────┘ └──────┘

Mobile:

┌────────────┐
│    Card    │
└────────────┘
┌────────────┐
│    Card    │
└────────────┘
┌────────────┐
│    Card    │
└────────────┘
10. auto-fit — Very Useful

You can create a responsive grid without media queries.

.container {
  display: grid;
  grid-template-columns: repeat(
    auto-fit,
    minmax(200px, 1fr)
  );
  gap: 20px;
}

This means:

Create as many columns as can fit, but each column should be at least 200px.

This is excellent for card layouts.

11. Complete Card Example
HTML
<div class="cards">


  <div class="card">
    <h2>HTML</h2>
    <p>Learn HTML basics.</p>
  </div>


  <div class="card">
    <h2>CSS</h2>
    <p>Learn CSS styling.</p>
  </div>


  <div class="card">
    <h2>JavaScript</h2>
    <p>Learn JavaScript.</p>
  </div>


  <div class="card">
    <h2>React</h2>
    <p>Learn React.</p>
  </div>


</div>
CSS
.cards {
  display: grid;
  grid-template-columns: repeat(
    auto-fit,
    minmax(200px, 1fr)
  );
  gap: 20px;
}


.card {
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 10px;
  background-color: #f5f5f5;
}

The cards automatically rearrange depending on screen size.

12. Grid Alignment
Horizontal alignment
.container {
  display: grid;
  justify-items: center;
}
Vertical alignment
.container {
  display: grid;
  align-items: center;
}
Both
.container {
  display: grid;
  place-items: center;
}

place-items: center is a very common way to center content.