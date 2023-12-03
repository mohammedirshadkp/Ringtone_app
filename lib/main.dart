import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(ringtonepage());

class ringtonepage extends StatefulWidget {
  const ringtonepage({Key? key}) : super(key: key);

  @override
  State<ringtonepage> createState() => _ringtonepageState();
}

class _ringtonepageState extends State<ringtonepage> {
  final player = AudioPlayer();
  Expanded pageElements(String soundname, Color color, String showname) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        color: color,
        child: Row(
          children: [
            Container(
              height: 55,
              width: 250,
              child: Center(
                child: Text(
                  showname,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'ShadowIntoLight'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: FloatingActionButton(
                onPressed: () {
                  player.setSourceAsset('assets/');
                  player.play(AssetSource(soundname));
                },
                child: Icon(Icons.play_arrow),
                backgroundColor: Colors.purple[400],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: FloatingActionButton(
                child: Icon(Icons.pause),
                backgroundColor: Colors.purple[400],
                onPressed: () {
                  player.stop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                pageElements(
                    'interstellar.mp3', Colors.white70, 'Interstellar'),
                pageElements('Game_of_Thrones_-_Theme.mp3', Colors.teal,
                    'Game of thrones'),
                pageElements('Main_Title.mp3', Colors.cyan, 'Daredevil'),
                pageElements('Dark__-__Ringtone___Download.mp3',
                    Colors.greenAccent, 'Dark'),
                pageElements('Theme_from_the_Walking_Dead.mp3', Colors.white60,
                    'The walking dead'),
                pageElements('San_Andreas_Theme_Song.mp3',
                    Colors.indigo.shade200, 'Gta'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
