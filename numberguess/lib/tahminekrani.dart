import 'dart:math';
import 'package:flutter/material.dart';
import 'package:numberguess/sonucekrani.dart';
import 'package:rive/rive.dart';

class Tahmin {
  final String tahmin1, tahmin2;
  final int rastgele;
  const Tahmin({
    required this.tahmin1,
    required this.tahmin2,
    required this.rastgele,
  });
}

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  var oyuncu1tahminCon = TextEditingController();
  var oyuncu2tahminCon = TextEditingController();
  int rastgeleSayi = Random().nextInt(100);
  bool kontrol = false;
  String yazi = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  get key => null;
  @override
  void dispose() {
    oyuncu1tahminCon.dispose();
    oyuncu2tahminCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int rastgele = rastgeleSayi;
    print("rastgele: $rastgeleSayi");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tahmin Ekranı"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            color: Colors.grey.shade300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "İpucu İster misin ? ",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: RiveAnimation.asset('lib/animasyonlar/ipucu.riv'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    kontrol = true;
                    yazi = 'İpucu: ' + ipucu2();
                  });
                },
                child: const Text("2'ye bölünüyor mu?"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    side: const BorderSide(color: Colors.purple),
                    elevation: 20,
                    primary: Colors.white,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    kontrol = true;
                    yazi = 'İpucu: ' + ipucu3();
                  });
                },
                child: const Text("3'e bölünüyor mu?"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    side: const BorderSide(color: Colors.purple),
                    elevation: 20,
                    primary: Colors.white,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70))),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    kontrol = true;
                    yazi = 'İpucu:  ' + ipucuSonB();
                  });
                },
                child: const Text("Son basamak ?"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    side: const BorderSide(color: Colors.purple),
                    elevation: 20,
                    primary: Colors.white,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    kontrol = true;
                    yazi = 'İpucu:  ' + ipucuRakamTop();
                  });
                },
                child: const Text("Rakamları toplamı ?"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    side: const BorderSide(color: Colors.purple),
                    elevation: 20,
                    primary: Colors.white,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70))),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: Visibility(
                visible: kontrol,
                child: Text(
                  yazi,
                )),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      autovalidate: true,
                      autofocus: false,
                      controller: oyuncu1tahminCon,
                      maxLength: 3,
                      textInputAction: TextInputAction.done,
                      onChanged: (oyuncu1tahminCon) {},
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.pin),
                          suffixIcon: IconButton(
                            onPressed: () => oyuncu1tahminCon.clear(),
                            icon: const Icon(Icons.close),
                          ),
                          labelText: "1.Oyuncu Tahmin ",
                          hintText: "1-100",
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          )),
                      validator: (tahmin1) {
                        if (tahmin1!.isNotEmpty && int.parse(tahmin1) > 100) {
                          oyuncu1tahminCon.clear();
                          return "Girilen sayı 100'den büyük olamaz.";
                        }
                        if (tahmin1.isEmpty) {
                          return "Alanları boş bırakmayınız.";
                        } else if (tahmin1.isNotEmpty &&
                            int.parse(tahmin1) <= 100) {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    TextFormField(
                      autovalidate: true,
                      key: formKey1,
                      controller: oyuncu2tahminCon,
                      maxLength: 3,
                      textInputAction: TextInputAction.done,
                      onChanged: (oyuncu2tahminCon) {},
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.pin),
                          suffixIcon: IconButton(
                            onPressed: () => oyuncu2tahminCon.clear(),
                            icon: const Icon(Icons.close),
                          ),
                          labelText: "2.Oyuncu Tahmin",
                          hintText: "1-100",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                      validator: (tahmin1) {
                        MaterialPageRoute(
                            builder: (context) => SonucEkrani(
                                  tahmin1: '$oyuncu1tahminCon',
                                  tahmin2: '$oyuncu2tahminCon',
                                  rastgele: '$rastgeleSayi',
                                  value: key,
                                ));
                        if (tahmin1!.isNotEmpty && int.parse(tahmin1) > 100) {
                          oyuncu2tahminCon.clear();
                          return "Girilen sayı 100'den büyük olamaz.";
                        }
                        if (tahmin1.isEmpty) {
                          return "Alanları boş bırakmayınız.";
                        } else if (tahmin1.isNotEmpty &&
                            int.parse(tahmin1) <= 100) {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 70.0),
                    TextButton(
                      onPressed: () {
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) => new SonucEkrani(
                              value: Tahmin(
                                  tahmin1: oyuncu1tahminCon.text,
                                  tahmin2: oyuncu2tahminCon.text,
                                  rastgele: rastgeleSayi)),
                        );

                        Navigator.of(context).push(route);
                      },
                      child: const Text("Oyna"),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          side: const BorderSide(color: Colors.purple),
                          elevation: 20,
                          primary: Colors.white,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ipucu2() {
    if (rastgeleSayi % 2 == 0) {
      return "Sayı 2'ye tam bölünüyor.";
    } else {
      return "Sayı 2'ye tam bölünmüyor.";
    }
  }

  ipucu3() {
    if (rastgeleSayi % 3 == 0) {
      return "Sayı 3'e tam bölünüyor.";
    } else {
      return "Sayı 3'e tam bölünmüyor.";
    }
  }

  int kalan = 0;
  ipucuSonB() {
    kalan = rastgeleSayi % 10;
    return "Sayının son basamağı $kalan";
  }

  int birler = 0;
  int toplam = 0;
  int onlar = 0;
  ipucuRakamTop() {
    if (rastgeleSayi < 10) {
      birler = rastgeleSayi % 10;
      toplam = birler;
      return "Sayının rakamları toplamı: $toplam";
    } else {
      birler = rastgeleSayi % 10;
      onlar = (rastgeleSayi / 10).toInt();
      toplam = birler + onlar;
      return "Sayının rakamları toplamı: $toplam";
    }
  }
}
