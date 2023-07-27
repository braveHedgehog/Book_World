import 'package:flutter/material.dart';
import 'package:book_world/Admin/Admin_Kitap_Ekleme.dart';
import 'package:book_world/Admin/Admin_Pie.dart';
import 'package:book_world/Admin/Admin_charts.dart';

import 'Admin_Main.dart';


class Admin_Grafik extends StatefulWidget {
  String? kullanici;
  String? sifre;

  Admin_Grafik({this.kullanici, this.sifre});

  @override
  State<Admin_Grafik> createState() => _Admin_GrafikState();
}

class _Admin_GrafikState extends State<Admin_Grafik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[500],
        title: Text(
          'Kitap Dünyası',
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'Kullanıcı İstatistikleri',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Admin_charts(),
            Admin_Pie(),
          ],
        ),
      ),
    );
  }
}
