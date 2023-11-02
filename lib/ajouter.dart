import 'package:connect_to_graphql/services/graphql_service_user.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget{
  AddPage({super.key});
  GraphQLServiceUser graphQLServiceUser = GraphQLServiceUser();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final age = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un utilisateur')
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            controller: firstname,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nom'
            )
          ),

          TextFormField(
            controller: lastname,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Prenom'
            )
          ),

          TextFormField(
            controller: email,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Email'
            )
          ),

          TextFormField(
            controller: username,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Pseudo'
            )
          ),

          TextFormField(
            controller: age,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Age'
            )
          ),

          TextFormField(
            controller: password,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Mot de passe'
            )
          ),

          TextButton(
            onPressed: () {
              final test = graphQLServiceUser.addUser(firstname.text, lastname.text, email.text, username.text, int.parse(age.text), password.text);
              showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: Text(test)
                  );
                }
              );
            },
            child: const Text('Ajouter')
          ),

          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Annuler')
          )
        ]
      )
    );
  }
}