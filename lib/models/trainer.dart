class Trainer {
  final String id;
  final String name;
  final String courses;

  Trainer({required this.id, required this.name, required this.courses});

  Trainer copyWith({String? id, String? name, String? courses}) {
    return Trainer(id: id ?? this.id, name: name ?? this.name, courses: courses ?? this.courses);
  }
}
