import 'package:trigger_app/imports_bindings.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

/// Cubit that manages the dashboard state and operations
class DashboardCubit extends HydratedCubit<DashboardState> {
  /// Creates a new instance of [DashboardCubit]
  DashboardCubit() : super(const DashboardState());

  /// Creates a new project and adds it to the state
  ///
  /// [project] is the new project to be added
  void createProject(ProjectModel project) {
    emit(
      state.copyWith(
        projects: [...state.projects, project],
      ),
    );
  }

  /// Updates an existing project at the specified index
  ///
  /// [project] is the updated project
  /// [index] is the position of the project to update
  void updateProject(ProjectModel project, int index) {
    final currentProjects = [...state.projects];
    currentProjects[index] = project;
    emit(state.copyWith(projects: currentProjects));
  }

  /// Deletes a project at the specified index
  ///
  /// [index] is the position of the project to delete
  void deleteProject(int index) {
    final projects = [...state.projects]..removeAt(index);
    emit(state.copyWith(projects: projects));
  }

  /// Converts JSON to [DashboardState]
  @override
  DashboardState? fromJson(Map<String, dynamic> json) {
    try {
      final projects = (json['projects'] as List).map((project) => ProjectModel.fromMap(project as Map<String, dynamic>)).toList();
      return DashboardState(projects: projects);
    } catch (e) {
      return null;
    }
  }

  /// Converts [DashboardState] to JSON
  @override
  Map<String, dynamic>? toJson(DashboardState state) {
    return {
      // 'navIndex': state.navIndex,
      'projects': state.projects.map((project) => project.toMap()).toList(),
    };
  }
}
