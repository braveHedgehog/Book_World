import 'package:flutter/material.dart';
import 'package:book_world/HomeView/HomeView.dart';
import 'package:book_world/Pages/OdemeEkrani.dart';
import 'package:book_world/main.dart';

class Adres extends StatefulWidget {
  String? kullanici;

  Adres({this.kullanici});

  @override
  State<Adres> createState() => _AdresState();
}

class _AdresState extends State<Adres> {
  String baslik = 'Kitap Dünyası';
  TextEditingController adres = new TextEditingController();
  TextEditingController il = new TextEditingController();
  TextEditingController ilce = new TextEditingController();
  TextEditingController posta = new TextEditingController();

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
                      controller: adres,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Adres',
                        labelStyle: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      controller: il,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'İl',
                        labelStyle: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      controller: ilce,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'İlçe',
                        labelStyle: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: posta,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Posta Kodu',
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
                        if (adres.text == '' &&
                            il.text == '' &&
                            ilce.text == '' &&
                            posta.text == '') {
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
                        } else if (posta.text.length != 5) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const Text(
                                'Posta Kodu 5 haneden oluşmalıdır',
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
                                'Ödeme Ekranına yönlendiriliyorsunuz!!!!!',
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
                                          builder: (context) => Odeme(
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
