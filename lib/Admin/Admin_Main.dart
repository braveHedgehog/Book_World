import 'package:flutter/material.dart';
import 'package:book_world/Admin/Admin_Grafik.dart';
import 'package:book_world/Admin/Admin_Kitap_Ekleme.dart';
import 'package:book_world/view/BookList.dart';

class AdminMain extends StatefulWidget {
  String? kullanici;
  String? sifre;

  AdminMain({this.kullanici, this.sifre});

  @override
  State<AdminMain> createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
  String baslik = 'Kitap Dünyası';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[500],
          title: Text(
            baslik,
            style: TextStyle(fontSize: 10),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('Hoşgeldiniz: ' +
                    widget.kullanici.toString().toUpperCase())),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: const Text(
                          'Tek tıklma İşlemi gerçekleşmiştir.',
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
                                    builder: (context) => AdminMain(
                                        kullanici: widget.kullanici)),
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
                  },
                  child: Icon(Icons.home)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onLongPressEnd: (e) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: const Text(
                          'Uzun basma işlemi tamamlanmıştır!!!!!!.',
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
                                    builder: (context) => Book_Edit(
                                        kullanici: widget.kullanici)),
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
                  },
                  child: Icon(Icons.plus_one_outlined)),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Ürünler',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Card(
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                width: 50,
                                'assets/0000000057163-1.jpg',
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0),
                                    child: Text(
                                      'Yüzüklerin Efendisi: Yüzük Kardeşliği',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0),
                                    child: Text(
                                      'J.R.R Tolkien',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '100 TL',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Card(
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                width: 50,
                                'assets/9757083336754.jpg',
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0),
                                    child: Text(
                                      'Yüzüklerin Efendisi: İki Kule',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0),
                                    child: Text(
                                      'J.R.R Tolkien',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '120 TL',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Card(
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                width: 50,
                                'assets/mih_200.jpeg',
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0),
                                    child: Text(
                                      'Yüzüklerin Efendisi: Kralın Dönüşü',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0),
                                    child: Text(
                                      'J.R.R Tolkien',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '150 TL',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Kitapları listele',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.all(25),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookList(
                                  kullanici: widget.kullanici,
                                )),
                      );
                    },
                    child: Text(
                      'Görüntüle',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child:GestureDetector(
                      onDoubleTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: const Text(
                              'İki defa bastınız',
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
                                        builder: (context) =>Admin_Grafik(kullanici: widget.kullanici,)),
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
                      },
                      child: Text(
                        'Kullanıcı İstatistikleri Görüntüle',
                        style: TextStyle(fontSize: 20,
                          color: Colors.black,
                          backgroundColor: Colors.white,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
