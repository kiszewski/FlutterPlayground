import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GreenPage extends StatelessWidget {
  const GreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App test'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                Modular.to.navigate('/clock_timer');
              },
              child: Text('Voltar')),
          Container(
            width: 150,
            height: 150,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
