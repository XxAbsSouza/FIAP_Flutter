//se for só visual é stateless
import 'package:aula0705/mensagem.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Recuperar o valor que foi passado na firstPAge
    final arguments = ModalRoute.of(context)!.settings.arguments as Mensagem; //o as Mensagem e pra fazer o casthing, convertendo pro tipo mensage, 
    return Scaffold(
      appBar: AppBar(title: Text(arguments.descricao)),
      body: Center(
        child: ElevatedButton(
          onPressed:() {
            // Navigator.of(context).pop();
            Navigator.pop(context);
          },
          child: const Text('Voltar'),
        ),
      ),
    );
  }
}