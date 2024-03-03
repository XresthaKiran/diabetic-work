import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

class TFLitePage extends StatefulWidget {
  const TFLitePage({Key? key}) : super(key: key);

  @override
  _TFLitePageState createState() => _TFLitePageState();
}

class _TFLitePageState extends State<TFLitePage> {
  bool _loading = true;
  late File _image;
  List? _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/efficientnetb0.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
    );
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
      _loading = true;
    });
    detectImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
      _loading = true;
    });
    detectImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Diabetic Retinopathy Classifier'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: _loading
                    ? Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: 350,
                        child: Column(
                          children: [
                            Image.asset('assets/eye.jpg'),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      )
                    : _output != null && _output!.isNotEmpty
                        ? Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                height: 250,
                                child: Image.file(_image),
                              ),
                              SizedBox(height: 20),
                              for (var prediction in _output!)
                                Column(
                                  children: [
                                    Text(
                                      'Predicted Stage: ${prediction['label']}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                        height:
                                            10), // Adjust spacing between label and confidence
                                    Text(
                                      'Confidence: ${double.parse(prediction['confidence'].toStringAsFixed(2))}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                            ],
                          )
                        : Text('No prediction available'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: pickImage, child: Text('Take Picture')),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: pickGalleryImage,
                      child: Text('Select Picture')),
                ],
              )
            ],
          ),
        ));
  }
}
