import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const String _url = 'https://flutter.dev';

class UrlLauncherScreen extends StatefulWidget {
  const UrlLauncherScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UrlLauncherScreen();
}

class _UrlLauncherScreen extends State<UrlLauncherScreen> {
  Future<void> _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
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
                    onPressed: _launchURL,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
