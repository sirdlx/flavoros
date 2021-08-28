import 'package:flutter/cupertino.dart';

class FText extends StatelessWidget {
  final String? text;

  const FText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return Container();
    }

    return Text(
      '$text',
    );
  }
}
