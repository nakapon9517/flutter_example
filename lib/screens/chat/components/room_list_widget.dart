import 'package:example/constants.dart';
import 'package:example/screens/chat/components/room_widget.dart';
import 'package:example/screens/chat/model/room.dart';
import 'package:example/utils/app_router.dart';
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
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(height: 1);
      },
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            AppRouter(context).push(RoomWidget(room: widget.rooms[index]));
          },
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(
              vertical: defaultPadding * 2,
              horizontal: defaultPadding * 2,
            ),
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
    );
  }
}
