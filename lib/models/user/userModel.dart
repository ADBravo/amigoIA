class UserModel {
  final int id;
  final String email;
  final String password;
  final String name;
  final String gender;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.gender,
  });

  Map<String, dynamic> toMap({bool includeId = false}) {
    final map = {
      'email': email,
      'password': password,
      'name': name,
      'gender': gender,
    };
    if (includeId) map['id'] = id.toString(); 
    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: int.tryParse(map['id'].toString()) ?? 0,
      email: map['email']?.toString() ?? '',
      password: map['password']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      gender: map['gender']?.toString() ?? '',
    );
  }
}
