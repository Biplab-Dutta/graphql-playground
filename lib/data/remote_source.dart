import 'dart:developer';

import 'package:gql_demo/data/queries.dart';
import 'package:gql_demo/model/todo.dart';
import 'package:graphql/client.dart';

class RemoteSource {
  RemoteSource(GraphQLClient client) : _client = client;

  final GraphQLClient _client;

  final options = QueryOptions(document: gql(queryString));

  Future<List<Todo>> getTodos() async {
    final response = await _client.query(options);
    if (response.hasException) {
      log(response.exception.toString());
    }
    log(response.data.toString());
    final result = (response.data?['todos'] as List)
        .map((todo) => todo as Map<String, dynamic>)
        .toList();

    final x = result.map((e) => Todo.fromJson(e)).toList();
    log(x.toString());
    return x;
  }
}
