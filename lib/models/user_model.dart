class User
{
  String? accessToken;
  UserData? user;

  User.fromJson(Map<String, dynamic> map)
  {
    accessToken = map['accessToken'];
    user = UserData.fromJson(map['user']);
  }

}

class UserData
{
  int? id;
  String? name;
  String? email;

  UserData.fromJson(Map<String, dynamic> map)
  {
    id = map['id'];
    name = map['name'];
    email = map['email'];

  }
}