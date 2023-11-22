import 'package:flutter/material.dart';

class TainingDay extends StatelessWidget {
  const TainingDay({Key? key, required this.day}) : super(key: key);

  final String day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Training Day $day'),
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(16)),

            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("text"),
            ),
          )
        ],
      )
    );
  }
}