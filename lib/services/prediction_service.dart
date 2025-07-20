import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';

class PredictionService {
  Interpreter? _interpreter;

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('lib/tflite/model.tflite');
  }

  Future<List?> predict(File image) async {
    if (_interpreter == null) return null;
    // TODO: Implement image preprocessing and prediction logic manually
    return [];
  }

  Future<void> dispose() async {
    _interpreter?.close();
  }
} 