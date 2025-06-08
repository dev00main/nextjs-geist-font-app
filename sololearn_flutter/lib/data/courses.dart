import '../models/course.dart';

final List<Course> sampleCourses = [
  Course(
    id: 'python101',
    title: 'Python Basics',
    description: 'Learn the fundamentals of Python programming',
    lessons: [
      Lesson(
        id: 'py1',
        title: 'Introduction to Python',
        content: 'Python is a high-level, interpreted programming language known for its simplicity and readability.',
      ),
      Lesson(
        id: 'py2',
        title: 'Variables and Data Types',
        content: 'Learn about different data types in Python and how to use variables.',
      ),
      Lesson(
        id: 'py3',
        title: 'Control Flow',
        content: 'Understand if statements, loops, and other control flow structures in Python.',
      ),
    ],
  ),
  Course(
    id: 'js101',
    title: 'JavaScript Essentials',
    description: 'Master the basics of JavaScript programming',
    lessons: [
      Lesson(
        id: 'js1',
        title: 'JavaScript Introduction',
        content: 'JavaScript is a versatile programming language primarily used for web development.',
      ),
      Lesson(
        id: 'js2',
        title: 'Functions and Objects',
        content: 'Learn about functions, objects, and their usage in JavaScript.',
      ),
      Lesson(
        id: 'js3',
        title: 'DOM Manipulation',
        content: 'Understand how to interact with the Document Object Model using JavaScript.',
      ),
    ],
  ),
];
