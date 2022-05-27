import 'package:flutter/material.dart';
import 'package:gql_demo/data/remote_source.dart';
import 'package:graphql/client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RemoteSource(
      GraphQLClient(
        link: HttpLink('https://api.mocki.io/v2/c4d7a195/graphql'),
        cache: GraphQLCache(),
      ),
    ).getTodos();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(),
    );
  }
}
