import 'package:job_time/app/data/repositories/projects/project_repository.dart';
import 'package:job_time/app/data/service/projects/project_service.dart';
import 'package:job_time/app/entities/project.dart';
import 'package:job_time/app/entities/project_status.dart';
import 'package:job_time/app/view_models.dart/project_model.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepository _projectRepository;

  ProjectServiceImpl({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project();

    project
      ..id = projectModel.id
      ..name = projectModel.name
      ..status = projectModel.status
      ..estimate = projectModel.estimate;

    await _projectRepository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatus status) async {
    final projects = await _projectRepository.findByStatus(status);

    return projects.map(ProjectModel.fromEntity).toList();
  }
}
