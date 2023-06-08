import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test_app/screens/rocket_details/bloc/details_event.dart';
import 'package:test_app/screens/rocket_details/bloc/details_state.dart';
import 'package:test_app/screens/rocket_details/model/network/rocket_details_service.dart';
import 'package:test_app/screens/rockets_list/model/view_details.dart';

class RocketDetailsBloc extends Bloc<RocketsDetailsEvent, RocketsDetailsState> {
  final RocketsDetailsService rocketsDetailsService;
  // List<ViewModel> data = [];
  ViewModel? viewModel;

  RocketDetailsBloc({
    required this.rocketsDetailsService,
  }) : super(RocketDetailsInitial()) {
    on<RocketsDetailsEvent>((event, emit) {});
    on<GetRocketDetails>(_mapGetDetailsToState);
  }

  FutureOr<void> _mapGetDetailsToState(GetRocketDetails event, Emitter<RocketsDetailsState> emit) async {
    emit(const RocketDetailsLoading(message: 'Loading please wait..'));

    viewModel = await rocketsDetailsService.getRocketData(id: event.id);

    emit(RocketDetailsSuccess(viewModel: viewModel));
  }
}
