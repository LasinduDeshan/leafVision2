class DiseaseModel {
  final String name;
  final String description;
  final String imageUrl;
  final Map<String, String> treatment;

  DiseaseModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.treatment,
  });

  factory DiseaseModel.fromMap(Map<String, dynamic> map) {
    return DiseaseModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      treatment: Map<String, String>.from(map['treatment'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'treatment': treatment,
    };
  }
} 