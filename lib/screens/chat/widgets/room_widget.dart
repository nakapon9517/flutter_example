import 'package:example/constants.dart';
import 'package:example/screens/chat/model/room.dart';
import 'package:example/screens/chat/widgets/message_widget.dart';
import 'package:flutter/material.dart';

class RoomWidget extends StatefulWidget {
  RoomWidget({
    Key? key,
    required this.room,
  }) : super(key: key);
  Room room;

  @override
  State<RoomWidget> createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State<RoomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.title),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: ListView.builder(
          reverse: true,
          // controller: _scrollController,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding / 2,
                horizontal: defaultPadding,
              ),
              child: MessageWidget(widget.room.messages[index]),
            );
          },
          itemCount: widget.room.messages.length,
        ),
      ),
    );
  }
}
