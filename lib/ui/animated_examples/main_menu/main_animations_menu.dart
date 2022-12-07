import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/animated_examples/main_menu/main_animations_menu_cubit.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';

class AnimationsMenu extends StatelessWidget {
  const AnimationsMenu({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MainAnimationsMenuCubit(),
        child: const _MenuContent(),
      );
}

class _MenuContent extends StatelessWidget {
  const _MenuContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MainAnimationsMenuCubit, MainAnimationsMenuState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Animations menu'),
          ),
          body: GridView.count(
            crossAxisCount: 3,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: context.theme.colors.primary,
                  onPressed: context
                      .read<MainAnimationsMenuCubit>()
                      .goToParticlesEffect,
                  child: Center(
                    child: Text(
                      'Particles effect',
                      style: context.theme.textStyles.bodyMedium!
                          .copyWith(color: Colors.white, fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
