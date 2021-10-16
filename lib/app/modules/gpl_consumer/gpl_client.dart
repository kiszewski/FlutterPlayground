import 'package:graphql/client.dart';

class GplClient {
  late final _httpLink;
  late final _authLink;
  late final GraphQLClient _client;
  GplClient() {
    _httpLink = HttpLink('https://api.github.com/graphql');
    _authLink = AuthLink(
      getToken: () async => 'Bearer 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',
    );
    Link _link = _authLink.concat(_httpLink);
    _client = GraphQLClient(cache: GraphQLCache(), link: _link);
  }

  static const String readRepositories = r'''
  query ReadRepositories($nRepositories: Int!) {
    viewer {
      repositories(last: $nRepositories) {
        nodes {
          __typename
          id
          name
          viewerHasStarred
        }
      }
    }
  }
''';

  static const int nRepositories = 50;

  final QueryOptions options = QueryOptions(
    document: gql(readRepositories),
    variables: <String, dynamic>{
      'nRepositories': nRepositories,
    },
  );

  Future<List<dynamic>> getRepositories() async {
    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    } else {
      final List<dynamic> repositories =
          result.data?['viewer']['repositories']['nodes'] as List<dynamic>;
    }

    return result.data?['viewer']['repositories']['nodes'] as List<dynamic>;
  }
}
