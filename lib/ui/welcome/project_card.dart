import 'package:flutter/material.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    required this.project,
    Key? key,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FlutterWebBrowser.openWebPage(url: project.url),
        child: Card(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 6,
                child: AspectRatio(
                  aspectRatio: 16 / 6,
                  child: Image.network(
                    project.imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              ListTile(
                title: Text(project.name),
                subtitle: Text(project.description),
              ),
            ],
          ),
        ),
      );
}
