import 'package:aula0705/pages/first_page.dart';
import 'package:aula0705/pages/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //--> responsável pela navegação
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      /////// CONFIGURAR ROTAS ///////
      // quando usamos rotas, n faz mais sentido usar o home
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
      }, //--> {} - instancia o Map (que é o parâmetro de route)
      initialRoute: '/', //--> indica a "home"
    );
  }
}
