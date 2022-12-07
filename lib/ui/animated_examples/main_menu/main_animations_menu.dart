import 'package:flutter/material.dart';

class AnimationsMenu extends StatelessWidget {
  const AnimationsMenu({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Animations menu'),
        ),
        body: Column(
          children: [
            MaterialButton(
              onPressed: () {},
              child: const Text('Particles effect'),
            ),
          ],
        ),
      );
}
