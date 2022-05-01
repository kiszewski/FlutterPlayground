import 'package:challenges_app/app/modules/arguments/models/param_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          Modular.to.pushNamed('/arguments/second/',
              arguments: ParamData(text: 'ola 123'));
        },
        child: Text('Ir pra proxima pagina com parametros'),
      ),
    );
  }
}
