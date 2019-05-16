import 'dart:convert';

Account accountFromJson(String str) {
  final jsonData = json.decode(str);
  return Account.fromMap(jsonData);
}

String accountToJson(Account data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Account {
  int id;
  String username;
  String password;

  Account({this.id, this.username, this.password});

  factory Account.fromMap(Map<String, dynamic> json) => new Account(
    id: json["id"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "username": username,
    "password": password,
  };
}
