import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/ui/app_router.dart';
import 'package:flutter_template/ui/final_demo/home/home.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  final AppRouter _router = DiProvider.get();

  void goToImageDetails(Places place) =>
      _router.topMostRouter().navigate(CardDetailsScreenRoute(place: place));
}
