import 'package:flutter/material.dart';
import 'package:job_time/app/core/ui/job_time_icons.dart';
import 'package:job_time/app/modules/project/register/widgets/project_detail_appbar.dart';
import 'package:job_time/app/modules/project/register/widgets/project_pe_char.dart';
import 'package:job_time/app/modules/project/register/widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectDetailAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: ProjectPieChart(),
                ),
                ProjectTaskTile(),
                ProjectTaskTile(),
                ProjectTaskTile(),
                ProjectTaskTile(),
                ProjectTaskTile(),
                ProjectTaskTile(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    JobTimeIcons.ok_circled2,
                  ),
                  label: const Text('Finalizar Projeto'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
