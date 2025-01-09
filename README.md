[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/6l4sY1d2)
# Assignment 2: Play with a 2x2 Rubik Cube
by 

**NAME**: **MUHAMAD ZIKRY ADIB BIN MOHD SUHAIMI**

**Matric ID**: **2112197**

## Objective

1. Accept the assignment and make sure you have a copy of the code.
2. The code provide a partially working code.
3. Add the necessary faces of the rubik cube in the code.
4. Modify the logic for rotating the 2x2 cube.
5. Add buttons below the cube to create action buttons.
6. Create a simple 2x2 rubik cube application that allows the user to rotate the faces of a rubik cube. The code given doesn't work. You may have to read the code and complete some functions and add buttons.
7. Make sure to only submit your /lib folder and modify the readme to describe what was done. You must also include your name and matric ID in this readme file.

## Requirements:

Tips:
Make sure to look at https://docs.flutter.dev/cookbook/lists/grid-lists to get a hang of the flutter grid layout which is being used in the code.


What Was Done

This project involves building a 2x2 Rubik’s Cube application using Flutter. The goal was to create an interactive cube interface, implement rotation logic for all six faces, and provide buttons to control the rotations. Below is a detailed breakdown of the work done:
1. Initial Setup

    The main.dart file was created to house the entire code.
    The app structure includes:
        A CubeState class to handle the cube's logic and state.
        A CubeScreen widget to represent the visual UI of the cube and buttons.

2. Cube Representation

    The cube was represented as a List<List<Color>> where:
        Each face is a list of 4 Color values.
        Six faces were initialized with distinct colors:
            Front: Red
            Left: Blue
            Right: Green
            Back: Yellow
            Top: Orange
            Bottom: White

3. Rotation Logic

The rotation methods for each face were implemented in the CubeState class. These include:

    rotateTop: Rotates the top face clockwise and adjusts the corresponding rows of adjacent faces.
    rotateBottom: Rotates the bottom face clockwise and adjusts the corresponding rows of adjacent faces.
    rotateLeft: Rotates the left face clockwise and adjusts the columns of adjacent faces.
    rotateRight: Rotates the right face clockwise and adjusts the columns of adjacent faces.

Each rotation logic was designed to:

    Rotate the specific face by rearranging its 4 elements.
    Update the adjacent faces to reflect the new positions after the rotation.

4. User Interface

The CubeScreen widget builds the visual interface:

    Each face of the cube is displayed using a GridView.builder to render the 4 tiles of each face.
    Faces are labeled (e.g., "Top," "Left," "Front") for clarity.
    The cube faces are laid out to resemble a real cube:
        Top face above
        Front, Left, and Right faces in the middle row
        Bottom face below

5. Action Buttons

    Buttons were added below the cube for user interaction:
        Rotate Top
        Rotate Bottom
        Rotate Left
        Rotate Right
    The buttons are arranged vertically for better readability.
    Each button triggers its corresponding rotation logic and refreshes the cube display using setState.

6. Spacing and Alignment

    Proper spacing (SizedBox) was added between the buttons for neat alignment.
    The cube faces and buttons are center-aligned for a visually appealing layout.

7. Final Adjustments

    Minor fixes were applied to ensure smooth functionality and proper linking of UI elements to logic.
    Code readability was enhanced with comments and modular design.
