import 'package:trigger_app/imports_bindings.dart';

/// Represents a collection of related APIs
@immutable
class CollectionModel {
  /// Creates a new instance of [CollectionModel]
  ///
  /// [name] is the name of the collection
  /// [apis] is the list of APIs in this collection
  const CollectionModel({
    required this.name,
    required this.apis,
  });

  factory CollectionModel.fromMap(Map<String, dynamic> map) {
    return CollectionModel(
      name: map['name'] as String,
      apis: List<ApiModel>.from(
        (map['apis'] as List<int>).map<ApiModel>(
          (x) => ApiModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory CollectionModel.fromJson(String source) => CollectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  /// The name of the collection
  final String name;

  /// List of APIs in this collection
  final List<ApiModel> apis;

  CollectionModel copyWith({
    String? name,
    List<ApiModel>? apis,
  }) {
    return CollectionModel(
      name: name ?? this.name,
      apis: apis ?? this.apis,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'apis': apis.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CollectionModel(name: $name, apis: $apis)';

  @override
  bool operator ==(covariant CollectionModel other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.apis, apis);
  }

  @override
  int get hashCode => name.hashCode ^ apis.hashCode;
}
