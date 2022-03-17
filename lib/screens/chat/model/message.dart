import 'package:example/screens/chat/model/user.dart';

enum MessageType {
  text,
  url,
  image,
}

class Message {
  Message(
    this.id,
    this.user,
    this.text,
    this.url,
    this.image,
    this.messageType,
    this.reactions,
    this.updatedTime,
    this.createdTime,
  );

  String id;
  User user;
  String? text;
  String? url;
  String? image;
  MessageType messageType;
  List<Reaction>? reactions;
  DateTime updatedTime;
  DateTime createdTime;
}

class Reaction {
  Reaction(this.icon, this.user);

  String icon;
  User user;
}
