import 'package:example/constants.dart';
import 'package:example/screens/chat/model/message.dart';
import 'package:example/utils/size_config.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatefulWidget {
  MessageWidget(this.message, {Key? key}) : super(key: key);

  Message message;

  @override
  State<StatefulWidget> createState() => _MessageState();
}

class _MessageState extends State<MessageWidget> {
  final String currentUserId = 'user-id-2';

  Widget receiveMessage(BuildContext context) {
    final config = SizeConfig(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 4),
          child: CircleAvatar(
            foregroundImage: NetworkImage(widget.message.user.imageUrl),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: config.width() * 0.7,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
            padding: const EdgeInsets.only(
              top: defaultPadding,
              bottom: defaultPadding,
              left: defaultPadding,
              right: defaultPadding,
            ),
            child: Text(
              widget.message.text.toString(),
            ),
          ),
        )
      ],
    );
  }

  Widget sendMessage(BuildContext context) {
    final config = SizeConfig(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: config.width() * 0.7,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).primaryColor,
            ),
            padding: const EdgeInsets.only(
              top: defaultPadding,
              bottom: defaultPadding,
              left: defaultPadding,
              right: defaultPadding,
            ),
            child: Text(
              widget.message.text.toString(),
              style: TextStyle(
                color: Theme.of(context).primaryTextTheme.headline6!.color,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.message.user.id == currentUserId
          ? sendMessage(context)
          : receiveMessage(context),
    );
  }
}
