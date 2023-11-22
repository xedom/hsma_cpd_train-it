import 'package:flutter/material.dart';
import 'package:hsma_cpd_trainit/widgets/training_tab_widget.dart';

void main() {
  runApp(const TrainItApp());
}

class TrainItApp extends StatelessWidget {
  const TrainItApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Train-it App';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primaryColor: Colors.green[700]),
      home: DaysBar(),
    );
  }
}

class DaysBar extends StatefulWidget {
  const DaysBar({super.key});

  @override
  State<DaysBar> createState() => _DaysBarState();
}

class _DaysBarState extends State<DaysBar> {
  final List<Tab> currentDays = <Tab>[
    const Tab(text: '20 Mon'),
    const Tab(text: '21 Tue'),
    const Tab(text: '22 Wed'),
    const Tab(text: '23 Thu'),
    const Tab(text: '24 Fri'),
    const Tab(text: '25 Sat'),
    const Tab(text: '26 Sun'),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: currentDays.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          foregroundColor: Colors.white,
          title: const Text('Train-it App'),
          bottom: TabBar(
            unselectedLabelColor: Colors.white70,
            labelColor: Colors.yellow[800],
            overlayColor: MaterialStatePropertyAll<Color>(Colors.grey[800]!),
            indicatorColor: Colors.yellow[800],
            dividerColor: Colors.yellow[800],
            isScrollable: true,
            labelStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
            tabs: currentDays,
          ),
        ),
        body: TabBarView(
          children: currentDays.map((Tab tab) => TrainingDay(day: tab.text!)).toList(),
        ),
      ),
    );
  }
}