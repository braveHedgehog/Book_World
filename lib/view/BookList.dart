import "package:flutter/material.dart";
import 'package:book_world/Admin/Admin_Main.dart';
import 'package:book_world/models/books.dart';
import 'package:book_world/services/db_utils.dart';

import '../Admin/Admin_Kitap_Ekleme.dart';

DbUtils utils = DbUtils();

class BookList extends StatefulWidget {

  String? kullanici;
  String? sifre;

  BookList({this.kullanici, this.sifre});
  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {

  List<Books> bookList = [];

  void getData() async {
    await utils.books().then((result) => {
      setState(() {
        bookList = result;
      })
    });
    print(bookList);
  }

  void showAlert(String alertTitle, String alertContent) {
    AlertDialog alertDialog;
    alertDialog =
        AlertDialog(title: Text(alertTitle), content: Text(alertContent));
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[500],
        title: Text(
          'Kitap Dünyası',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminMain(kullanici: widget.kullanici,)),
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
                MaterialPageRoute(builder: (context) => Book_Edit(kullanici: widget.kullanici,)),
              );
            },
            icon: Icon(
              Icons.plus_one_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: bookList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(bookList[index].name.toString()+' '+bookList[index].yazar.toString()),
                    onTap: () {
                      showAlert("User " + bookList[index].name.toString() + " clicked",
                          "Book " + index.toString() + " clicked");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
