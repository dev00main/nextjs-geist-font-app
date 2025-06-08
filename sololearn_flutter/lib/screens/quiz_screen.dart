import 'package:flutter/material.dart';
import '../models/quiz.dart';
import '../widgets/quiz_question.dart';
import '../data.dart';
class QuizScreen extends StatefulWidget {
  final String courseId;

  const QuizScreen({Key? key, required this.courseId}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Quiz quiz;
  int currentQuestionIndex = 0;
  Map<int, int> userAnswers = {};
  bool quizCompleted = false;

  @override
  void initState() {
    super.initState();
    quiz = sampleQuizzes.firstWhere((q) => q.id == widget.courseId);
  }

  void _handleAnswerSelected(int answerIndex) {
    if (quizCompleted) return;

    setState(() {
      userAnswers[currentQuestionIndex] = answerIndex;
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < quiz.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        quizCompleted = true;
      });
    }
  }

  int _calculateScore() {
    int correctAnswers = 0;
    userAnswers.forEach((questionIndex, selectedAnswer) {
      if (quiz.questions[questionIndex].correctOptionIndex == selectedAnswer) {
        correctAnswers++;
      }
    });
    return correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (currentQuestionIndex + 1) / quiz.questions.length,
            backgroundColor: Colors.grey[800],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          Expanded(
            child: quizCompleted
                ? _buildQuizComplete()
                : _buildQuizQuestion(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizQuestion() {
    final question = quiz.questions[currentQuestionIndex];
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: QuizQuestionWidget(
              question: question,
              onAnswerSelected: _handleAnswerSelected,
              selectedAnswer: userAnswers[currentQuestionIndex],
              showResult: false,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: userAnswers[currentQuestionIndex] != null
                ? _nextQuestion
                : null,
            child: Text(
              currentQuestionIndex < quiz.questions.length - 1
                  ? 'Next Question'
                  : 'Complete Quiz',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuizComplete() {
    final score = _calculateScore();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Completed!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Your Score: $score/${quiz.questions.length}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Back to Course'),
          ),
        ],
      ),
    );
  }
}
