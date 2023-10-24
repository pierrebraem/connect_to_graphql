import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test connexion à une API GraphQL',
      home: Start(),
    );
  }
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Start> {
  final List<String> accounts = <String>[
    'Carole Thibault',
    'Wyall Meunier',
    'Carole Bonnet'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des utilisateurs"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: accounts.length,
              itemBuilder: (BuildContext context, int index){
                return Center(
                  child: Text(accounts[index])
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider()
            )
          ),

          OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed: () {}, 
                child: const Text('Ajouter')
              ),

              FilledButton(
                onPressed: () {}, 
                child: const Text('Modifier')
              ),

              FilledButton(
                onPressed: () => dialogDelete(context),
                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Supprimer')
              ),
            ],
          )
        ]
      )
    );
  }

  Future<void> dialogDelete(BuildContext context){
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Suppression d\'un utilisateur'),
          content: const Text(
            'Voulez-vous vraiment supprimer cette utilisateur ?'
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oui'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            TextButton(
              child: const Text('Non'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ]
        );
      }
    );
  }
}
