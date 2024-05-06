import '../../fragments/generated/PostFragment.graphql.dart';
import '../../fragments/generated/UserFragment.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryGetPosts {
  QueryGetPosts({
    this.posts,
    this.$__typename = 'Query',
  });

  factory QueryGetPosts.fromJson(Map<String, dynamic> json) {
    final l$posts = json['posts'];
    final l$$__typename = json['__typename'];
    return QueryGetPosts(
      posts: l$posts == null
          ? null
          : QueryGetPostsposts.fromJson((l$posts as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryGetPostsposts? posts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$posts = posts;
    _resultData['posts'] = l$posts?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$posts = posts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$posts,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is QueryGetPosts) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$posts = posts;
    final lOther$posts = other.posts;
    if (l$posts != lOther$posts) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtensionQueryGetPosts on QueryGetPosts {
  CopyWithQueryGetPosts<QueryGetPosts> get copyWith => CopyWithQueryGetPosts(
        this,
        (i) => i,
      );
}

abstract class CopyWithQueryGetPosts<TRes> {
  factory CopyWithQueryGetPosts(
    QueryGetPosts instance,
    TRes Function(QueryGetPosts) then,
  ) = _CopyWithImplQueryGetPosts;

  factory CopyWithQueryGetPosts.stub(TRes res) = _CopyWithStubImplQueryGetPosts;

  TRes call({
    QueryGetPostsposts? posts,
    String? $__typename,
  });
  CopyWithQueryGetPostsposts<TRes> get posts;
}

class _CopyWithImplQueryGetPosts<TRes> implements CopyWithQueryGetPosts<TRes> {
  _CopyWithImplQueryGetPosts(
    this._instance,
    this._then,
  );

  final QueryGetPosts _instance;

  final TRes Function(QueryGetPosts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? posts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(QueryGetPosts(
        posts: posts == _undefined
            ? _instance.posts
            : (posts as QueryGetPostsposts?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWithQueryGetPostsposts<TRes> get posts {
    final local$posts = _instance.posts;
    return local$posts == null
        ? CopyWithQueryGetPostsposts.stub(_then(_instance))
        : CopyWithQueryGetPostsposts(local$posts, (e) => call(posts: e));
  }
}

class _CopyWithStubImplQueryGetPosts<TRes>
    implements CopyWithQueryGetPosts<TRes> {
  _CopyWithStubImplQueryGetPosts(this._res);

  TRes _res;

  call({
    QueryGetPostsposts? posts,
    String? $__typename,
  }) =>
      _res;

  CopyWithQueryGetPostsposts<TRes> get posts =>
      CopyWithQueryGetPostsposts.stub(_res);
}

const documentNodeQueryGetPosts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetPosts'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'posts'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'nodes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'PostFragment'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionPostFragment,
  fragmentDefinitionUserFragment,
]);
QueryGetPosts _parserFnQueryGetPosts(Map<String, dynamic> data) =>
    QueryGetPosts.fromJson(data);
typedef OnQueryCompleteQueryGetPosts = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryGetPosts?,
);

class OptionsQueryGetPosts extends graphql.QueryOptions<QueryGetPosts> {
  OptionsQueryGetPosts({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryGetPosts? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryGetPosts? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFnQueryGetPosts(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetPosts,
          parserFn: _parserFnQueryGetPosts,
        );

  final OnQueryCompleteQueryGetPosts? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptionsQueryGetPosts
    extends graphql.WatchQueryOptions<QueryGetPosts> {
  WatchOptionsQueryGetPosts({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryGetPosts? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetPosts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFnQueryGetPosts,
        );
}

class FetchMoreOptionsQueryGetPosts extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryGetPosts({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetPosts,
        );
}

extension ClientExtensionQueryGetPosts on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryGetPosts>> queryGetPosts(
          [OptionsQueryGetPosts? options]) async =>
      await this.query(options ?? OptionsQueryGetPosts());
  graphql.ObservableQuery<QueryGetPosts> watchQueryGetPosts(
          [WatchOptionsQueryGetPosts? options]) =>
      this.watchQuery(options ?? WatchOptionsQueryGetPosts());
  void writeQueryGetPosts({
    required QueryGetPosts data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryGetPosts)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  QueryGetPosts? readQueryGetPosts({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetPosts)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryGetPosts.fromJson(result);
  }
}

class QueryGetPostsposts {
  QueryGetPostsposts({
    required this.nodes,
    this.$__typename = 'PostConnection',
  });

  factory QueryGetPostsposts.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$$__typename = json['__typename'];
    return QueryGetPostsposts(
      nodes: (l$nodes as List<dynamic>)
          .map((e) =>
              QueryGetPostspostsnodes.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryGetPostspostsnodes> nodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$nodes = nodes;
    _resultData['nodes'] = l$nodes.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$nodes = nodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$nodes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is QueryGetPostsposts) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodes = nodes;
    final lOther$nodes = other.nodes;
    if (l$nodes.length != lOther$nodes.length) {
      return false;
    }
    for (int i = 0; i < l$nodes.length; i++) {
      final l$nodes$entry = l$nodes[i];
      final lOther$nodes$entry = lOther$nodes[i];
      if (l$nodes$entry != lOther$nodes$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtensionQueryGetPostsposts on QueryGetPostsposts {
  CopyWithQueryGetPostsposts<QueryGetPostsposts> get copyWith =>
      CopyWithQueryGetPostsposts(
        this,
        (i) => i,
      );
}

abstract class CopyWithQueryGetPostsposts<TRes> {
  factory CopyWithQueryGetPostsposts(
    QueryGetPostsposts instance,
    TRes Function(QueryGetPostsposts) then,
  ) = _CopyWithImplQueryGetPostsposts;

  factory CopyWithQueryGetPostsposts.stub(TRes res) =
      _CopyWithStubImplQueryGetPostsposts;

  TRes call({
    List<QueryGetPostspostsnodes>? nodes,
    String? $__typename,
  });
  TRes nodes(
      Iterable<QueryGetPostspostsnodes> Function(
              Iterable<
                  CopyWithQueryGetPostspostsnodes<QueryGetPostspostsnodes>>)
          _fn);
}

class _CopyWithImplQueryGetPostsposts<TRes>
    implements CopyWithQueryGetPostsposts<TRes> {
  _CopyWithImplQueryGetPostsposts(
    this._instance,
    this._then,
  );

  final QueryGetPostsposts _instance;

  final TRes Function(QueryGetPostsposts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(QueryGetPostsposts(
        nodes: nodes == _undefined || nodes == null
            ? _instance.nodes
            : (nodes as List<QueryGetPostspostsnodes>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes nodes(
          Iterable<QueryGetPostspostsnodes> Function(
                  Iterable<
                      CopyWithQueryGetPostspostsnodes<QueryGetPostspostsnodes>>)
              _fn) =>
      call(
          nodes: _fn(_instance.nodes.map((e) => CopyWithQueryGetPostspostsnodes(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImplQueryGetPostsposts<TRes>
    implements CopyWithQueryGetPostsposts<TRes> {
  _CopyWithStubImplQueryGetPostsposts(this._res);

  TRes _res;

  call({
    List<QueryGetPostspostsnodes>? nodes,
    String? $__typename,
  }) =>
      _res;

  nodes(_fn) => _res;
}

class QueryGetPostspostsnodes {
  QueryGetPostspostsnodes({required this.$__typename});

  factory QueryGetPostspostsnodes.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Post":
        return QueryGetPostspostsnodesPost.fromJson(json);

      case "RemovedPost":
        return QueryGetPostspostsnodesRemovedPost.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return QueryGetPostspostsnodes($__typename: (l$$__typename as String));
    }
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is QueryGetPostspostsnodes) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtensionQueryGetPostspostsnodes on QueryGetPostspostsnodes {
  CopyWithQueryGetPostspostsnodes<QueryGetPostspostsnodes> get copyWith =>
      CopyWithQueryGetPostspostsnodes(
        this,
        (i) => i,
      );
  _T when<_T>({
    required _T Function(QueryGetPostspostsnodesPost) post,
    required _T Function(QueryGetPostspostsnodesRemovedPost) removedPost,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Post":
        return post(this as QueryGetPostspostsnodesPost);

      case "RemovedPost":
        return removedPost(this as QueryGetPostspostsnodesRemovedPost);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(QueryGetPostspostsnodesPost)? post,
    _T Function(QueryGetPostspostsnodesRemovedPost)? removedPost,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Post":
        if (post != null) {
          return post(this as QueryGetPostspostsnodesPost);
        } else {
          return orElse();
        }

      case "RemovedPost":
        if (removedPost != null) {
          return removedPost(this as QueryGetPostspostsnodesRemovedPost);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWithQueryGetPostspostsnodes<TRes> {
  factory CopyWithQueryGetPostspostsnodes(
    QueryGetPostspostsnodes instance,
    TRes Function(QueryGetPostspostsnodes) then,
  ) = _CopyWithImplQueryGetPostspostsnodes;

  factory CopyWithQueryGetPostspostsnodes.stub(TRes res) =
      _CopyWithStubImplQueryGetPostspostsnodes;

  TRes call({String? $__typename});
}

class _CopyWithImplQueryGetPostspostsnodes<TRes>
    implements CopyWithQueryGetPostspostsnodes<TRes> {
  _CopyWithImplQueryGetPostspostsnodes(
    this._instance,
    this._then,
  );

  final QueryGetPostspostsnodes _instance;

  final TRes Function(QueryGetPostspostsnodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(QueryGetPostspostsnodes(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImplQueryGetPostspostsnodes<TRes>
    implements CopyWithQueryGetPostspostsnodes<TRes> {
  _CopyWithStubImplQueryGetPostspostsnodes(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class QueryGetPostspostsnodesPost
    implements FragmentPostFragment, QueryGetPostspostsnodes {
  QueryGetPostspostsnodesPost({
    required this.id,
    required this.title,
    required this.body,
    required this.createdBy,
    this.$__typename = 'Post',
  });

  factory QueryGetPostspostsnodesPost.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$createdBy = json['createdBy'];
    final l$$__typename = json['__typename'];
    return QueryGetPostspostsnodesPost(
      id: (l$id as String),
      title: (l$title as String),
      body: (l$body as String),
      createdBy:
          FragmentUserFragment.fromJson((l$createdBy as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String body;

  final FragmentUserFragment createdBy;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$createdBy = createdBy;
    _resultData['createdBy'] = l$createdBy.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$body = body;
    final l$createdBy = createdBy;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$body,
      l$createdBy,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is QueryGetPostspostsnodesPost) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$createdBy = createdBy;
    final lOther$createdBy = other.createdBy;
    if (l$createdBy != lOther$createdBy) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtensionQueryGetPostspostsnodesPost
    on QueryGetPostspostsnodesPost {
  CopyWithQueryGetPostspostsnodesPost<QueryGetPostspostsnodesPost>
      get copyWith => CopyWithQueryGetPostspostsnodesPost(
            this,
            (i) => i,
          );
}

abstract class CopyWithQueryGetPostspostsnodesPost<TRes> {
  factory CopyWithQueryGetPostspostsnodesPost(
    QueryGetPostspostsnodesPost instance,
    TRes Function(QueryGetPostspostsnodesPost) then,
  ) = _CopyWithImplQueryGetPostspostsnodesPost;

  factory CopyWithQueryGetPostspostsnodesPost.stub(TRes res) =
      _CopyWithStubImplQueryGetPostspostsnodesPost;

  TRes call({
    String? id,
    String? title,
    String? body,
    FragmentUserFragment? createdBy,
    String? $__typename,
  });
  CopyWithFragmentUserFragment<TRes> get createdBy;
}

class _CopyWithImplQueryGetPostspostsnodesPost<TRes>
    implements CopyWithQueryGetPostspostsnodesPost<TRes> {
  _CopyWithImplQueryGetPostspostsnodesPost(
    this._instance,
    this._then,
  );

  final QueryGetPostspostsnodesPost _instance;

  final TRes Function(QueryGetPostspostsnodesPost) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? body = _undefined,
    Object? createdBy = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(QueryGetPostspostsnodesPost(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        body: body == _undefined || body == null
            ? _instance.body
            : (body as String),
        createdBy: createdBy == _undefined || createdBy == null
            ? _instance.createdBy
            : (createdBy as FragmentUserFragment),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWithFragmentUserFragment<TRes> get createdBy {
    final local$createdBy = _instance.createdBy;
    return CopyWithFragmentUserFragment(
        local$createdBy, (e) => call(createdBy: e));
  }
}

class _CopyWithStubImplQueryGetPostspostsnodesPost<TRes>
    implements CopyWithQueryGetPostspostsnodesPost<TRes> {
  _CopyWithStubImplQueryGetPostspostsnodesPost(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? body,
    FragmentUserFragment? createdBy,
    String? $__typename,
  }) =>
      _res;

  CopyWithFragmentUserFragment<TRes> get createdBy =>
      CopyWithFragmentUserFragment.stub(_res);
}

class QueryGetPostspostsnodesRemovedPost implements QueryGetPostspostsnodes {
  QueryGetPostspostsnodesRemovedPost({this.$__typename = 'RemovedPost'});

  factory QueryGetPostspostsnodesRemovedPost.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return QueryGetPostspostsnodesRemovedPost(
        $__typename: (l$$__typename as String));
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is QueryGetPostspostsnodesRemovedPost) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtensionQueryGetPostspostsnodesRemovedPost
    on QueryGetPostspostsnodesRemovedPost {
  CopyWithQueryGetPostspostsnodesRemovedPost<QueryGetPostspostsnodesRemovedPost>
      get copyWith => CopyWithQueryGetPostspostsnodesRemovedPost(
            this,
            (i) => i,
          );
}

abstract class CopyWithQueryGetPostspostsnodesRemovedPost<TRes> {
  factory CopyWithQueryGetPostspostsnodesRemovedPost(
    QueryGetPostspostsnodesRemovedPost instance,
    TRes Function(QueryGetPostspostsnodesRemovedPost) then,
  ) = _CopyWithImplQueryGetPostspostsnodesRemovedPost;

  factory CopyWithQueryGetPostspostsnodesRemovedPost.stub(TRes res) =
      _CopyWithStubImplQueryGetPostspostsnodesRemovedPost;

  TRes call({String? $__typename});
}

class _CopyWithImplQueryGetPostspostsnodesRemovedPost<TRes>
    implements CopyWithQueryGetPostspostsnodesRemovedPost<TRes> {
  _CopyWithImplQueryGetPostspostsnodesRemovedPost(
    this._instance,
    this._then,
  );

  final QueryGetPostspostsnodesRemovedPost _instance;

  final TRes Function(QueryGetPostspostsnodesRemovedPost) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(QueryGetPostspostsnodesRemovedPost(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImplQueryGetPostspostsnodesRemovedPost<TRes>
    implements CopyWithQueryGetPostspostsnodesRemovedPost<TRes> {
  _CopyWithStubImplQueryGetPostspostsnodesRemovedPost(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}
