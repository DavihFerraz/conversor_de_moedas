import 'package:conversor_de_moedas/view/home/home_view.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe, unused_import
import 'package:http/http.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?key=6b8fbd4d";

void main() async {
  http.Response response = await http.get(request);
  print(
    json.decode(response.body)["results"]["currencies"]["USD"],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conversor',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}
