import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  ObjectDetection(),
    );
  }
}
class ObjectDetection extends StatefulWidget {
  const ObjectDetection({super.key});

  @override
  State<ObjectDetection> createState() => _ObjectDetectionState();
}
late CameraController _controller;
class _ObjectDetectionState extends State<ObjectDetection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=CameraController(cameras[0], ResolutionPreset.max);
     _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {

      });
    }).catchError((Object e){
      if(e is CameraException){
        switch (e.code){
          case 'cameraAccessdenid':
          print("access was denied");
          break;
          default:
          print(e.description);
          break;
        }
      }
        
      

    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
    
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   
      body:  Stack(children: [
        Container(
          height: double.infinity,
          child: CameraPreview(_controller),
        )
      ]),
    );
  }
