import 'package:flutter/material.dart';

class Storybar extends StatelessWidget {
  const Storybar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          children: [
            Container(
              height: 255,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  GestureDetector(
                    onTap: () => print("Add Story Clicked"),
                    child: Column(
                      children: [
                        Container(
                          height: 170,
                          width: 150,
                          margin: EdgeInsets.only(bottom: 30.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image(
                              image: AssetImage('assets/images'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () => {},
                            child: Text(
                              'Add To Story',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 50.0,
                    left: 45.0,
                    child: IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.add_circle_rounded),
                      iconSize: 45.0,
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 250,
              width: 150,
              child: Stack(fit: StackFit.expand, children: [
                GestureDetector(
                  onTap: () => print('Friends Story Clicked'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage('assets/images'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
