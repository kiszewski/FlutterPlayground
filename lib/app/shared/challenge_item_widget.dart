import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChallengeItemWidget extends StatelessWidget {
  final String name;
  final String route;

  const ChallengeItemWidget({
    Key? key,
    required this.name,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(Colors.yellow),
        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
      ),
      onPressed: () {
        Modular.to.pushNamed(route);
      },
      child: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
