import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ScanScreen extends StatefulWidget {
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  File? _image;
  String? _result;
  bool _loading = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() { _image = File(picked.path); _result = null; });
    }
  }

  Future<void> _predict() async {
    if (_image == null) return;
    setState(() { _loading = true; });
    // TODO: Integrate TFLite model here
    await Future.delayed(Duration(seconds: 1));
    setState(() { _result = 'Prediction: Healthy (placeholder)'; _loading = false; });
    // TODO: Save scan to log
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _image != null
                ? Image.file(_image!, height: 200)
                : Placeholder(fallbackHeight: 200),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _image == null || _loading ? null : _predict,
              child: _loading ? CircularProgressIndicator() : Text('Predict'),
            ),
            if (_result != null) ...[
              SizedBox(height: 24),
              Text(_result!),
            ],
          ],
        ),
      ),
    );
  }
} 