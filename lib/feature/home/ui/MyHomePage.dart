import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;
  Duration _countdown = Duration(hours: 1);

  final List<String> imageList = [
    'https://via.placeholder.com/800x400.png?text=Slide+1',
    'https://via.placeholder.com/800x400.png?text=Slide+2',
    'https://via.placeholder.com/800x400.png?text=Slide+3',
  ];

  final Map<String, String> prayerTimes = {
    'Imsyak': '04:30',
    'Subuh': '04:40',
    'Terbit': '05:50',
    'Syuruq': '06:10',
    'Dzuhur': '12:00',
    'Asyar': '15:30',
    'Magrib': '18:00',
    'Isya': '19:15',
  };

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown.inSeconds > 0) {
          _countdown -= Duration(seconds: 1);
        } else {
          _countdown = Duration(hours: 1); // Reset for demo
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inHours)}:"
        "${twoDigits(duration.inMinutes.remainder(60))}:"
        "${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Random Text',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 0.8),
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.green[200],
                        child: Center(
                          child: Text(
                            'Image Slide ${index + 1}',
                            style: TextStyle(fontSize: 36),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            color: Colors.green[50],
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Text('Menuju Waktu Selanjutnya'),
                      Text(_formatDuration(_countdown)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: prayerTimes.entries.map((entry) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            Text(entry.key),
                            Text('${entry.value}:00'),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}