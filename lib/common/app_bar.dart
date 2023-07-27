import 'package:flutter/material.dart';
import 'package:book_world/HomeView/HomeView.dart';
import 'package:book_world/Screens/Uye_Ol.dart';
import 'package:book_world/Screens/girisYap.dart';
import 'package:book_world/Screens/Sepet.dart';

class app_bar extends StatefulWidget {
  const app_bar({Key? key}) : super(key: key);

  @override
  State<app_bar> createState() => _app_barState();
}

class _app_barState extends State<app_bar> {
  @override
  String baslik = 'Kitap Dünyası';

  Widget build(BuildContext context) {
    return MaterialApp(
      title: baslik,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo[500],
          title: Text(
            baslik,
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Uye_Ol()),
                );
              },
              child: Text(
                'Üye Ol',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GirisYap()),
                );
              },
              child: Text(
                'Girş Yap',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTapUp: (e) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: const Text(
                        'Birazdan tetiklenecek',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.indigo[500],
                      elevation: 24.0,
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
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
                child: Icon(
                  Icons.home,
                ),
              ),
            ),
            GestureDetector(
              onLongPress: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text(
                      'Uzun Bastınız',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.indigo[500],
                    elevation: 24.0,
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Sepet()),
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
              child: Icon(
                Icons.shopping_basket,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
