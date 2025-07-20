import 'package:flutter/material.dart';

class DiseaseCard extends StatelessWidget {
  final String diseaseName;
  const DiseaseCard({required this.diseaseName, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(diseaseName),
      ),
    );
  }
} 