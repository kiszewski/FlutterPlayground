import 'package:flutter/material.dart';

class BluePageModal extends StatelessWidget {
  const BluePageModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 250,
      height: MediaQuery.of(context).size.height,
    );
  }
}
