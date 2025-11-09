import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  const ExamDetailScreen({super.key, required this.exam});
  final Exam exam;

  String _formatDate(DateTime dt) {
    final d = dt.day.toString().padLeft(2, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final y = dt.year;
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$d.$m.$y  $hh:$mm';
  }

  String _timeLeftText(DateTime dt) {
    final now = DateTime.now();
    Duration diff = dt.difference(now);
    final passed = diff.isNegative;
    if (passed) diff = now.difference(dt);

    final days = diff.inDays;
    final hours = diff.inHours % 24;
    final text = '$days Поминато пред, $hours сати';
    return passed ? 'Поминато • $text пред' : text;
  }

  @override
  Widget build(BuildContext context) {
    final passed = exam.dateTime.isBefore(DateTime.now());
    final accent = passed ? Colors.red : Colors.green;
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              CircleAvatar(backgroundColor: accent, child: const Icon(Icons.school, color: Colors.white)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  exam.subjectName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              )
            ]),
            const SizedBox(height: 16),
            Row(children: [
              const Icon(Icons.calendar_today),
              const SizedBox(width: 8),
              Text('Време: ${_formatDate(exam.dateTime)}'),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 8),
              Text('Простории: ${exam.rooms.join(', ')}'),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              const Icon(Icons.timer),
              const SizedBox(width: 8),
              Text('Време преостанато: ${_timeLeftText(exam.dateTime)}'),
            ]),
          ],
        ),
      ),
    );
  }
}