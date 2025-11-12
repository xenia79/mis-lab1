import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    String timeLeft;
    if (difference.isNegative) {
      timeLeft = "Испитот е завршен";
    } else {
      final days = difference.inDays;
      final hours = difference.inHours % 24;
      final minutes = difference.inMinutes % 60;
      timeLeft = "$days дена, $hours часа, $minutes минути";
    }

    return Scaffold(
      appBar: AppBar(title: Text(exam.subjectName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Датум и време: ${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year} "
                  "${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2,'0')}",
            ),
            const SizedBox(height: 10),
            Text("Простории: ${exam.rooms.join(', ')}"),
            const SizedBox(height: 20),
            Text("Преостанато време: $timeLeft"),
          ],
        ),
      ),
    );
  }
}
