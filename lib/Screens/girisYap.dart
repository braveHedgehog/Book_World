import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:book_world/Admin/Admin_Giris.dart';
import 'package:book_world/main.dart';
import 'package:book_world/services/firebase_method.dart';
import 'package:provider/provider.dart';

import '../HomeView/HomeView.dart';

class GirisYap extends StatefulWidget {
  String? kullanici;
  String? sifre;

  GirisYap({this.kullanici, this.sifre});

  @override
  State<GirisYap> createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {
  String user_email = "";

  String user_password = "";

  @override
  Widget build(BuildContext context) {
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.indigo[500],
          body: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 600,
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Giriş Yap',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Kullanıcı Adı: ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        TextField(
                          onChanged: (value) {
                            user_email = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0)),
                            ),
                            labelText: 'Email: ',
                            labelStyle: new TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Şifre: ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) {
                              user_password = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                              ),
                              labelText: 'Şifreniz',
                              labelStyle: new TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              onPrimary: Colors.white,
                              padding: EdgeInsets.all(12),
                            ),
                            onPressed: () {
                              if (user_email == '' ||
                                  user_password == '') {
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
                              } else {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    content: const Text(
                                      'Tebrikler, artık siz de bir üyemiz oldunuz!!!',
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
                                                builder: (context) => Home(kullanici: user_email.trim(),)),
                                          );
                                          context.read<FlutterFireAuthService>().signIn(user_email.trim(),user_password.trim(), context);
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
                              'Giriş Yap',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            onPrimary: Colors.white,
                            padding: EdgeInsets.all(12),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HayvanDostu()),
                            );
                          },
                          child: Icon(
                            Icons.home,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            onPrimary: Colors.white,
                            padding: EdgeInsets.all(12),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Admin_giris()),
                            );
                          },
                          child: Text(
                            'Admin Giriş',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
