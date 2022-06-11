import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_time/app/modules/project/detail/project_detail_page.dart';

class ProjectDetailModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ProjectDetailPage(),
        )
      ];
}
