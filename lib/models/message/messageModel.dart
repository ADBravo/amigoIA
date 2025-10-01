class MessageModel {
  final int id;
  final int chatId;
  final String sender; // 'user' or 'ai'
  final String content;
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.sender,
    required this.content,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'chatId': chatId,
    'sender': sender,
    'content': content,
    'timestamp': timestamp.toIso8601String(),
  };

  factory MessageModel.fromMap(Map<String, dynamic> map) => MessageModel(
    id: map['id'] is int
        ? map['id'] as int
        : int.tryParse(map['id']?.toString() ?? '') ?? 0,
    chatId: map['chatId'] is int
        ? map['chatId'] as int
        : int.tryParse(map['chatId']?.toString() ?? '') ?? 0,
    sender: map['sender']?.toString() ?? '',
    content: map['content']?.toString() ?? '',
    timestamp: DateTime.parse(map['timestamp']),
  );
}
