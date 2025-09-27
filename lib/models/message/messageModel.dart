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
    id: map['id'],
    chatId: map['chatId'],
    sender: map['sender'],
    content: map['content'],
    timestamp: DateTime.parse(map['timestamp']),
  );
}