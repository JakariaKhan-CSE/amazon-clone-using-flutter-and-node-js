import 'dart:convert';

class User{
  final String id;
  final String name;
  final String email;

  final String password;
  final String address;
  final String type;
  final String token;

  User({required this.id,required this.email, required this.name, required this.password, required this.address, required this.type, required this.token});

  Map<String,dynamic> toMap()
  {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "address": address,
      "type": type,
      "token": token
    };
  }

  factory User.fromMap(Map<String,dynamic> map)
  {
    return User(
        id: map['_id'] ?? '',  // id na diye _id diya hosse karon database a _id aivabe thake default
        name: map['name'] ?? '',
        password: map['password'] ?? '',
        address: map['address'] ?? '',
        type: map['type'] ?? '',
        token: map['token'] ?? '',
        email: map['email'] ?? ''
    );
  }

  String toJson()=> jsonEncode(toMap());  // backend e pathanor jonno json ke encode korbe

  factory User.fromJson(String source) => User.fromMap(jsonDecode(source));


}