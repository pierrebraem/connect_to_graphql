class UserModel{
  final String id;
  final String firstname;
  final String lastname;

  UserModel({required this.id, required this.firstname, required this.lastname});

  static UserModel fromMap({required Map map}) => UserModel(
    id: map['id'],
    firstname: map['firstname'],
    lastname: map['lastname']
  );
}