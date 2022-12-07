import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'particle_effect_state.dart';
part 'particle_effect_cubit.freezed.dart';

class ParticleEffectCubit extends Cubit<ParticleEffectState> {
  ParticleEffectCubit() : super(const ParticleEffectState.initial());
}
