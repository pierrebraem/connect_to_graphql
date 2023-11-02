import 'package:connect_to_graphql/models/user_model.dart';
import 'package:connect_to_graphql/services/graphql_service_user.dart';
import 'package:flutter/material.dart';
import 'ajouter.dart';

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
                onPressed : () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPage())
                  )
                },
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
