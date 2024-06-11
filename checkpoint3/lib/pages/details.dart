import 'package:checkpoint3/models/banda.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Banda;
    return Scaffold(
      appBar: AppBar(title: Text(args.nome)),
      body: Center(
        
      ),
    );
  }
}