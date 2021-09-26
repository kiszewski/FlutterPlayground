import 'package:challenges_app/home_controller.dart';
import 'package:flutter/material.dart';

class ChallengeItemWidget extends StatelessWidget {
  final String name;
  final Widget page;
  final HomeController controller;
  const ChallengeItemWidget(
      {Key? key,
      required this.name,
      required this.page,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.setBody(page);
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
