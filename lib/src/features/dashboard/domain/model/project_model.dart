import 'package:trigger_app/imports_bindings.dart';

/// Represents a project in the application
@immutable
class ProjectModel {
  /// Creates a new instance of [ProjectModel]
  ///
  /// [name] is the project's name
  /// [description] is the project's description
  /// [collections] is a list of API collections in the project
  const ProjectModel({
    required this.name,
    required this.description,
    required this.collections,
  });

  /// Creates a [ProjectModel] from a Map structure
  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      name: map['name'] as String,
      description: map['description'] as String,
      collections: List<CollectionModel>.from(
        (map['collections'] as List).map<CollectionModel>(
          (x) => CollectionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final String name;
  final String description;
  final List<CollectionModel> collections;

  ProjectModel copyWith({
    String? name,
    String? description,
    List<CollectionModel>? collections,
  }) {
    return ProjectModel(
      name: name ?? this.name,
      description: description ?? this.description,
      collections: collections ?? this.collections,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'collections': collections.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ProjectModel(name: $name, description: $description, collections: $collections)';

  @override
  bool operator ==(covariant ProjectModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.description == description && listEquals(other.collections, collections);
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ collections.hashCode;
}
