import 'package:job_time/app/entities/project_tesk.dart';

class ProjectTaskModel {
  int? id;
  String name;
  int duration;

  ProjectTaskModel(
      {required this.id, required this.name, required this.duration});

  factory ProjectTaskModel.fromEntity(ProjectTask task) {
    return ProjectTaskModel(
        id: task.id, name: task.name, duration: task.duration);
  }
}
