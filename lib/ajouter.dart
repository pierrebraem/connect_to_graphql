import 'package:connect_to_graphql/services/graphql_service_user.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget{
  AddPage({super.key});
  GraphQLServiceUser graphQLServiceUser = GraphQLServiceUser();
  bool? added;

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final age = TextEditingController();
  final password = TextEditingController();

  void _add(firstname, lastname, email, username, age, password) async {
    added = false;
    added = await graphQLServiceUser.createUser(this.firstname.text, this.lastname.text, this.email.text, this.username.text, int.parse(this.age.text), this.password.text);
  }
 
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
              _add(firstname, lastname, email, username, age, password);

              Navigator.pop(context, added);
            },
            child: const Text('Ajouter')
          ),

          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Annuler')
          )
        ]
      )
    );
  }
}