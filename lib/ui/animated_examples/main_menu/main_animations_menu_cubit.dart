import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_animations_menu_state.dart';
part 'main_animations_menu_cubit.freezed.dart';

class MainAnimationsMenuCubit extends Cubit<MainAnimationsMenuState> {
  MainAnimationsMenuCubit() : super(const MainAnimationsMenuState.initial());
}
