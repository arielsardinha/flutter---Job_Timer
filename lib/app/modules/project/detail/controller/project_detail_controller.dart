import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_time/app/data/service/projects/project_service.dart';

import 'package:job_time/app/view_models.dart/project_model.dart';

part 'project_detail_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {
  final ProjectService _projectService;
  ProjectDetailController({required ProjectService projectService})
      : _projectService = projectService,
        super(const ProjectDetailState.initial());

  void setProject(ProjectModel projectModel) {
    emit(state.copyWidth(
        projectModel: projectModel, status: ProjectDetailStatus.complete));
  }

  Future<void> updateProject() async {
    final project = await _projectService.findById(state.projectModel!.id!);
    emit(state.copyWidth(
        projectModel: project, status: ProjectDetailStatus.complete));
  }

  Future<void> finishProject() async {
    try {
      emit(state.copyWidth(status: ProjectDetailStatus.loading));

      final projectId = state.projectModel!.id!;
      await _projectService.finish(projectId);
      updateProject();
    } catch (e) {
      emit(state.copyWidth(status: ProjectDetailStatus.failure));
    }
  }
}
