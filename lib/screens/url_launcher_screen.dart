import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherScreen extends StatefulWidget {
  const UrlLauncherScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UrlLauncherScreen();
}

class _UrlLauncherScreen extends State<UrlLauncherScreen> {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open brouwser'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Flutter公式'),
                    onPressed: () {
                      _launchURL('https://flutter.dev');
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text('GitHub'),
                    onPressed: () {
                      _launchURL('https://github.com/nakapon9517');
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text('pub.dev'),
                    onPressed: () {
                      _launchURL('https://pub.dev/');
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
