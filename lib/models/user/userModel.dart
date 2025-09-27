class UserModel {
  final int id;
  String name;

  UserModel({required this.id, required this.name});

  Map<String, dynamic> toMap() => {'id': id, 'name': name};

  factory UserModel.fromMap(Map<String, dynamic> map) =>
      UserModel(id: map['id'], name: map['name']);
}