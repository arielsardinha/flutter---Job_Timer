import 'package:isar/isar.dart';
import 'package:job_time/app/entities/converters/project_status_converter.dart';
import 'package:job_time/app/entities/project_status.dart';
import 'package:job_time/app/entities/project_tesk.dart';

part 'project.g.dart';

@Collection()
class Project {
  @Id()
  int? id;
  late String name;
  @ProjectStatusConverter()
  late ProjectStatus status;
  final tasks = IsarLinks<ProjectTask>();
}
