class ChatModel {
  final int id;
  String title;
  final DateTime createdAt;

  ChatModel({required this.id, required this.title, required this.createdAt});

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'createdAt': createdAt.toIso8601String(),
  };

  factory ChatModel.fromMap(Map<String, dynamic> map) => ChatModel(
    id: map['id'] is int
        ? map['id'] as int
        : int.tryParse(map['id']?.toString() ?? '') ?? 0,
    title: map['title']?.toString() ?? '',
    createdAt: DateTime.parse(map['createdAt']),
  );
}
