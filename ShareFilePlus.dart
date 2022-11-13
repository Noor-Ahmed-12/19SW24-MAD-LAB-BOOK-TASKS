import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareFilePlus extends StatefulWidget {
  const ShareFilePlus({Key? key}) : super(key: key);
  @override
  ShareFilePlusState createState() => ShareFilePlusState();
}

class ShareFilePlusState extends State<ShareFilePlus> {
  String text = '';
  String link = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Share Plus',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('19SW24'),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Text:',
                      hintText: 'Enter anything to share',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      text = value;
                    }),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Comment:',
                      hintText: 'say something...',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      link = value;
                    }),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed:
                            text.isEmpty ? null : () => _onShare(context),
                        child: const Text('Share'),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(text,
        subject: link,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
