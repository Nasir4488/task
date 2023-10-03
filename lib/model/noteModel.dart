class NoteModel {
  final String title;
  final String description;
  final DateTime time; // Add a DateTime field for storing the time

  NoteModel({
    required this.title,
    required this.description,
    required this.time,
  });


  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json["title"],
      description: json["description"],
      time: DateTime.parse(json["time"]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "description": this.description,
      "time": this.time.toIso8601String(),
    };
  }
}