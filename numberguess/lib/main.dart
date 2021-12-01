import 'package:flutter/material.dart';
import 'package:numberguess/tahminekrani.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NumberGuess',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Tahmin Oyunu",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            const SizedBox(
              width: 200.0,
              height: 200.0,
              child: RiveAnimation.asset('lib/animasyonlar/anasayfa.riv'),
            ),
            SizedBox(
              height: 25.0,
            ),
            SizedBox(
              width: 200.0,
              height: 50.0,
              child: RaisedButton(
                  child: const Text("Oyuna Başla"),
                  color: Colors.blue.shade800,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TahminEkrani()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
