part of 'rockets_bloc.dart';

abstract class RocketsEvent extends Equatable {
  const RocketsEvent();
}

class GetRockets extends RocketsEvent {
  @override
  List<Object?> get props => [Random().nextInt(100)];
}
