import 'package:example/screens/chat/model/message.dart';

class MessageSplitted {
  MessageSplitted(this.message);
  Message message;

  List<String> links() {
    final urlRegExp = RegExp(
        r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");
    final urlMatches = urlRegExp.allMatches(message.text.toString());
    return urlMatches
        .map((urlMatch) => message.text.toString().substring(
              urlMatch.start,
              urlMatch.end,
            ))
        .toList();
  }
}
