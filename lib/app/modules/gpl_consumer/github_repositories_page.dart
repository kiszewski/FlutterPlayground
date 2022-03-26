import 'package:challenges_app/app/modules/gpl_consumer/gpl_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GithubRepositoriesPage extends StatefulWidget {
  const GithubRepositoriesPage({Key? key}) : super(key: key);

  @override
  State<GithubRepositoriesPage> createState() => _GithubRepositoriesPageState();
}

class _GithubRepositoriesPageState extends State<GithubRepositoriesPage> {
  late final GplClient client;

  @override
  Widget build(BuildContext context) {
    GplClient client = Modular.get();
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      child: FutureBuilder(
          future: client.getRepositories(),
          builder: (context, snapshot) {
            return Container(
              child: Text('snapshot.data.toString()'),
            );
          }),
    );
  }
}
