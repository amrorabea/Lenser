import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:source_code/pages/ObjectDetection/bndbox.dart';
import 'package:source_code/pages/ObjectDetection/camera.dart';
import 'dart:math' as math;

class ObjectDetection extends StatefulWidget {
  final List<CameraDescription> cameras;

  const ObjectDetection(this.cameras, {super.key});

  @override
  State<ObjectDetection> createState() => _ObjectDetectionState();
}

class _ObjectDetectionState extends State<ObjectDetection> {
  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Stack(
      children: [
        Camera(
          widget.cameras,
          "SSD MobileNet",
          setRecognitions,
        ),
        BndBox(
            _recognitions == null ? [] : _recognitions!,
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height,
            screen.width,
            "SSD MobileNet"),
        Positioned(
          child: Text("New Text"),
          bottom: 170,
        )
      ],
    );
  }
}
