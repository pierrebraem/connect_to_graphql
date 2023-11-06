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

  Future<bool> createUser(String firstname, String lastname, String email, String username, int age, String password) async {
    try{
      QueryResult result = await client.query(QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql("""
          mutation{
            createUser(userInput: {
              firstname: "$firstname",
              lastname: "$lastname",
              email: "$email",
              username: "$username",
              age: $age,
              password: "$password"
            })
            {id, firstname, lastname}
          }
        """)
      ));

      if(result.hasException){
        throw Exception(result.exception);
      }
      
      return true;
    }
    catch(error){
      throw Exception(error);
    }
  }
}