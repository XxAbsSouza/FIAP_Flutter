import 'package:flutter/material.dart';
import 'package:listview/components/contato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListaPage(),
    );
  }
}
class ListaPage extends StatelessWidget {
  const ListaPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Contato> contatos = [
    Contato('Francisco', 'asdsa@gmail.com'),
    Contato('Mel', 'asdsa@mel.com'),
    Contato('Fred', 'asdsa@fred.com'),
    Contato('Lili', 'asdsa@lili.com'),
    Contato('Bola', 'asdsa@bola.com'),
    Contato('khusadjkhsa', 'asdsa@gmail.com'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Listview Builder")),
      body: ListView.builder(
        // itemCount: 54,
        // itemBuilder: (BuildContext context, int index){
        //   if (index%2==0) {
        //     return Text('GOLLLLLL $index',style: TextStyle(fontSize: 25),);
        //   }
        //   return Text('time $index',style: TextStyle(fontSize: 25),);
        // },
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: CircleAvatar(
              child: Text(contatos[index].nomeCompleto[0]),
            ),
            title: Text(contatos[index].nomeCompleto),
            subtitle: Text(contatos[index].email),
          );
        },
      ),
    );
  }
}

