import 'package:flutter/material.dart';
import 'package:book_world/Screens/UrunDetay.dart';
import 'package:book_world/services/book_services.dart';
import 'package:book_world/models/book.dart';

class BooksView extends StatefulWidget {
  String? kullanici;

  BooksView({this.kullanici});

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  late Future<book> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<book>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.result?.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
