import 'package:checkpoint3/models/banda.dart';
import 'package:flutter/material.dart';


class ListBand extends StatelessWidget {
  const ListBand({super.key});

  @override
  Widget build(BuildContext context){
    List<Banda> bandas = [
      Banda("Paramore", "Pop", 3),
      Banda("One Direction", "Pop", 5),
      Banda("Calypso", "Forró", 2),
      Banda("Legião Urbana", "rock", 3),
    ];
    void toDetails(BuildContext context, int index){
      Navigator.pushNamed(context, '/details', arguments: bandas[index]);
    }
    return Scaffold( 
      appBar: AppBar(title: const Text("Banda")),
      body: ListView.builder(
        itemCount: bandas.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: CircleAvatar(
              child: Text(bandas[index].nome[0]),
            ),
            title: Text(bandas[index].nome),
            subtitle: Text(bandas[index].genero),
            trailing: IconButton(
              icon: Icon(Icons.read_more_rounded),
              onPressed: () => toDetails(context, index),
            ),
          );
        },
      ),
    );
  }
}