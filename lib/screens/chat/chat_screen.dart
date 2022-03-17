import 'package:example/repositories/room_repository.dart';
import 'package:example/screens/chat/model/room.dart';
import 'package:example/screens/chat/widgets/room_list_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<ChatScreen> {
  List<Room> rooms = RoomRepository().fetchRooms();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: RoomList(
        rooms: rooms,
      ),
    );
  }
}
