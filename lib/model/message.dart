class Message {
  final String text;
  final String id;

  Message({required this.id, required this.text});

  factory Message.fromJson(json) {
    return Message(text: json['message'], id: json['id']);
  }
}
