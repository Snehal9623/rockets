import 'dart:math';

import 'package:equatable/equatable.dart';

abstract class RocketsDetailsEvent extends Equatable {
  const RocketsDetailsEvent();
}

class GetRocketDetails extends RocketsDetailsEvent {
  final String id;
  const GetRocketDetails({required this.id});

  @override
  List<Object?> get props => [Random().nextInt(100)];
}
