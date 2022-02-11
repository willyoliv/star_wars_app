import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

class EditAvatar extends StatefulWidget {
  const EditAvatar({Key? key}) : super(key: key);

  @override
  _EditAvatarState createState() => _EditAvatarState();
}

class _EditAvatarState extends State<EditAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B20),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1B20),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: FluttermojiCircleAvatar(
              radius: 100,
              backgroundColor: const Color(0xFFFFE919),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
            child: FluttermojiCustomizer(
              outerTitleText: "",
              showSaveWidget: false,
            ),
          ),
        ],
      ),
    );
  }
}
