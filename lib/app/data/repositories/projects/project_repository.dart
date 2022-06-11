import 'package:job_time/app/entities/project.dart';
import 'package:job_time/app/entities/project_status.dart';
import 'package:job_time/app/entities/project_tesk.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);

  Future<List<Project>> findByStatus(ProjectStatus status);

  Future<Project> findById(int projectId);

  Future<Project> addTask(int projectId, ProjectTask task);

  Future<void> finish(int projectId);
}
