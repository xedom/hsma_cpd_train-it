import 'package:flutter/material.dart';
import 'package:hsma_cpd_trainit/widgets/training_card_widget.dart';

class TrainingDay extends StatelessWidget {
  const TrainingDay({Key? key, required this.day}) : super(key: key);

  final String day;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return const TrainingCard();
      },
      itemCount: 3,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16)
    );
  }
}