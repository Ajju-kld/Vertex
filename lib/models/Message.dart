class Message {
  final String text;
  final bool itsMe;
  final DateTime dateTime;
  List<String>? reactions;

  Message({
    required this.text,
    required this.itsMe,
    required this.dateTime,
    this.reactions,
  });
}
