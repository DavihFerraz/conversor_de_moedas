// ignore: unused_import
// ignore_for_file: import_of_legacy_library_into_null_safe, duplicate_ignore

// ignore: unused_import
import 'dart:developer';

import 'package:conversor_de_moedas/view/home/home_view.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe, unused_import
import 'package:http/http.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?key=6b8fbd4d";

void main() async {
  // ignore: avoid_print
  print(await getData());
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
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
        ),
        primarySwatch: Colors.amber,
      ),
      home:  const HomePage(),
    );
  }
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}
