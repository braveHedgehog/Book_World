import 'package:flutter/material.dart';
import 'package:book_world/HomeView/HomeView.dart';
import 'package:book_world/Screens/Sepet.dart';
import 'package:book_world/Profile/Profil.dart';
import 'package:book_world/common/app_bar.dart';
import 'package:book_world/services/book_services.dart';

import 'package:book_world/models/book.dart';

class UrunDetay extends StatefulWidget {
  String? kullanici;
  String? image;
  String? title;
  String? fiyat;
  String? yayN;
  String? yazar;

  UrunDetay(
      {this.kullanici,
      this.image,
      this.title,
      this.fiyat,
      this.yayN,
      this.yazar});

  @override
  State<UrunDetay> createState() => _UrunDetayState();
}

class _UrunDetayState extends State<UrunDetay> {
  @override
  Widget build(BuildContext context) {
    String baslik = 'Kitap Dünyası';
    if (widget.kullanici == null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(100), child: app_bar()),
          body: Center(
            child: ListView(
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image(
                        width: 200,
                        image: NetworkImage('${widget.image}'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Ürün Özellikleri',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Ürün Adı: ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 4,
                                        child: Text(
                                          '${widget.title}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Yazar: ',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 4,
                                        child: Text(
                                          '${widget.yazar}',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Yayın Evi: ',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 4,
                                        child: Text(
                                          '${widget.yayN}',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Fiyat:${widget.fiyat} ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
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
                                                  builder: (context) => Sepet(
                                                        title: widget.title,
                                                        image: widget.image,
                                                        fiyat: widget.fiyat,
                                                        yayN: widget.yayN,
                                                        yazar: widget.yazar,
                                                      )),
                                            );
                                          },
                                          child: Text(
                                            'Hemen Al',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
    } else {
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
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('Hoşgeldiniz: ' +
                      widget.kullanici.toString().toUpperCase())),
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
                  Icons.person,
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
                      padding: const EdgeInsets.only(top: 10),
                      child: Image(
                        width: 200,
                        image: NetworkImage('${widget.image}'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Ürün Özellikleri',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Ürün Adı: ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 4,
                                        child: Text(
                                          '${widget.title}',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Yazar: ',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 4,
                                        child: Text(
                                          '${widget.yazar}',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Yayın Evi: ',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 4,
                                        child: Text(
                                          '${widget.yayN}',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Fiyat:${widget.fiyat} ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
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
                                                  builder: (context) => Sepet(
                                                        title: widget.title,
                                                        image: widget.image,
                                                        fiyat: widget.fiyat,
                                                        yayN: widget.yayN,
                                                        yazar: widget.yazar,
                                                        kullanici: widget.kullanici,
                                                      ),),
                                            );
                                          },
                                          child: Text(
                                            'Hemen Al',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
}
