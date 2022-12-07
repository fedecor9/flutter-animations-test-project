import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/common/animated_drop_simple_animation.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/error_handler_cubit.dart';

import 'package:flutter_template/ui/signin/signin_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SignInCubit(context.read<ErrorHandlerCubit>()),
        child: _SignInContentScreen(),
      );
}

class _SignInContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SignInCubit, SignInBaseState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(context.localizations.sign_in),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SignInForm(),
              if (context.read<SignInCubit>().state.error.isNotEmpty)
                Text(
                  context.localizations
                      .error(context.read<SignInCubit>().state.error),
                ),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: () => context.read<SignInCubit>().signIn(),
                child: Text(context.localizations.sign_in),
              ),
              SizedBox(height: 200.h),
            ],
          ),
        ),
      );
}

class _SignInForm extends StatefulWidget {
  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  late SignInCubit _signInCubit;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _signInCubit = context.read<SignInCubit>();
    _emailTextController.text = _signInCubit.state.email ?? '';
    _passwordTextController.text = _signInCubit.state.password ?? '';
  }

  @override
  Widget build(BuildContext context) => SimpleAnimationsDrop(
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _emailTextController,
                onChanged: (String text) => _signInCubit.changeEmail(text),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: context.localizations.mail,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                controller: _passwordTextController,
                onChanged: (String password) =>
                    _signInCubit.changePassword(password),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: context.localizations.password,
                ),
              ),
            ),
          ],
        ),
      );
}
