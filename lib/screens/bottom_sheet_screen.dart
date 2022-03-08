import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomSheetScreen();
}

class _BottomSheetScreen extends State<BottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom sheet'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all((12)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    child: const Text('Bottom Sheet'),
                    onPressed: () {
                      showModalBottomSheet<Widget>(
                          context: context,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: ElevatedButton(
                                          child: const Text('A'),
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: ElevatedButton(
                                          child: const Text('A'),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: ElevatedButton(
                                          child: const Text('A'),
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ElevatedButton(
                                          child: const Text('A'),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: ElevatedButton(
                                          child: const Text('A'),
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: ElevatedButton(
                                          child: const Text('A'),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class BottomSheetButton extends StatelessWidget {
//   const BottomSheetButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: const Text('show Buttom Sheet'),
//       onPressed: () async {
//         var result = await showModalBottomSheet<int>(
//           context: context,
//           builder: (context) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 ListTile(
//                   leading: const Icon(Icons.music_note),
//                   title: const Text('Music'),
//                   onTap: () => Navigator.of(context).pop(1),
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.videocam),
//                   title: const Text('Video'),
//                   onTap: () => Navigator.of(context).pop(2),
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.camera),
//                   title: const Text('Picture'),
//                   onTap: () => Navigator.of(context).pop(3),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }
