import 'package:any_link_preview/any_link_preview.dart';
import 'package:example/constants.dart';
import 'package:example/screens/chat/model/message.dart';
import 'package:example/utils/size_config.dart';
import 'package:example/utils/url_launch.dart';
import 'package:example/utils/url_splitter.dart';
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
    List<String> urls = MessageSplitted(widget.message).links();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(right: 4, bottom: 12),
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
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                ),
                padding: const EdgeInsets.only(
                  top: defaultPadding,
                  bottom: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: generateMessage(
                  context,
                  widget.message.text.toString(),
                  widget.message.messageType,
                  false,
                ),
              ),
            )
          ],
        ),
        ...urls
            .map(
              (e) => Container(
                padding: const EdgeInsets.only(top: 8),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: config.width() * 0.7,
                  ),
                  child: generateMessage(
                    context,
                    e,
                    MessageType.url,
                    true,
                  ),
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget sendMessage(BuildContext context) {
    final config = SizeConfig(context);
    List<String> urls = MessageSplitted(widget.message).links();
    print(urls);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: config.width() * 0.7,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                padding: const EdgeInsets.only(
                  top: defaultPadding,
                  bottom: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: generateMessage(
                  context,
                  widget.message.text.toString(),
                  MessageType.url,
                  true,
                ),
              ),
            ),
          ],
        ),
        ...urls
            .map(
              (e) => Container(
                padding: const EdgeInsets.only(top: 8),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: config.width() * 0.7,
                  ),
                  child: generateMessage(
                    context,
                    e,
                    MessageType.url,
                    true,
                  ),
                ),
              ),
            )
            .toList(),
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

StatelessWidget generateMessage(
  BuildContext context,
  String text,
  MessageType type,
  bool isSend,
) {
  switch (type) {
    case MessageType.image:
      return Text(text.toString());
    case MessageType.url:
      return LinkMessage(context, text.toString());
    case MessageType.text:
      return Text(
        text.toString(),
        style: isSend
            ? TextStyle(
                color: Theme.of(context).primaryTextTheme.headline6!.color,
              )
            : const TextStyle(),
      );
    default:
      return Text(text.toString());
  }
}

class LinkMessage extends StatelessWidget {
  const LinkMessage(this.context, this.url, {Key? key}) : super(key: key);
  final BuildContext context;
  final String url;

  @override
  Widget build(BuildContext context) {
    return AnyLinkPreview(
      link: url,
      displayDirection: uiDirection.uiDirectionVertical,
      showMultimedia: true,
      bodyMaxLines: 3,
      bodyTextOverflow: TextOverflow.ellipsis,
      titleStyle: Theme.of(context).textTheme.bodyLarge,
      bodyStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
      errorTitle: 'Show my custom error title',
      errorBody: 'Show my custom error body',
      errorWidget: Container(
        color: Colors.grey[300],
        child: const Text('Oops!'),
      ),
      errorImage: "https://google.com/",
      cache: const Duration(days: 7),
      backgroundColor: Colors.grey[300],
      borderRadius: 12,
      removeElevation: false,
      boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.grey)],
      onTap: () {
        launchURL(url);
      },
    );
  }
}
