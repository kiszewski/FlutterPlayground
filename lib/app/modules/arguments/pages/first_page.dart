import 'package:challenges_app/app/modules/arguments/models/param_data_model.dart';
import 'package:challenges_app/app/zoom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Modular.to.pushNamed('/arguments/second/',
                arguments: ParamData(text: 'ola 123'));
          },
          child: Text('Ir pra proxima pagina com parametros'),
        ),
        ZoomWidget(child: Text(text)),
      ],
    );
  }
}

final String text = ''' 
Lorem ipsum dolor sit amet, 
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
 Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
 sExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
''';
