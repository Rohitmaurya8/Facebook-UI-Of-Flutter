import 'package:flutter/material.dart';

class Postabar extends StatelessWidget {
  const Postabar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          iconSize: 50,
          onPressed: () => print('user avtar clicked'),
          icon: CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage('assets/images'),
          ),
        ),
        TextButton(
          onPressed: () => {},
          child: Text(
            "What's on your mind ?",
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
        ),
        Container(
          child: VerticalDivider(
            color: Colors.black26,
          ),
        ),
        Column(
          children: [
            IconButton(
              onPressed: () => print('Photo Clicked'),
              icon: Icon(Icons.photo_album_outlined),
            ),
            Text('Photo'),
          ],
        )
      ],
    );
  }
}
