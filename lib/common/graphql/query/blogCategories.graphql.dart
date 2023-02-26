import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$blogCategories {
  Query$blogCategories({
    required this.blogCategories,
    required this.$__typename,
  });

  factory Query$blogCategories.fromJson(Map<String, dynamic> json) {
    final l$blogCategories = json['blogCategories'];
    final l$$__typename = json['__typename'];
    return Query$blogCategories(
      blogCategories: Query$blogCategories$blogCategories.fromJson(
          (l$blogCategories as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$blogCategories$blogCategories blogCategories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$blogCategories = blogCategories;
    _resultData['blogCategories'] = l$blogCategories.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$blogCategories = blogCategories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$blogCategories,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$blogCategories) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$blogCategories = blogCategories;
    final lOther$blogCategories = other.blogCategories;
    if (l$blogCategories != lOther$blogCategories) {
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

extension UtilityExtension$Query$blogCategories on Query$blogCategories {
  CopyWith$Query$blogCategories<Query$blogCategories> get copyWith =>
      CopyWith$Query$blogCategories(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$blogCategories<TRes> {
  factory CopyWith$Query$blogCategories(
    Query$blogCategories instance,
    TRes Function(Query$blogCategories) then,
  ) = _CopyWithImpl$Query$blogCategories;

  factory CopyWith$Query$blogCategories.stub(TRes res) =
      _CopyWithStubImpl$Query$blogCategories;

  TRes call({
    Query$blogCategories$blogCategories? blogCategories,
    String? $__typename,
  });
  CopyWith$Query$blogCategories$blogCategories<TRes> get blogCategories;
}

class _CopyWithImpl$Query$blogCategories<TRes>
    implements CopyWith$Query$blogCategories<TRes> {
  _CopyWithImpl$Query$blogCategories(
    this._instance,
    this._then,
  );

  final Query$blogCategories _instance;

  final TRes Function(Query$blogCategories) _then;

  static const _undefined = {};

  TRes call({
    Object? blogCategories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$blogCategories(
        blogCategories: blogCategories == _undefined || blogCategories == null
            ? _instance.blogCategories
            : (blogCategories as Query$blogCategories$blogCategories),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$blogCategories$blogCategories<TRes> get blogCategories {
    final local$blogCategories = _instance.blogCategories;
    return CopyWith$Query$blogCategories$blogCategories(
        local$blogCategories, (e) => call(blogCategories: e));
  }
}

class _CopyWithStubImpl$Query$blogCategories<TRes>
    implements CopyWith$Query$blogCategories<TRes> {
  _CopyWithStubImpl$Query$blogCategories(this._res);

  TRes _res;

  call({
    Query$blogCategories$blogCategories? blogCategories,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$blogCategories$blogCategories<TRes> get blogCategories =>
      CopyWith$Query$blogCategories$blogCategories.stub(_res);
}

const documentNodeQueryblogCategories = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'blogCategories'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'blogCategories'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: IntValueNode(value: '500'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'iconSrc'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'md'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'original'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
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
                name: NameNode(value: 'description'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
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
]);
Query$blogCategories _parserFn$Query$blogCategories(
        Map<String, dynamic> data) =>
    Query$blogCategories.fromJson(data);

class Options$Query$blogCategories
    extends graphql.QueryOptions<Query$blogCategories> {
  Options$Query$blogCategories({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryblogCategories,
          parserFn: _parserFn$Query$blogCategories,
        );
}

class WatchOptions$Query$blogCategories
    extends graphql.WatchQueryOptions<Query$blogCategories> {
  WatchOptions$Query$blogCategories({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
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
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryblogCategories,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$blogCategories,
        );
}

class FetchMoreOptions$Query$blogCategories extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$blogCategories(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryblogCategories,
        );
}

extension ClientExtension$Query$blogCategories on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$blogCategories>> query$blogCategories(
          [Options$Query$blogCategories? options]) async =>
      await this.query(options ?? Options$Query$blogCategories());
  graphql.ObservableQuery<Query$blogCategories> watchQuery$blogCategories(
          [WatchOptions$Query$blogCategories? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$blogCategories());
  void writeQuery$blogCategories({
    required Query$blogCategories data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryblogCategories)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$blogCategories? readQuery$blogCategories({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryblogCategories)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$blogCategories.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$blogCategories> useQuery$blogCategories(
        [Options$Query$blogCategories? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$blogCategories());
graphql.ObservableQuery<Query$blogCategories> useWatchQuery$blogCategories(
        [WatchOptions$Query$blogCategories? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$blogCategories());

class Query$blogCategories$Widget
    extends graphql_flutter.Query<Query$blogCategories> {
  Query$blogCategories$Widget({
    widgets.Key? key,
    Options$Query$blogCategories? options,
    required graphql_flutter.QueryBuilder<Query$blogCategories> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$blogCategories(),
          builder: builder,
        );
}

class Query$blogCategories$blogCategories {
  Query$blogCategories$blogCategories({
    required this.items,
    required this.$__typename,
  });

  factory Query$blogCategories$blogCategories.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$blogCategories$blogCategories(
      items: (l$items as List<dynamic>)
          .map((e) => Query$blogCategories$blogCategories$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$blogCategories$blogCategories$items> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$blogCategories$blogCategories) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
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

extension UtilityExtension$Query$blogCategories$blogCategories
    on Query$blogCategories$blogCategories {
  CopyWith$Query$blogCategories$blogCategories<
          Query$blogCategories$blogCategories>
      get copyWith => CopyWith$Query$blogCategories$blogCategories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$blogCategories$blogCategories<TRes> {
  factory CopyWith$Query$blogCategories$blogCategories(
    Query$blogCategories$blogCategories instance,
    TRes Function(Query$blogCategories$blogCategories) then,
  ) = _CopyWithImpl$Query$blogCategories$blogCategories;

  factory CopyWith$Query$blogCategories$blogCategories.stub(TRes res) =
      _CopyWithStubImpl$Query$blogCategories$blogCategories;

  TRes call({
    List<Query$blogCategories$blogCategories$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$blogCategories$blogCategories$items> Function(
              Iterable<
                  CopyWith$Query$blogCategories$blogCategories$items<
                      Query$blogCategories$blogCategories$items>>)
          _fn);
}

class _CopyWithImpl$Query$blogCategories$blogCategories<TRes>
    implements CopyWith$Query$blogCategories$blogCategories<TRes> {
  _CopyWithImpl$Query$blogCategories$blogCategories(
    this._instance,
    this._then,
  );

  final Query$blogCategories$blogCategories _instance;

  final TRes Function(Query$blogCategories$blogCategories) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$blogCategories$blogCategories(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$blogCategories$blogCategories$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$blogCategories$blogCategories$items> Function(
                  Iterable<
                      CopyWith$Query$blogCategories$blogCategories$items<
                          Query$blogCategories$blogCategories$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Query$blogCategories$blogCategories$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$blogCategories$blogCategories<TRes>
    implements CopyWith$Query$blogCategories$blogCategories<TRes> {
  _CopyWithStubImpl$Query$blogCategories$blogCategories(this._res);

  TRes _res;

  call({
    List<Query$blogCategories$blogCategories$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$blogCategories$blogCategories$items {
  Query$blogCategories$blogCategories$items({
    required this.id,
    this.name,
    this.iconSrc,
    this.description,
    required this.$__typename,
  });

  factory Query$blogCategories$blogCategories$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$iconSrc = json['iconSrc'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Query$blogCategories$blogCategories$items(
      id: (l$id as String),
      name: (l$name as String?),
      iconSrc: l$iconSrc == null
          ? null
          : Query$blogCategories$blogCategories$items$iconSrc.fromJson(
              (l$iconSrc as Map<String, dynamic>)),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? name;

  final Query$blogCategories$blogCategories$items$iconSrc? iconSrc;

  final String? description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$iconSrc = iconSrc;
    _resultData['iconSrc'] = l$iconSrc?.toJson();
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$iconSrc = iconSrc;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$iconSrc,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$blogCategories$blogCategories$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$iconSrc = iconSrc;
    final lOther$iconSrc = other.iconSrc;
    if (l$iconSrc != lOther$iconSrc) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Query$blogCategories$blogCategories$items
    on Query$blogCategories$blogCategories$items {
  CopyWith$Query$blogCategories$blogCategories$items<
          Query$blogCategories$blogCategories$items>
      get copyWith => CopyWith$Query$blogCategories$blogCategories$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$blogCategories$blogCategories$items<TRes> {
  factory CopyWith$Query$blogCategories$blogCategories$items(
    Query$blogCategories$blogCategories$items instance,
    TRes Function(Query$blogCategories$blogCategories$items) then,
  ) = _CopyWithImpl$Query$blogCategories$blogCategories$items;

  factory CopyWith$Query$blogCategories$blogCategories$items.stub(TRes res) =
      _CopyWithStubImpl$Query$blogCategories$blogCategories$items;

  TRes call({
    String? id,
    String? name,
    Query$blogCategories$blogCategories$items$iconSrc? iconSrc,
    String? description,
    String? $__typename,
  });
  CopyWith$Query$blogCategories$blogCategories$items$iconSrc<TRes> get iconSrc;
}

class _CopyWithImpl$Query$blogCategories$blogCategories$items<TRes>
    implements CopyWith$Query$blogCategories$blogCategories$items<TRes> {
  _CopyWithImpl$Query$blogCategories$blogCategories$items(
    this._instance,
    this._then,
  );

  final Query$blogCategories$blogCategories$items _instance;

  final TRes Function(Query$blogCategories$blogCategories$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? iconSrc = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$blogCategories$blogCategories$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        iconSrc: iconSrc == _undefined
            ? _instance.iconSrc
            : (iconSrc as Query$blogCategories$blogCategories$items$iconSrc?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$blogCategories$blogCategories$items$iconSrc<TRes> get iconSrc {
    final local$iconSrc = _instance.iconSrc;
    return local$iconSrc == null
        ? CopyWith$Query$blogCategories$blogCategories$items$iconSrc.stub(
            _then(_instance))
        : CopyWith$Query$blogCategories$blogCategories$items$iconSrc(
            local$iconSrc, (e) => call(iconSrc: e));
  }
}

class _CopyWithStubImpl$Query$blogCategories$blogCategories$items<TRes>
    implements CopyWith$Query$blogCategories$blogCategories$items<TRes> {
  _CopyWithStubImpl$Query$blogCategories$blogCategories$items(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    Query$blogCategories$blogCategories$items$iconSrc? iconSrc,
    String? description,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$blogCategories$blogCategories$items$iconSrc<TRes>
      get iconSrc =>
          CopyWith$Query$blogCategories$blogCategories$items$iconSrc.stub(_res);
}

class Query$blogCategories$blogCategories$items$iconSrc {
  Query$blogCategories$blogCategories$items$iconSrc({
    this.md,
    this.original,
    required this.$__typename,
  });

  factory Query$blogCategories$blogCategories$items$iconSrc.fromJson(
      Map<String, dynamic> json) {
    final l$md = json['md'];
    final l$original = json['original'];
    final l$$__typename = json['__typename'];
    return Query$blogCategories$blogCategories$items$iconSrc(
      md: (l$md as String?),
      original: (l$original as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? md;

  final String? original;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$md = md;
    _resultData['md'] = l$md;
    final l$original = original;
    _resultData['original'] = l$original;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$md = md;
    final l$original = original;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$md,
      l$original,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$blogCategories$blogCategories$items$iconSrc) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$md = md;
    final lOther$md = other.md;
    if (l$md != lOther$md) {
      return false;
    }
    final l$original = original;
    final lOther$original = other.original;
    if (l$original != lOther$original) {
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

extension UtilityExtension$Query$blogCategories$blogCategories$items$iconSrc
    on Query$blogCategories$blogCategories$items$iconSrc {
  CopyWith$Query$blogCategories$blogCategories$items$iconSrc<
          Query$blogCategories$blogCategories$items$iconSrc>
      get copyWith =>
          CopyWith$Query$blogCategories$blogCategories$items$iconSrc(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$blogCategories$blogCategories$items$iconSrc<
    TRes> {
  factory CopyWith$Query$blogCategories$blogCategories$items$iconSrc(
    Query$blogCategories$blogCategories$items$iconSrc instance,
    TRes Function(Query$blogCategories$blogCategories$items$iconSrc) then,
  ) = _CopyWithImpl$Query$blogCategories$blogCategories$items$iconSrc;

  factory CopyWith$Query$blogCategories$blogCategories$items$iconSrc.stub(
          TRes res) =
      _CopyWithStubImpl$Query$blogCategories$blogCategories$items$iconSrc;

  TRes call({
    String? md,
    String? original,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$blogCategories$blogCategories$items$iconSrc<TRes>
    implements
        CopyWith$Query$blogCategories$blogCategories$items$iconSrc<TRes> {
  _CopyWithImpl$Query$blogCategories$blogCategories$items$iconSrc(
    this._instance,
    this._then,
  );

  final Query$blogCategories$blogCategories$items$iconSrc _instance;

  final TRes Function(Query$blogCategories$blogCategories$items$iconSrc) _then;

  static const _undefined = {};

  TRes call({
    Object? md = _undefined,
    Object? original = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$blogCategories$blogCategories$items$iconSrc(
        md: md == _undefined ? _instance.md : (md as String?),
        original:
            original == _undefined ? _instance.original : (original as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$blogCategories$blogCategories$items$iconSrc<TRes>
    implements
        CopyWith$Query$blogCategories$blogCategories$items$iconSrc<TRes> {
  _CopyWithStubImpl$Query$blogCategories$blogCategories$items$iconSrc(
      this._res);

  TRes _res;

  call({
    String? md,
    String? original,
    String? $__typename,
  }) =>
      _res;
}
