import 'package:equatable/equatable.dart';
import 'package:test_app/screens/rockets_list/model/view_details.dart';

abstract class RocketsDetailsState extends Equatable {
  const RocketsDetailsState();
}

class RocketDetailsInitial extends RocketsDetailsState {
  @override
  List<Object> get props => [];
}

class RocketDetailsError extends RocketsDetailsState {
  final String error;
  const RocketDetailsError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class RocketDetailsLoading extends RocketsDetailsState {
  final String message;
  const RocketDetailsLoading({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class RocketDetailsSuccess extends RocketsDetailsState {
  // final List<ViewModel> data;
  final ViewModel? viewModel;
  const RocketDetailsSuccess({this.viewModel});

  @override
  List<Object> get props => [];
}
