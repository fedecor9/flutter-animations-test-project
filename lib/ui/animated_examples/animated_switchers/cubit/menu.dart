import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/animated_examples/animated_switchers/cubit/menu_cubit.dart';
import 'package:flutter_template/ui/animated_examples/main_menu/main_animations_menu.dart';

class AnimatedSwitcherMenu extends StatelessWidget {
  const AnimatedSwitcherMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MenuCubit(),
        child: BlocBuilder<MenuCubit, MenuState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: const Text('Animated Switcher examples menu'),
            ),
            body: Center(
              child: Container(
                margin: EdgeInsets.all(10.sp),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  children: [
                    Button(
                      text: 'Advanced',
                      onPressed: context.read<MenuCubit>().goToAdvancedExample,
                    ),
                    Button(
                      text: 'Basic',
                      onPressed: context.read<MenuCubit>().goToBasicExample,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
