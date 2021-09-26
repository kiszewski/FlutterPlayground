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
    return GestureDetector(
      onTap: () {
        Modular.to.navigate(route);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [Text(name)],
        ),
      ),
    );
  }
}
