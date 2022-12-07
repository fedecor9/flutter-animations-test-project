import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'implicit_animations_state.dart';
part 'implicit_animations_cubit.freezed.dart';

class ImplicitAnimationsCubit extends Cubit<ImplicitAnimationsState> {
  ImplicitAnimationsCubit()
      : super(const ImplicitAnimationsState.initial(test: '1'));
}
