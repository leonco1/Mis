import 'package:flutter/material.dart';

import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.exam, required this.onTap});
  final Exam exam;
  final VoidCallback onTap;

  String _formatDate(DateTime dt) {
    final d = dt.day.toString().padLeft(2, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final y = dt.year;
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$d.$m.$y  $hh:$mm';
  }

  bool get _isPassed => exam.dateTime.isBefore(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final color = _isPassed ? Colors.grey.shade300 : Colors.green.shade50;
    final accent = _isPassed ? Colors.grey : Colors.green;
    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: accent,
                child: const Icon(Icons.school, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exam.subjectName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 6),
                        Text(_formatDate(exam.dateTime)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 6),
                        Expanded(child: Text(exam.rooms.isNotEmpty ? exam.rooms.first : 'TBD')),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                _isPassed ? Icons.check_circle : Icons.access_time,
                color: accent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}