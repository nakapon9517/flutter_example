import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url, bool? appWeb) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: (appWeb ?? false));
  } else {
    throw 'Could not launch $url';
  }
}
