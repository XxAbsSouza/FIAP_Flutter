import 'package:check2/components/contato.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter checkpoint',
      theme: ThemeData.dark(),
      home: const ListPage(),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  List<Contato> contatos = [
    Contato("Gragas", "olhaogás@gmail.com"),
    Contato("zed", "ninjutsu@gmail.com"),
    Contato("ahri", "pspspsps@gmail.com"),
    Contato("Ezreal", "luxevoce??@gmail.com"),
    Contato("tharic", "pantone@gmail.com"),
  ];

  int count;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contatos Favoritos $count")),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: ()
      ),
    );
  }
}