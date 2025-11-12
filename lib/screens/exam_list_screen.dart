import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subjectName: "Математика", dateTime: DateTime(2025, 11, 12, 9, 0), rooms: ["101, 111"]),
    Exam(subjectName: "Физика", dateTime: DateTime(2025, 11, 16, 10, 0), rooms: ["102, 112"]),
    Exam(subjectName: "Хемија", dateTime: DateTime(2025, 11, 17, 11, 0), rooms: ["103, 113"]),
    Exam(subjectName: "Биологија", dateTime: DateTime(2025, 11, 18, 12, 0), rooms: ["104, 114"]),
    Exam(subjectName: "Информатика", dateTime: DateTime(2025, 11, 19, 9, 0), rooms: ["105, 115"]),
    Exam(subjectName: "Историја", dateTime: DateTime(2025, 11, 20, 10, 0), rooms: ["106, 116"]),
    Exam(subjectName: "Географија", dateTime: DateTime(2025, 11, 21, 11, 0), rooms: ["107, 117"]),
    Exam(subjectName: "Филозофија", dateTime: DateTime(2025, 11, 22, 12, 0), rooms: ["108, 118"]),
    Exam(subjectName: "Литература", dateTime: DateTime(2025, 11, 23, 9, 0), rooms: ["109, 119"]),
    Exam(subjectName: "Англиски јазик", dateTime: DateTime(2025, 11, 24, 10, 0), rooms: ["110, 120"]),
  ];

  ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 221140"),
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return Card(
            color: exam.dateTime.isBefore(DateTime.now()) ? Colors.grey[300] : Colors.blue[100],
            child: ListTile(
              title: Text(exam.subjectName),
              subtitle: Text("${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year} ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2,'0')}"),
              trailing: Icon(Icons.location_on),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamDetailScreen(exam: exam),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Вкупно испити: ${exams.length}", textAlign: TextAlign.center),
      ),
    );
  }
}
