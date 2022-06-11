part of 'project_detail_controller.dart';

enum ProjectDetailStatus { initial, loading, complete, failure }

class ProjectDetailState extends Equatable {
  final ProjectDetailStatus status;
  final ProjectModel? projectModel;

  const ProjectDetailState._({this.projectModel, required this.status});

  const ProjectDetailState.initial()
      : this._(status: ProjectDetailStatus.initial);

  ProjectDetailState copyWidth(
      {ProjectDetailStatus? status, ProjectModel? projectModel}) {
    return ProjectDetailState._(
      status: status ?? this.status,
      projectModel: projectModel ?? this.projectModel,
    );
  }

  @override
  List<Object?> get props => [status, projectModel];
}
