//se for só visual é stateless
import 'package:aula0705/mensagem.dart';
import 'package:aula0705/pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Center(
        child: ElevatedButton(
          onPressed:() {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => SecondPage()
            //   )
            // );
            Navigator.of(context)
              .pushNamed(
                '/second',
                arguments: Mensagem('Mensagem de navegação'),
              );
          },
          child: const Text('Navegar'),
        ),
      ),
    );
  }
}