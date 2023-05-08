import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe, unused_import
import 'package:http/http.dart';

const request = "https://api.hgbrasil.com/finance?key=6b8fbd4d";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.attach_money),
            Text('Conversor'),
            Icon(Icons.attach_money),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            children: const [
              Icon(
                Icons.attach_money,
                color: Colors.amber,
                size: 100,
              ),
              SizedBox(
                height: 10,
              ),
              //Reais
              TextField(),
              //Dólares
              TextField(),
              //Euros
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
