import 'dart:io';
import 'package:flutter/material.dart';
import 'package:book_world/HomeView/HomeView.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class Iletisim extends StatefulWidget {
  String? kullanici;

  Iletisim({this.kullanici});

  final String title = "File Operations";

  @override
  State<Iletisim> createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {

  Future<void> downloadPDF(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final appDocumentsDirectory = await getTemporaryDirectory();
      final filePath = '${appDocumentsDirectory.path}/my_pdf.pdf';

      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      print('PDF indirme tamamlandı. Dosya yolu: $filePath');
    } else {
      print('Hata: ${response.statusCode}');
    }
  }

  void openPDF(String filePath) async {
    if (await canLaunch(filePath)) {
      await launch(filePath);
    } else {
      throw 'PDF görüntüleyici bulunamadı';
    }
  }


  @override
  Widget build(BuildContext context) {
    String baslik = 'Kitap Dünyası';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[500],
          title: Text(
            baslik,
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            kullanici: widget.kullanici,
                          )),
                );
              },
              icon: Icon(
                Icons.home,
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          'İletişim',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    'Kitap Dünyası Ltd. Şti.',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text(
                                    'Çınarlı Mah. Durmuş Sok. No:6 Derince/Kocaeli',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Icon(Icons.phone),
                                          Text('05427839099'),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Icon(Icons.mail),
                                          Text('yigitkirpicik@gmail.com',style: TextStyle(fontSize: 12),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Bizimle İletişime geçin'),
                        ElevatedButton(
                          child: const Text("CV indir"),
                          onPressed: () async {
                            String pdfUrl = 'https://tf.selcuk.edu.tr/dosyalar/files/033001/mufredat/yeni/Bilgisayar_Muhendisligi_Mufredat_6_01_09_2021_no.pdf';
                            downloadPDF(pdfUrl);
                          },
                        ),
                        ElevatedButton(
                          child: const Text("CV göster"),
                          onPressed: () async {
                            String pdfPath = '/path/to/my_pdf.pdf';
                            openPDF(pdfPath);
                          },
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
