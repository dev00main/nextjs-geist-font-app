import 'package:flutter/material.dart';
import '../models/quiz.dart';

class QuizQuestionWidget extends StatelessWidget {
  final QuizQuestion question;
  final Function(int) onAnswerSelected;
  final int? selectedAnswer;
  final bool showResult;

  const QuizQuestionWidget({
    Key? key,
    required this.question,
    required this.onAnswerSelected,
    this.selectedAnswer,
    this.showResult = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ...List.generate(
              question.options.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  onTap: () => onAnswerSelected(index),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _getOptionColor(index),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedAnswer == index ? Colors.white : Colors.grey,
                      ),
                    ),
                    child: Text(
                      question.options[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: selectedAnswer == index ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getOptionColor(int index) {
    if (!showResult || selectedAnswer != index) return Colors.grey[800]!;
    return index == question.correctOptionIndex ? Colors.green[900]! : Colors.red[900]!;
  }
}
