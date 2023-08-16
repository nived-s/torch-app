// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() {
  runApp(const FlashlightApp());
}

class FlashlightApp extends StatelessWidget {
  const FlashlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flashlight App',
      home: FlashlightScreen(),
    );
  }
}

class FlashlightScreen extends StatefulWidget {
  const FlashlightScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FlashlightScreenState createState() => _FlashlightScreenState();
}

class _FlashlightScreenState extends State<FlashlightScreen> {
  // camera controller to access flashlight
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  // initially flashlight is set to false
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    // when opening the app, it checks whether permission is granted to access camera or not
    _initializeCamera();
  }

  // future funtion to access camera
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.low,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  // future function to toogle flashlight
  Future<void> _toggleFlashlight() async {
    try {
      await _initializeControllerFuture;
      setState(() {
        // Toggle the state of the flashlight (on/off)
        _isFlashOn = !_isFlashOn;
      });
      _controller.setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
      // Set the flashlight mode based on the current state (_isFlashOn)
      // If _isFlashOn is true, set the flashlight mode to torch (on)
      // If _isFlashOn is false, set the flashlight mode to off
    } catch (e) {
      print('Error toggling flashlight: $e');
    }
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the camera controller to release resources
    super.dispose(); // Call the superclass's dispose method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashlight App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _isFlashOn
                  ? '📴 Press button to OFF camera'
                  : '🔛 Press button to ON camera',
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _toggleFlashlight,
              child: Text(_isFlashOn ? 'Turn Off   🔦' : 'Turn On  🔦'),
            ),
          ],
        ),
      ),
    );
  }
}
