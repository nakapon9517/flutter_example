import 'package:example/constants.dart';
import 'package:example/screens/chat/model/room.dart';
import 'package:example/screens/chat/widgets/room_widget.dart';
import 'package:flutter/material.dart';

class RoomList extends StatefulWidget {
  const RoomList({Key? key, required this.rooms}) : super(key: key);
  final List<Room> rooms;

  @override
  State<StatefulWidget> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              vertical: defaultPadding,
              horizontal: defaultPadding,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<StatefulWidget>(
                    builder: (context) => RoomWidget(room: widget.rooms[index]),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.rooms[index].title,
                    ),
                  ),
                  const Icon(Icons.navigate_next)
                ],
              ),
            ),
          );
        },
        itemCount: widget.rooms.length,
      ),
    );
  }
}
