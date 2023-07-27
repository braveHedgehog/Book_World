import 'package:flutter/material.dart';
import 'package:book_world/HomeView/HomeView.dart';
import 'package:book_world/view/book_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:book_world/Screens/Urunler.dart';
import 'package:book_world/Pages/Hakkimizda.dart';
import 'package:book_world/Pages/İletisim.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profil extends StatefulWidget {
  String? kullanici;

  Profil({this.kullanici});

  @override
  State<Profil> createState() => _ProfilState();
}

_launchURLFace() async {
  const url = 'https://tr-tr.facebook.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLInsta() async {
  const url = 'https://www.instagram.com//';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLTwitter() async {
  const url = 'https://twitter.com/?lang=tr';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLYoutube() async {
  const url = 'https://www.youtube.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    String baslik = 'Kitap Dünyası';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[500],
          title: Text(
            baslik,
            style: TextStyle(fontSize: 15),
          ),
          actions: [
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
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      widget.kullanici.toString().toUpperCase(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Urun()),
                              );
                            },
                            child: Text(
                              'İndirimli Ürünler',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        BookView(
                          kullanici: widget.kullanici,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: Card(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.only(bottom: 35),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Hakkimizda()),
                                          );
                                        },
                                        child: Text(
                                          'Hakkımızda',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.only(bottom: 35),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Iletisim()),
                                          );
                                        },
                                        child: Text(
                                          'İletişim Bilgileri',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: _launchURLFace,
                                        icon: const FaIcon(
                                          FontAwesomeIcons.facebook,
                                          size: 12,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: _launchURLInsta,
                                        icon: const FaIcon(
                                          FontAwesomeIcons.instagram,
                                          size: 12,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: _launchURLTwitter,
                                        icon: const FaIcon(
                                          FontAwesomeIcons.twitter,
                                          size: 12,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: _launchURLYoutube,
                                        icon: const FaIcon(
                                          FontAwesomeIcons.youtube,
                                          size: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
