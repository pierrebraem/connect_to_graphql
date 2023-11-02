import 'package:connect_to_graphql/models/user_model.dart';
import 'package:connect_to_graphql/services/graphql_service_user.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  List<UserModel>? users;
  GraphQLServiceUser graphQLServiceUser = GraphQLServiceUser();

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    users = null;
    users = await graphQLServiceUser.getAllUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des utilisateurs"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: users == null ? const Center(child: CircularProgressIndicator()) : 
        users!.isNotEmpty ? 
        Column(children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: users!.length,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.person),
                title: Text('${users![index].firstname} ${users![index].lastname}')
              )
            )
          ),

          OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed : () => dialogAdd(context),
                child: const Text('Ajouter')
              ),

              FilledButton(
                onPressed : () {},
                child: const Text('Modifier')
              ),

              FilledButton(
                onPressed : () => dialogDelete(context),
                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Supprimer')
              ),
            ],
          )
        ])
        : const Center(child: Text('Pas d\'utilisateurs'))
      )
    );
  }

  Future<void> dialogAdd(BuildContext context){
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => Dialog.fullscreen(
        child: Column(
          children: <Widget>[
            const Text('Ajouter un utilisateur'),

            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nom'
              )
            ),

            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Prenom'
              )
            ),

            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email'
              )
            ),

            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Pseudo'
              )
            ),

            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Age'
              )
            ),

            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Mot de passe'
              )
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ajouter')
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler')
            )
          ])
      )
    );
  }

  Future<void> dialogDelete(BuildContext context){
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Suppression d\'un utilisateur'),
          content: const Text('Voulez-vous vraiment supprimer cette utilisateur ?'),
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
