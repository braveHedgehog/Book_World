import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:book_world/HomeView/HomeView.dart';
import 'package:book_world/Screens/girisYap.dart';
import 'package:book_world/services/firebase_method.dart';
import 'package:provider/provider.dart';

class Uye_Ol extends StatefulWidget {
  @override
  State<Uye_Ol> createState() => _Uye_OlState();
}

class _Uye_OlState extends State<Uye_Ol> {
  TextEditingController kullaniciAl = new TextEditingController();
  TextEditingController sifreAl = new TextEditingController();
  TextEditingController mailAl = new TextEditingController();

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
                            'Üye Ol',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Mail:  ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextField(
                            controller: mailAl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15.0)),
                              ),
                              labelText: 'Mail...',
                              labelStyle: new TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Kullanıcı Adı: ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextField(
                            controller: kullaniciAl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15.0)),
                              ),
                              labelText: 'Kullanıcı Adınız',
                              labelStyle: new TextStyle(
                                color: Colors.black,
                              ),
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
                            controller: sifreAl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15.0)),
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
                              context.read<FlutterFireAuthService>().signUp(kullaniciAl.text.trim(), mailAl.text.trim(), sifreAl.text.trim());
                              if (kullaniciAl.text == '' ||
                                  sifreAl.text == '' ||
                                  mailAl.text == '') {
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
                                                builder: (context) => Home(kullanici: kullaniciAl.text,)),
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
                              'Üye Ol',
                              style: TextStyle(fontSize: 25),
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
        ),
      ),
    );
  }
}
