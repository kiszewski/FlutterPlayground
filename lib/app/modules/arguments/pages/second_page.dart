import 'package:challenges_app/app/modules/arguments/models/param_data_model.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final ParamData data;
  const SecondPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(data.text));
  }
}
