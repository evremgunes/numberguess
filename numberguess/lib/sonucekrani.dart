import 'package:flutter/material.dart';
import 'package:numberguess/main.dart';
import 'package:numberguess/tahminekrani.dart';
import 'package:rive/rive.dart';

class SonucEkrani extends StatefulWidget {
  final Tahmin value;
  SonucEkrani({
    required this.value,
    String? tahmin1,
    String? tahmin2,
    var rastgele,
  });

  @override
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  int fark1 = 0;
  int fark2 = 0;

  get rastgele => widget.value.rastgele;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sonuç Ekranı"),
      ),
      body: Center(
          child: Column(
        children: [
          hesap(),
        ],
      )),
    );
  }

  hesap() {
    int fark1 = (widget.value.rastgele - int.parse(widget.value.tahmin1));
    print("tahmin1: " + widget.value.tahmin1);
    print("tahmin2: " + widget.value.tahmin2);
    if (fark1 < 0) {
      fark1 = fark1 * -1;
    }
    print("fark1: $fark1");

    int fark2 = (widget.value.rastgele - int.parse(widget.value.tahmin2));
    if (fark2 < 0) {
      fark2 = fark2 * -1;
    }
    print("fark2: $fark2");

    if (fark1 < fark2) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 10.0),
            Text(
              "Rastgele sayı: $rastgele",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "1.Oyuncu kazandı.",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200.0,
              width: 200.0,
              child: RiveAnimation.asset('lib/animasyonlar/winner.riv'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "2.Oyuncu kaybetti.",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200.0,
              width: 200.0,
              child: RiveAnimation.asset('lib/animasyonlar/loser.riv'),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Anasayfa()));
                },
                child: Text("Tekrar dene"),
                color: Colors.purple,
                textColor: Colors.white,
              ),
            ),
          ]);
    } else if (fark2 < fark1) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 30.0),
            Text(
              "Rastgele sayı: $rastgele",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            const Text(
              "1.Oyuncu kaybetti.",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 200.0,
              width: 200.0,
              child: RiveAnimation.asset('lib/animasyonlar/loser.riv'),
            ),
            SizedBox(
              height: 15.0,
            ),
            const Text(
              "2.Oyuncu kazandı.",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 200.0,
              width: 200.0,
              child: RiveAnimation.asset('lib/animasyonlar/winner.riv'),
            ),
            SizedBox(
              height: 0.0,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Anasayfa()));
                },
                child: Text("Tekrar dene"),
                color: Colors.purple,
                textColor: Colors.white,
              ),
            ),
          ]);
    } else {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 30.0),
            Text(
              "Rastgele sayı: $rastgele",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25.0,
            ),
            const Text(
              "Berabere Kaldınız.",
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 400.0,
              width: 400.0,
              child: RiveAnimation.asset('lib/animasyonlar/berabere.riv'),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Anasayfa()));
                  // Navigator.pop(context);
                },
                child: Text("Tekrar dene"),
                color: Colors.purple,
                textColor: Colors.white,
              ),
            ),
          ]);
    }
  }
}
