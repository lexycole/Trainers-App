class Course {
  final String id;
  final String name;
  final String hours;

  Course({required this.id, required this.name, required this.hours});

  Course copyWith({String? id, String? name, String? hours}) {
    return Course(
        id: id ?? this.id, name: name ?? this.name, hours: hours ?? this.hours);
  }
}
