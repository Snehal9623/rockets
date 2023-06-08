import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/screens/rockets_list/model/network/rockets_service.dart';
import 'package:test_app/screens/rockets_list/model/rocket_model.dart';

part 'rockets_event.dart';
part 'rockets_state.dart';

class RocketsBloc extends Bloc<RocketsEvent, RocketsState> {
  final RocketsListService rocketsListService;
  List<RocketModel> data = [];

  RocketsBloc({
    required this.rocketsListService,
  }) : super(RocketsInitial()) {
    on<RocketsEvent>((event, emit) {});
    on<GetRockets>(_mapGetRocketsToState);
  }

  FutureOr<void> _mapGetRocketsToState(GetRockets event, Emitter<RocketsState> emit) async {
    emit(const RocketsLoading(message: 'Loading please wait..'));

    data = await rocketsListService.getRocketsList();
    // rocketId = event.rocketId;

    emit(RocketsSuccess(
      data: data,
    ));
  }
}
