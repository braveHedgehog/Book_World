import 'package:flutter/material.dart';
import 'package:book_world/Profile/Profil.dart';
import 'package:book_world/main.dart';
import 'package:book_world/Screens/girisYap.dart';

import 'package:book_world/HomeView/HomeView.dart';

class Odeme extends StatefulWidget {
  String? kullanici;

  Odeme({this.kullanici});

  @override
  State<Odeme> createState() => _OdemeState();
}

class _OdemeState extends State<Odeme> {
  String baslik = 'Kitap Dünyası';
  TextEditingController kartIsim = new TextEditingController();
  TextEditingController kartNumara = new TextEditingController();
  TextEditingController kartTarih = new TextEditingController();
  TextEditingController cvc = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[500],
          title: Text(
            baslik,
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            kullanici: widget.kullanici,
                          )),
                );
              },
              icon: Icon(
                Icons.home,
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Padding(padding: const EdgeInsets.only(top: 150)),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: kartIsim,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Kartın üzerindeki ad',
                        labelStyle: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      controller: kartNumara,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Kart Numarası',
                        labelStyle: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      controller: kartTarih,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Son Kullanma Tarihi',
                        labelStyle: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: cvc,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Cvc ',
                        labelStyle: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        onPrimary: Colors.white,
                        padding: EdgeInsets.all(12),
                      ),
                      onPressed: () {
                        if (kartTarih.text == '' &&
                            kartNumara.text == '' &&
                            kartIsim.text == '' &&
                            cvc.text == '') {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const Text(
                                'Tüm alanlar doldurulmalıdır!!!!!',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.indigo[500],
                              elevation: 24.0,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Tamam'),
                                  child: const Text(
                                    'Tamam',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else if (kartNumara.text.length != 16 ||
                            cvc.text.length != 3) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const Text(
                                'Tüm alanlar uygun formatta doldurulmalıdır!!!!!',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.indigo[500],
                              elevation: 24.0,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Tamam'),
                                  child: const Text(
                                    'Tamam',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const Text(
                                'Ödeme Başarı ile Tamamlandı!!!!!',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.indigo[500],
                              elevation: 24.0,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home(
                                            kullanici: widget.kullanici,
                                          )),
                                    );
                                  },
                                  child: const Text(
                                    'Tamam',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Ödemeyi Tamamla',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
