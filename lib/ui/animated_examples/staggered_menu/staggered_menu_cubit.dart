import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staggered_menu_state.dart';
part 'staggered_menu_cubit.freezed.dart';

class StaggeredMenuCubit extends Cubit<StaggeredMenuState> {
  StaggeredMenuCubit() : super(StaggeredMenuState.initial());
}
