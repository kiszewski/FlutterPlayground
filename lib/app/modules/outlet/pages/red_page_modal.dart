import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RedPageModal extends StatelessWidget {
  const RedPageModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 450,
      height: MediaQuery.of(context).size.height,
      child: TextButton(
        onPressed: () {
          Modular.to.navigate('./blue_page_modal');
        },
        child: Text('Ir pra azul'),
      ),
    );
  }
}
