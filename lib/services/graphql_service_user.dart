import 'package:connect_to_graphql/config/graphql_config.dart';
import 'package:connect_to_graphql/models/user_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLServiceUser {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<UserModel>> getAllUsers() async {
    try{
      QueryResult result = await client.query(QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql("""
          {
            getAllUsers{
              id,
              firstname,
              lastname
            }
          }
        """)
      ));

      if(result.hasException){
        throw Exception(result.exception);
      }

      List? res = result.data?['getAllUsers'];

      if(res == null || res.isEmpty){
        return [];
      }

      List<UserModel> users = res.map((user) => UserModel.fromMap(map: user)).toList();

      return users;
    }
    catch(error){
      throw Exception(error);
    }
  }

  String addUser(String firstname, String lastname, String email, String username, int age, String password) {
    return "Bonjour je m'appelle $firstname $lastname et j'ai $age ans. Mon adresse mail est $email, mon pseudo $username et mon mot de passe c'est $password";
  }
}