import 'package:flutter/material.dart';
import 'package:book_world/Pages/AdresEkrani.dart';
import 'package:book_world/HomeView/HomeView.dart';
import 'package:book_world/Screens/UrunDetay.dart';
import 'package:book_world/Screens/Uye_Ol.dart';
import 'package:book_world/main.dart';
import 'package:book_world/Screens/girisYap.dart';
import 'package:book_world/Profile/Profil.dart';
import 'package:book_world/Screens/Urunler.dart';
import 'package:book_world/services/book_services.dart';
import 'package:book_world/view/book_view.dart';

import 'package:book_world/common/app_bar.dart';
import 'package:book_world/models/book.dart';
import 'package:provider/provider.dart';

import '../services/firebase_method.dart';

class Sepet extends StatefulWidget {
  String? kullanici;
  String? image;
  String? title;
  String? fiyat;
  String? yayN;
  String? yazar;

  Sepet(
      {this.kullanici,
      this.image,
      this.title,
      this.fiyat,
      this.yayN,
      this.yazar});

  @override
  State<Sepet> createState() => _SepetState();
}

class _SepetState extends State<Sepet> {
  late Future<book> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.kullanici == null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(100), child: app_bar()),
          body: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Icon(
                        Icons.shopping_basket_rounded,
                        color: Colors.indigo[500],
                        size: 50,
                      ),
                    ),
                    Text(
                      'Lütfen Önce Giriş Yapınız',
                      style: TextStyle(fontSize: 30),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GirisYap()),
                          );
                        },
                        child: Text(
                          'Giriş',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    else {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar:  AppBar(
              backgroundColor: Colors.indigo[500],
              title: Text(
                'Kitap Dünyası',
                style: TextStyle(fontSize: 10),
              ),
              actions: [
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                        'Hoşgeldiniz: ' +
                            widget.kullanici.toString().toUpperCase(),
                        style: TextStyle(fontSize: 10))),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(
                            kullanici: widget.kullanici.toString(),
                          )),
                    );
                  },
                  icon: Icon(
                    size: 10,
                    Icons.home,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Sepet(
                            kullanici: widget.kullanici.toString(),
                          )),
                    );
                  },
                  icon: Icon(
                    size: 10,
                    Icons.shopping_basket,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profil(
                            kullanici: widget.kullanici.toString(),
                          )),
                    );
                  },
                  icon: Icon(
                    size: 10,
                    Icons.person,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Uye_Ol()),
                      );
                    }
                    context.read<FlutterFireAuthService>().signOut(context);
                  },
                  icon: Icon(
                    size: 10,
                    Icons.logout,
                  ),
                ),
              ],
            ),
            body: Container(
              child: ListView(
                children: <Widget> [ Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Sepetinizdeki Ürünler',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Card(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image(
                                width: 200, image: NetworkImage('${widget.image}'),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '${widget.title}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '${widget.fiyat}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.cancel),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blueAccent,
                                        onPrimary: Colors.white,
                                        padding: EdgeInsets.all(8),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Adres(
                                                kullanici: widget.kullanici,
                                              )),
                                        );
                                      },
                                      child: Text(
                                        'Ödemeye Git',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UrunDetay()),
                          );
                        },
                        child: Text(
                          'Beğenebileceğiniz Ürünler',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    BookView(kullanici: widget.kullanici,),
                    BookView(kullanici: widget.kullanici,),
                    BookView(kullanici: widget.kullanici,),
                  ],
                ),
           ],
              ),
            ),
          ),
        );
      }
    }
  }

