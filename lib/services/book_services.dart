import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/book.dart';

Future<book> fetchData() async {
  final response = await http.get(
    Uri.parse('https://api.collectapi.com/book/newBook'),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'apikey 1tXJD8p6lJVA6WC80cBZPY:5YtLUFiqng6fcOc4hGYa3v'
    },
  );
  if (response.statusCode == 200) {
    return book.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Unexpected error occured!');
  }
}
