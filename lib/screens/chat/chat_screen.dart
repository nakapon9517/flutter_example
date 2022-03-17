import 'package:example/screens/chat/model/message.dart';
import 'package:example/screens/chat/model/role.dart';
import 'package:example/screens/chat/model/room.dart';
import 'package:example/screens/chat/model/user.dart';
import 'package:example/screens/chat/widgets/room_list_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: RoomList(
        rooms: rooms,
      ),
    );
  }
}

List<Room> rooms = [
  Room('room-id-1', Role.admin, 'title1', messages, DateTime.now(),
      DateTime.now()),
  Room('room-id-2', Role.admin, 'title2', messages, DateTime.now(),
      DateTime.now()),
];

List<Message> messages = List.generate(
  24,
  (index) => Message(
    'message-$index',
    index % 2 == 0 ? user1 : user2,
    'message-$index',
    null,
    null,
    MessageType.text,
    [],
    DateTime.now(),
    DateTime.now(),
  ),
);

User user1 = User('user-id-1', 'tanaka', 'taro',
    'https://raw.githubusercontent.com/nakapon9517/flutter_example/main/assets/images/supu-1.jpeg');
User user2 = User('user-id-2', 'suzuki', 'taro',
    'https://avatars.githubusercontent.com/u/62886817?v=4');
