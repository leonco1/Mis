import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'exam_detail_screen.dart';
import '../widgets/exam_card.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.indexNumber});
  final String indexNumber;

  List<Exam> _buildExams() {
    final now = DateTime.now();
    final exams = <Exam>[
      Exam(
        subjectName: 'Калкулус',
        dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: -10, hours: 9)),
        rooms: ['Електро- Соба 101'],
      ),
      Exam(
        subjectName: 'Структурно Програмирање',
        dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 2, hours: 10)),
        rooms: ['Лаб 3'],
      ),
      Exam(
        subjectName: 'Алгоритми и податочни структури',
        dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 5, hours: 12)),
        rooms: ['Лаб 13'],
      ),
      Exam(
        subjectName: 'Бази на податоци',
        dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 8, hours: 9)),
        rooms: ['ТМФ  ЛАб 1'],
      ),
      Exam(
        subjectName: 'Оперативни системи',
        dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 12, hours: 11)),
        rooms: ['Лаб 12'],
      ),
      Exam(
        subjectName: 'Компјутерски мрежи и безбедност',
        dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 15, hours: 13)),
        rooms: ['МФ Лаб 1'],
      ),
      Exam(
        subjectName: 'Дискретна математика',
        dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 25, hours: 9)),
        rooms: ['ТМФ Лаб 2'],
      ),
      Exam(
        subjectName: 'Архитектура и организација на компјутери',
        dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: -1, hours: 8)),
        rooms: ['Зграда Г - Лаб 2'],
      ),
       Exam(
        subjectName: 'Напредно Програмирање',
        dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: -1, hours: 8)),
        rooms: ['Зграда Г - Лаб 2'],
      ),
       Exam(
        subjectName: 'Веројатност и статистика',
        dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: -1, hours: 8)),
        rooms: ['Зграда Г - Лаб 2'],
      ),
    ];

    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return exams;
  }

  @override
  Widget build(BuildContext context) {
    final exams = _buildExams();
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam schedule - $indexNumber'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return ExamCard(
            exam: exam,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ExamDetailScreen(exam: exam),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.menu_book),
                        const SizedBox(width: 8),
                        Text(
                          'Вкупен број на испити: ${exams.length}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}