import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_details_state.dart';
part 'card_details_cubit.freezed.dart';

class CardDetailsCubit extends Cubit<CardDetailsState> {
  CardDetailsCubit() : super(CardDetailsState.initial());
}
