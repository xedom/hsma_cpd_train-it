import 'dart:async';

import 'package:flutter/material.dart';

String durationToMinutesAndSeconds(Duration d) {
    return "${d.inMinutes.toString().padLeft(2, '0')}:${d.inSeconds.remainder(60).toString().padLeft(2, '0')}";
}

class TrainingCard extends StatefulWidget {
  const TrainingCard({super.key});

  @override
  State<TrainingCard> createState() => _TrainingCardState();
}

class _TrainingCardState extends State<TrainingCard> {
  var restTimeCountdown = const Duration(seconds: 120);
  var restTimer = const Duration(seconds: 120);
  Stopwatch watch = Stopwatch();
  Timer? timerRestTime;

  var totalTimeDuration = const Duration(seconds: 0);
  


  updateRestTime(Timer t) {
    debugPrint('updateRestTime');
    if (watch.isRunning) {
      debugPrint('isRunning');
      setState(() {
        Duration newDuration = restTimeCountdown - Duration(milliseconds: watch.elapsedMilliseconds);
        restTimer = newDuration;
      });
    }
  }

  startRestTimer() {
    watch.start();
    timerRestTime = Timer.periodic(const Duration(milliseconds: 100), updateRestTime);
  }

  stopRestTimer() {
    watch.stop();
    timerRestTime?.cancel();
  }

  resetRestTimer() {
    watch.reset();
    setState(() { restTimer = restTimeCountdown; });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(16)),

      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(width: 16),
                const Text('Training Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              children: <Widget>[
                const Text('Rest time:'),
                const SizedBox(width: 16),
                Expanded(child: IconButton.filled(
                  onPressed: () {
                    resetRestTimer();
                  },
                  icon: const Icon(Icons.replay),
                )),
                Expanded(child: IconButton.filled(
                  onPressed: () {
                    startRestTimer();
                  },
                  icon: const Icon(Icons.play_arrow),
                )),
                FilledButton(
                  onPressed: () {
                    startRestTimer();
                  },
                  child: Text(durationToMinutesAndSeconds(restTimer))
                ),
                Expanded(child: IconButton.filled(
                  onPressed: () {
                    stopRestTimer();
                  },
                  icon: const Icon(Icons.pause),
                )),
                const SizedBox(width: 32),
                // const Text('Total time:'),
                // const SizedBox(width: 16),
                // OutlinedButton(
                //   onPressed: () {},
                //   child: Text(durationToMinutesAndSeconds(totalTimeDuration))
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}