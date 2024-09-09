// class User {
//   String id;
//   String name;
//   String email;

//   User({required this.id, required this.name, required this.email});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['_id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }
// }
class User {
  final String id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String, // Ensure _id is treated as String
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}
