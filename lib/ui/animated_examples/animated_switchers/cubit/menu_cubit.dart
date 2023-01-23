import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/ui/app_router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.dart';
part 'menu_cubit.freezed.dart';

class MenuCubit extends Cubit<MenuState> {
  final AppRouter _router = DiProvider.get();

  MenuCubit() : super(const MenuState.initial());

  void goToAdvancedExample() {
    _router.topMostRouter().navigate(const AdvancedAnimatedSwitcherRoute());
  }

  void goToBasicExample() {
    _router.topMostRouter().navigate(const BasicAnimatedSwitcherRoute());
  }
}
