import 'package:flutter/material.dart';
import 'package:book_world/Admin/Admin_Main.dart';
import 'package:book_world/Screens/girisYap.dart';
import 'package:book_world/main.dart';

class Admin_giris extends StatefulWidget {
  const Admin_giris({Key? key}) : super(key: key);


  @override
  State<Admin_giris> createState() => _Admin_girisState();
}

class _Admin_girisState extends State<Admin_giris> {
  TextEditingController kullaniciAl = new TextEditingController();
  TextEditingController sifreAl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[500],
        body: Center(
          child: ListView(
            children: <Widget> [ SizedBox(
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
                          if (kullaniciAl.text == '' || sifreAl.text == '') {
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
                                  'Giriş Başarılı !!!!!',
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
                                            builder: (context) => AdminMain(kullanici: kullaniciAl.text,)),
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
                          'Giriş',
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
                          MaterialPageRoute(builder: (context) => HayvanDostu()),
                        );
                      },
                      child: Icon(
                        Icons.home,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GirisYap()),
                          );
                        },
                        child: Text(
                          'Kullanıcı Giriş Sayfası',
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
    );
  }
}
