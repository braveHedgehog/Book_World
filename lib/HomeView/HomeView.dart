import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:book_world/Screens/Sepet.dart';
import 'package:book_world/Screens/Urunler.dart';
import 'package:book_world/Pages/Hakkimizda.dart';
import 'package:book_world/Screens/Uye_Ol.dart';
import 'package:book_world/services/firebase_method.dart';
import 'package:book_world/Pages/İletisim.dart';
import 'package:book_world/Profile/Profil.dart';
import 'package:book_world/common/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:book_world/view/book_view.dart';

import '../Screens/UrunDetay.dart';
import '../models/book.dart';
import '../services/book_services.dart';

class Home extends StatefulWidget {
  String? kullanici;
  String? sifre;

  Home({this.kullanici, this.sifre});

  @override
  State<Home> createState() => _HomeState();
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

late Future<book> futureData;

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.kullanici == null) {
      return MultiProvider(
        providers: [
          Provider<FlutterFireAuthService>(
            create: (_) => FlutterFireAuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
            context.read<FlutterFireAuthService>().authStateChanges,
            initialData: null,
          ),
        ],
        child: MaterialApp(
          title: 'Kitap Dünyası',
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(100), child: app_bar()),
            body: ListView(
              children: <Widget>[
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
                      FutureBuilder<book>(
                        future: futureData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Card(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Image(
                                                        width: 50,
                                                        image: NetworkImage(
                                                            '${snapshot.data!.result![index].image}'),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                                top: 20.0),
                                                            child: Text(
                                                              '${snapshot.data!.result![index].title!.length > 20 ? '${snapshot.data!.result![index].title!.substring(0, 19)}...' : snapshot.data!.result![index].title}',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.bold),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                                top: 10.0),
                                                            child: Text(
                                                              '${snapshot.data!.result![index].yazar}',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontStyle: FontStyle.italic),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '${snapshot.data!.result![index].fiyat}',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(8.0),
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
                                                                builder: (context) => UrunDetay(
                                                                  title: snapshot.data!
                                                                      .result![index].title,
                                                                  image: snapshot.data!
                                                                      .result![index].image,
                                                                  fiyat: snapshot.data!
                                                                      .result![index].fiyat,
                                                                  yayN: snapshot.data!
                                                                      .result![index].yayN,
                                                                  yazar: snapshot.data!
                                                                      .result![index].yazar,
                                                                  kullanici: widget.kullanici,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            'İncele',
                                                            style: TextStyle(fontSize: 10),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            print("${snapshot.error}");
                            return Text("${snapshot.error}");
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: Card(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              builder: (context) => Hakkimizda()),
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
                                              builder: (context) => Iletisim()),
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
          ),
        ),
      );
    } else {
      return MultiProvider(
        providers: [
          Provider<FlutterFireAuthService>(
            create: (_) => FlutterFireAuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
            context.read<FlutterFireAuthService>().authStateChanges,
            initialData: null,
          ),
        ],
        child: MaterialApp(
          title: 'Kitap Dünyası',
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
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
            body: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Urun(kullanici: widget.kullanici,)),
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
                      FutureBuilder<book>(
                        future: futureData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Card(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Image(
                                                        width: 50,
                                                        image: NetworkImage(
                                                            '${snapshot.data!.result![index].image}'),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                                top: 20.0),
                                                            child: Text(
                                                              '${snapshot.data!.result![index].title!.length > 20 ? '${snapshot.data!.result![index].title!.substring(0, 19)}...' : snapshot.data!.result![index].title}',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.bold),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                                top: 10.0),
                                                            child: Text(
                                                              '${snapshot.data!.result![index].yazar}',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontStyle: FontStyle.italic),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '${snapshot.data!.result![index].fiyat}',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(8.0),
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
                                                                builder: (context) => UrunDetay(
                                                                  title: snapshot.data!
                                                                      .result![index].title,
                                                                  image: snapshot.data!
                                                                      .result![index].image,
                                                                  fiyat: snapshot.data!
                                                                      .result![index].fiyat,
                                                                  yayN: snapshot.data!
                                                                      .result![index].yayN,
                                                                  yazar: snapshot.data!
                                                                      .result![index].yazar,
                                                                  kullanici: widget.kullanici,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            'İncele',
                                                            style: TextStyle(fontSize: 10),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            print("${snapshot.error}");
                            return Text("${snapshot.error}");
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: Card(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              builder: (context) => Hakkimizda()),
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
                                              builder: (context) => Iletisim()),
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
          ),
        ),
      );
    }
  }
}
