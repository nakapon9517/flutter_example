import 'package:example/screens/chat/model/message.dart';
import 'package:example/screens/chat/model/role.dart';

class Room {
  Room(
    this.roomId,
    this.role,
    this.title,
    this.messages,
    this.updatedTime,
    this.createdTime,
  );

  String roomId;
  Role role;
  String title;
  List<Message> messages;
  DateTime updatedTime;
  DateTime createdTime;
}
