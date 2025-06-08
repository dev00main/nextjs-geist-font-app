import '../models/quiz.dart';

final List<Quiz> sampleQuizzes = [
  Quiz(
    id: 'python101',
    title: 'Python Basics Quiz',
    questions: [
      QuizQuestion(
        id: 'pyq1',
        question: 'What is Python?',
        options: [
          'A snake species',
          'A programming language',
          'A text editor',
          'A database system',
        ],
        correctOptionIndex: 1,
      ),
      QuizQuestion(
        id: 'pyq2',
        question: 'Which of these is a valid Python variable name?',
        options: [
          '2variable',
          'my-var',
          'my_variable',
          '@variable',
        ],
        correctOptionIndex: 2,
      ),
      QuizQuestion(
        id: 'pyq3',
        question: 'What is the correct way to create a comment in Python?',
        options: [
          '// Comment',
          '/* Comment */',
          '# Comment',
          '<!-- Comment -->',
        ],
        correctOptionIndex: 2,
      ),
    ],
  ),
  Quiz(
    id: 'js101',
    title: 'JavaScript Essentials Quiz',
    questions: [
      QuizQuestion(
        id: 'jsq1',
        question: 'What is JavaScript primarily used for?',
        options: [
          'Database management',
          'Web development',
          'Mobile app development',
          'Operating system development',
        ],
        correctOptionIndex: 1,
      ),
      QuizQuestion(
        id: 'jsq2',
        question: 'How do you declare a variable in JavaScript?',
        options: [
          'dim x',
          'var x',
          'variable x',
          'declare x',
        ],
        correctOptionIndex: 1,
      ),
      QuizQuestion(
        id: 'jsq3',
        question: 'What is the DOM?',
        options: [
          'Document Object Model',
          'Data Object Management',
          'Document Oriented Memory',
          'Digital Object Method',
        ],
        correctOptionIndex: 0,
      ),
    ],
  ),
];
