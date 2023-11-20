import 'package:common/config.dart';
import 'package:graphql/client.dart';

abstract class GQLClient {
  Future<QueryResult<T>> query<T>(QueryOptions<T> options);
  ObservableQuery<T> watchQuery<T>(WatchQueryOptions<T> options);
  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options);
}

class GQLClientImpl implements GQLClient {
  factory GQLClientImpl() {
    final httpLink = HttpLink(Config.serverUrl);
    final authLink = AuthLink(
      getToken: () async => 'Bearer ${Config.accessToken}',
    );
    final link = Link.from([authLink, httpLink]);

    return GQLClientImpl._(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
        defaultPolicies: DefaultPolicies(
          query: Policies.safe(
            FetchPolicy.cacheAndNetwork,
            ErrorPolicy.none,
            CacheRereadPolicy.mergeOptimistic,
          ),
        ),
      ),
    );
  }

  const GQLClientImpl._(this._client);

  final GraphQLClient _client;

  @override
  Future<QueryResult<T>> query<T>(QueryOptions<T> options) {
    return _client.query(options);
  }

  @override
  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options) {
    return _client.mutate(options);
  }

  @override
  ObservableQuery<T> watchQuery<T>(WatchQueryOptions<T> options) {
    return _client.watchQuery(options);
  }
}
