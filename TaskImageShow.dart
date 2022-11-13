import 'package:flutter/material.dart';

class ImageShow extends StatefulWidget {
  ImageShow({Key? key}) : super(key: key);

  @override
  State<ImageShow> createState() => _ImageShowState();
}

class _ImageShowState extends State<ImageShow> {
  int value = 0;
  List<String> list = [
    'https://images.unsplash.com/photo-1576343859106-aad2fdb40547?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1576343859106-aad2fdb40547?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=100',
    'https://images.unsplash.com/photo-1576343859106-aad2fdb40547?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=120',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImageViewer'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            if (value < 4) {
              value = value + 1;
            }
            return Image.network(
              list[0],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            );
          } else {
            if (value > 0) {
              value = value - 1;
            }

            return Image.network(
              list[1],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            );
          }
        },
      ),
    );
  }
}
