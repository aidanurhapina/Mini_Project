class Resep {
  final String name;
  final String images;
  final String country;
  final String totalTime;
  final String description;
  final String videoUrl;

  Resep({
    required this.name,
    required this.images,
    required this.country,
    required this.totalTime,
    required this.description,
    required this.videoUrl,
  });

  factory Resep.fromJson(dynamic json) {
    return Resep(
      name: json['name'] as String, 
      images: json['thumbnail_url'] as String, 
      country: json['country'] as String, 
      totalTime: json['total_time_minutes'] != null
       ? json['total_time_minutes'].toString() + " min"
       : "30 min",
      description: json['description'] ?? "",
      videoUrl: json['video_url'] ?? "noVideo",
    );
  }

  static List<Resep> resepFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Resep.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Resep {name: $name, images: $images, country: $country, totalTime: $totalTime}';
  }
}
