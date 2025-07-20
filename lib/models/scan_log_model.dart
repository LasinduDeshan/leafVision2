class ScanLogModel {
  final String id;
  final String userId;
  final String imageUrl;
  final String disease;
  final double confidence;
  final DateTime timestamp;

  ScanLogModel({
    required this.id,
    required this.userId,
    required this.imageUrl,
    required this.disease,
    required this.confidence,
    required this.timestamp,
  });

  factory ScanLogModel.fromMap(Map<String, dynamic> map) {
    return ScanLogModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      disease: map['disease'] ?? '',
      confidence: (map['confidence'] ?? 0).toDouble(),
      timestamp: DateTime.parse(map['timestamp'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'imageUrl': imageUrl,
      'disease': disease,
      'confidence': confidence,
      'timestamp': timestamp.toIso8601String(),
    };
  }
} 