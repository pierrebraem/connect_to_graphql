class UserModel{
  final String id;
  final String firstname;
  final String lastname;
  final String? email;
  final String? username;
  final int? age;
  final String? password;

  UserModel({required this.id, required this.firstname, required this.lastname, this.email, this.username, this.age, this.password});

  static UserModel fromMap({required Map map}) => UserModel(
    id: map['id'],
    firstname: map['firstname'],
    lastname: map['lastname']
  );
}