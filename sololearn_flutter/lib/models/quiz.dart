class Quiz {
  final String id;
  final String title;
  final List<QuizQuestion> questions;

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
  });
}

class QuizQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}
