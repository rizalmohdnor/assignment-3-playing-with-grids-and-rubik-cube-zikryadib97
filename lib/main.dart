import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2x2 Rubik\'s Cube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CubeScreen(),
    );
  }
}

class CubeState {
  List<List<Color>> faces = [
    [Colors.red, Colors.red, Colors.red, Colors.red], // Front
    [Colors.blue, Colors.blue, Colors.blue, Colors.blue], // Left
    [Colors.green, Colors.green, Colors.green, Colors.green], // Right
    [Colors.yellow, Colors.yellow, Colors.yellow, Colors.yellow], // Back
    [Colors.orange, Colors.orange, Colors.orange, Colors.orange], // Top
    [Colors.white, Colors.white, Colors.white, Colors.white], // Bottom
  ];

  void rotateTop() {
    List<Color> topRowFront = [faces[0][0], faces[0][1]];
    List<Color> topRowLeft = [faces[1][0], faces[1][1]];
    List<Color> topRowRight = [faces[2][0], faces[2][1]];
    List<Color> topRowBack = [faces[3][0], faces[3][1]];

    // Rotate top face
    List<Color> tempTop = [...faces[4]];
    faces[4] = [tempTop[2], tempTop[3], tempTop[0], tempTop[1]];

    // Update adjacent faces
    faces[0] = [topRowBack[0], topRowBack[1], faces[0][2], faces[0][3]];
    faces[1] = [topRowFront[0], topRowFront[1], faces[1][2], faces[1][3]];
    faces[2] = [topRowLeft[0], topRowLeft[1], faces[2][2], faces[2][3]];
    faces[3] = [topRowRight[0], topRowRight[1], faces[3][2], faces[3][3]];
  }

  void rotateBottom() {
    List<Color> bottomRowFront = [faces[0][2], faces[0][3]];
    List<Color> bottomRowLeft = [faces[1][2], faces[1][3]];
    List<Color> bottomRowRight = [faces[2][2], faces[2][3]];
    List<Color> bottomRowBack = [faces[3][2], faces[3][3]];

    // Rotate bottom face
    List<Color> tempBottom = [...faces[5]];
    faces[5] = [tempBottom[2], tempBottom[3], tempBottom[0], tempBottom[1]];

    // Update adjacent faces
    faces[0] = [faces[0][0], faces[0][1], bottomRowLeft[0], bottomRowLeft[1]];
    faces[1] = [faces[1][0], faces[1][1], bottomRowBack[0], bottomRowBack[1]];
    faces[2] = [faces[2][0], faces[2][1], bottomRowFront[0], bottomRowFront[1]];
    faces[3] = [faces[3][0], faces[3][1], bottomRowRight[0], bottomRowRight[1]];
  }

  void rotateLeft() {
    // Rotate left face
    List<Color> tempLeft = [...faces[1]];
    faces[1] = [tempLeft[2], tempLeft[0], tempLeft[3], tempLeft[1]];

    // Update adjacent rows
    List<Color> leftColFront = [faces[0][0], faces[0][2]];
    List<Color> leftColTop = [faces[4][0], faces[4][2]];
    List<Color> leftColBack = [faces[3][1], faces[3][3]];
    List<Color> leftColBottom = [faces[5][0], faces[5][2]];

    faces[0][0] = leftColBottom[0];
    faces[0][2] = leftColBottom[1];
    faces[4][0] = leftColFront[0];
    faces[4][2] = leftColFront[1];
    faces[3][1] = leftColTop[0];
    faces[3][3] = leftColTop[1];
    faces[5][0] = leftColBack[0];
    faces[5][2] = leftColBack[1];
  }

  void rotateRight() {
    // Rotate right face
    List<Color> tempRight = [...faces[2]];
    faces[2] = [tempRight[2], tempRight[0], tempRight[3], tempRight[1]];

    // Update adjacent rows
    List<Color> rightColFront = [faces[0][1], faces[0][3]];
    List<Color> rightColTop = [faces[4][1], faces[4][3]];
    List<Color> rightColBack = [faces[3][0], faces[3][2]];
    List<Color> rightColBottom = [faces[5][1], faces[5][3]];

    faces[0][1] = rightColTop[0];
    faces[0][3] = rightColTop[1];
    faces[4][1] = rightColBack[0];
    faces[4][3] = rightColBack[1];
    faces[3][0] = rightColBottom[0];
    faces[3][2] = rightColBottom[1];
    faces[5][1] = rightColFront[0];
    faces[5][3] = rightColFront[1];
  }
}

class CubeScreen extends StatefulWidget {
  const CubeScreen({Key? key}) : super(key: key);

  @override
  _CubeScreenState createState() => _CubeScreenState();
}

class _CubeScreenState extends State<CubeScreen> {
  CubeState cube = CubeState();

  void rotateTop() {
    setState(() {
      cube.rotateTop();
    });
  }

  void rotateBottom() {
    setState(() {
      cube.rotateBottom();
    });
  }

  void rotateLeft() {
    setState(() {
      cube.rotateLeft();
    });
  }

  void rotateRight() {
    setState(() {
      cube.rotateRight();
    });
  }

  Widget buildFace(List<Color> faceColors) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => Container(color: faceColors[index]),
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('2x2 Rubik\'s Cube'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text('Top'),
              SizedBox(
                height: 100,
                width: 100,
                child: buildFace(cube.faces[4]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text('Left'),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: buildFace(cube.faces[1]),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('Front'),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: buildFace(cube.faces[0]),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('Right'),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: buildFace(cube.faces[2]),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text('Bottom'),
              SizedBox(
                height: 100,
                width: 100,
                child: buildFace(cube.faces[5]),
              ),
            ],
          ),
          const SizedBox(height: 20), // Add spacing before buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: rotateTop, child: const Text('Rotate Top')),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: rotateBottom, child: const Text('Rotate Bottom')),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: rotateLeft, child: const Text('Rotate Left')),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: rotateRight, child: const Text('Rotate Right')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
