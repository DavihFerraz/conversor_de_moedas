import 'package:conversor_de_moedas/main.dart';
import 'package:conversor_de_moedas/view/textfield.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe, unused_import
import 'package:http/http.dart';

const request = "https://api.hgbrasil.com/finance?key=6b8fbd4d";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final realController = TextEditingController();
  final euroController = TextEditingController();
  final dolarController = TextEditingController();
  double dolar = 0;
  double euro = 0;

  void _realChanged(String text) {
    if (text.isEmpty) {
      dolarController.text = "";
      euroController.text = "";
      return;
    }
    double real = double.parse(text);

    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      realController.text = "";
      euroController.text = "";
      return;
    }
    double dolar = double.parse(text);

    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      realController.text = "";
      dolarController.text = "";
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

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
        body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text(
                    'Carregando Dados...',
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'Erro ao Carregar Dados...',
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 20, left: 20),
                      child: Center(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.monetization_on,
                              color: Colors.amber,
                              size: 150,
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            //Reais
                            buildTextField(
                                "Reais", "R\$", realController, _realChanged),

                            const SizedBox(
                              height: 10,
                            ),

                            buildTextField("Dólares", "US\$", dolarController,
                                _dolarChanged),

                            const SizedBox(
                              height: 10,
                            ),
                            buildTextField(
                                "Euros", "€", euroController, _euroChanged),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            }
          },
        ));
  }
}
