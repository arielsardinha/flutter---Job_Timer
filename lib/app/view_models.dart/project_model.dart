import 'package:job_time/app/entities/project.dart';
import 'package:job_time/app/entities/project_status.dart';
import 'package:job_time/app/view_models.dart/project_task_model.dart';

class ProjectModel {
  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;

  ProjectModel(
      {this.id,
      required this.name,
      required this.estimate,
      required this.status,
      required this.tasks});

  factory ProjectModel.fromEntity(Project project) {
    project.tasks.loadSync();

    return ProjectModel(
        name: project.name,
        estimate: project.estimate,
        status: project.status,
        tasks:
            project.tasks.map((e) => ProjectTaskModel.fromEntity(e)).toList(),
        id: project.id);
  }
}
