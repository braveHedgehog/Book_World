import "package:flutter/material.dart";
import 'package:book_world/Admin/Admin_Main.dart';
import 'package:book_world/models/books.dart';
import 'package:book_world/view/BookList.dart';
import 'package:sqflite/sqflite.dart';
import 'package:book_world/services/db_utils.dart';

DbUtils utils = DbUtils();


class Book_Edit extends StatefulWidget {
  String? kullanici;
  String? sifre;

  Book_Edit({this.kullanici, this.sifre});

  @override
  State<Book_Edit> createState() => _Book_EditState();
}

class _Book_EditState extends State<Book_Edit> {
  TextEditingController bookId = TextEditingController();
  TextEditingController bookName = TextEditingController();
  TextEditingController bookYazar = TextEditingController();

  late Future<Database> database;
  List<Books> bookList = [];

  _onPressedUpdate() async {
    final book = Books(
      id: int.parse(bookId.text.toString()),
      name: bookName.text,
      yazar: bookYazar.text,
    );
    utils.updateBook(book);
    bookList = await utils.books();
    getData();
  }

  _onPressedAdd() async {
    final book = Books(
      id: int.parse(bookId.text.toString()) ,
      name: bookName.text,
      yazar: bookYazar.text,
    );
    utils.insertBook(book);
    bookList = await utils.books();
    getData();
  }

  _onPressDelete() async {
    final book = Books(
      id: int.parse(bookId.text.toString()) ,
      name: bookName.text,
      yazar: bookYazar.text,
    );
    utils.deleteBook(book.id);
    bookList = await utils.books();
    getData();
  }

  void getData() async {
    await utils.books().then((result) => {
      setState(() {
        bookList = result;
      })
    });
    print(bookList);
  }

  void initState() {
    getData();
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[500],
          title: Text(
            'Kitap Dünyası',
            style: TextStyle(fontSize: 15),
          ),
          actions: [IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminMain(kullanici: widget.kullanici,)),
              );
            },
            icon: Icon(
              Icons.home,
            ),
          ),],
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Padding(padding: const EdgeInsets.only(top: 30)),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: bookId,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Kitap id',
                        labelStyle: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      controller: bookName,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Kitap Adı: ',
                        labelStyle: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      controller: bookYazar,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Kitabın Yazarı: ',
                        labelStyle: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
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
                        if (
                        bookName.text == '' &&
                            bookId.text == '' && bookYazar.text == '') {
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
                                'Kitap Eklendi!!!!!!!',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.indigo[500],
                              elevation: 24.0,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    _onPressedAdd();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BookList(kullanici: widget.kullanici,)),
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
                        'Kitap Ekle',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
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
                        if (
                        bookName.text == '' &&
                            bookId.text == ''  && bookYazar.text == '') {
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
                                'Kitap Silindi!!!!!!!',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.indigo[500],
                              elevation: 24.0,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    _onPressDelete();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BookList(kullanici: widget.kullanici,)),
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
                        'Kitap Sil',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
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
                        if (
                        bookName.text == '' &&
                            bookId.text == ''  && bookYazar.text == '') {
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
                                'Kitap Güncellendi!!!!!!!',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.indigo[500],
                              elevation: 24.0,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    _onPressedUpdate();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BookList(kullanici: widget.kullanici,)),
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
                        'Kitap Güncelle',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
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
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: const Text(
                              'Listeleme Ekranına Yönlendiriliyorsunuz!!!!!!!',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.indigo[500],
                            elevation: 24.0,
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => BookList(kullanici: widget.kullanici,)),
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
                        'Kitapları Listele',
                        style: TextStyle(fontSize: 25),
                      ),
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
