import 'package:flavoros/components/text.dart';
import 'package:flavoros/utils/theme.dart';
import 'package:flutter/material.dart';

class FlavorOS extends StatefulWidget {
  const FlavorOS({Key? key}) : super(key: key);

  @override
  _FlavorOSState createState() => _FlavorOSState();
}

class _FlavorOSState extends State<FlavorOS> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: fosTheme,
      title: 'FlavorOS',
      home: FlavorOSLayout(),
    );
  }
}

class FlavorOSLayout extends StatelessWidget {
  const FlavorOSLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OS',
              textScaleFactor: 3,
            ),
          ],
        ),
      ),
    );
  }
}
