import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.summary,
  });

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: (data['question_answer'] == data['user_answer'])
                        ? const Color(0xFF4cc9f0)
                        : const Color(0xFFf72585),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'].toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Correct answer: ${data['question_answer'].toString()}',
                        style: const TextStyle(
                            color: Color(0xFFc0fdff),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your answer: ${data['user_answer'].toString()}',
                        style: const TextStyle(
                            color: Color(0xFFdeaaff),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
