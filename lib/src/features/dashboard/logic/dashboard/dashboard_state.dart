part of 'dashboard_cubit.dart';

/// State class for the Dashboard feature that manages navigation and projects
@freezed
class DashboardState with _$DashboardState {
  /// Creates a new instance of [DashboardState]
  ///
  /// [navIndex] represents the current navigation index in the dashboard
  /// [projects] contains the list of user's projects
  const factory DashboardState({
    @Default(0) int navIndex,
    @Default([]) List<ProjectModel> projects,
  }) = _DashboardState;
}
