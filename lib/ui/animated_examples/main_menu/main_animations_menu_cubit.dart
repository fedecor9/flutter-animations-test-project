import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/ui/app_router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_animations_menu_state.dart';
part 'main_animations_menu_cubit.freezed.dart';

class MainAnimationsMenuCubit extends Cubit<MainAnimationsMenuState> {
  final AppRouter _router = DiProvider.get();

  MainAnimationsMenuCubit() : super(const MainAnimationsMenuState.initial());

  void goToParticlesEffect() {
    _router.topMostRouter().navigate(const ParticlesCanvasRoute());
  }

  void goToStaggeredAnimations() {
    _router.topMostRouter().navigate(const StaggeredMenuRoute());
  }

  void goToImplicitAnimations() {
    _router.topMostRouter().navigate(const ImplicitAnimationsScreenRoute());
  }

  void goToTest() {
    _router.topMostRouter().navigate(TestWidgetRoute());
  }

  void goToHome() {
    _router.navigate(const WelcomeScreenRoute());
  }
}
