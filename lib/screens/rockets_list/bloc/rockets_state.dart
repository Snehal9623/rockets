part of 'rockets_bloc.dart';

abstract class RocketsState extends Equatable {
  const RocketsState();
}

class RocketsInitial extends RocketsState {
  @override
  List<Object> get props => [];
}

class RocketsError extends RocketsState {
  final String error;
  const RocketsError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class RocketsLoading extends RocketsState {
  final String message;
  const RocketsLoading({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class RocketsSuccess extends RocketsState {
  final List<RocketModel> data;
  const RocketsSuccess({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
