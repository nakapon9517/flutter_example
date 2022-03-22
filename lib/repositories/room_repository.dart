import 'package:example/screens/chat/model/message.dart';
import 'package:example/screens/chat/model/role.dart';
import 'package:example/screens/chat/model/room.dart';
import 'package:example/screens/chat/model/user.dart';

class RoomRepository {
  List<Room> fetchRooms() {
    return rooms;
  }
}

List<Room> rooms = [
  Room('room-id-1', Role.admin, 'room-1', messages, DateTime.now(),
      DateTime.now()),
  Room('room-id-2', Role.admin, 'room-2', messages, DateTime.now(),
      DateTime.now()),
];

// List<Message> messages = List.generate(
//   24,
//   (index) => Message(
//     'message-$index',
//     index % 3 == 0 ? user1 : user2,
//     index % 2 == 0
//         ? 'ぐぐってみてください。「https://www.google.com/」がおすすめです。'
//         : 'ソフトウェアを特定の地域の言語、仕様に縛られることなく、世界各国で共通して利用できるようにすることを意味する「Internationalization」を省略した表記方法。',
//     'https://pub.dev/packages/any_link_preview',
//     null,
//     index % 7 == 0 ? MessageType.url : MessageType.text,
//     [],
//     DateTime.now(),
//     DateTime.now(),
//   ),
// );

List<Message> messages = [
  Message(
    'id-1',
    user1,
    'Hi',
    null,
    null,
    MessageType.text,
    [],
    DateTime.now(),
    DateTime.now(),
  ),
  Message(
    'id-2',
    user2,
    '日本語と「https://www.google.com/」リンク',
    null,
    null,
    MessageType.text,
    [],
    DateTime.now(),
    DateTime.now(),
  ),
  Message(
    'id-3',
    user2,
    'ソフトウェアを特定の地域の言語、仕様に縛られることなく、世界各国で共通して利用できるようにすることを意味する「Internationalization」を省略した表記方法。',
    null,
    null,
    MessageType.text,
    [],
    DateTime.now(),
    DateTime.now(),
  ),
  Message(
    'id-4',
    user1,
    '日本語と「https://www.google.com/」リンク',
    null,
    null,
    MessageType.text,
    [],
    DateTime.now(),
    DateTime.now(),
  ),
];

User user1 = User('user-id-1', 'tanaka', 'taro',
    'https://raw.githubusercontent.com/nakapon9517/flutter_example/main/assets/images/supu-1.jpeg');
User user2 = User('user-id-2', 'suzuki', 'taro',
    'https://avatars.githubusercontent.com/u/62886817?v=4');
