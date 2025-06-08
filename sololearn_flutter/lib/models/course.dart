class Course {
  final String id;
  final String title;
  final String description;
  final List<Lesson> lessons;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.lessons,
  });
}

class Lesson {
  final String id;
  final String title;
  final String content;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
  });
}
