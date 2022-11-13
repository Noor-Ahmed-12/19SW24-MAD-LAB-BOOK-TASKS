import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class URLLauncherExample extends StatelessWidget {
  URLLauncherExample({Key? key}) : super(key: key);

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'noorshaikh51027@gmail.com',
    query:
        '${Uri.encodeComponent('subject')}=${Uri.encodeComponent('give some recommandation for APP')}',
  );

  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: '090078601',
    queryParameters: <String, String>{
      'body': Uri.encodeComponent(
        'give some recommandation for APP',
      ),
    },
  );

  void _sendSms() async {
    await launchUrl(smsLaunchUri);
  }

  void _sendEmail() async {
    await launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Url Launcher Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _sendSms,
              child: const Text('Send SMS'),
            ),
            ElevatedButton(
              onPressed: _sendEmail,
              child: const Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}