import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/screens/common_widgets/custom_error_widget.dart';
import 'package:test_app/screens/common_widgets/empty_list_widget.dart';
import 'package:test_app/screens/common_widgets/loading_widget.dart';
import 'package:test_app/screens/rocket_details/bloc/details_bloc.dart';
import 'package:test_app/screens/rocket_details/bloc/details_event.dart';
import 'package:test_app/screens/rocket_details/bloc/details_state.dart';
import 'package:test_app/screens/rocket_details/model/network/rocket_details_service.dart';
import 'package:test_app/screens/rocket_details/view/local_widgets/details_widget.dart';
import 'package:test_app/screens/rockets_list/model/view_details.dart';
import 'package:test_app/utils/app_color.dart';

import '../../../core/network/dio_client.dart';

class RocketDetails extends StatefulWidget {
  final String? id;

  const RocketDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<RocketDetails> createState() => _RocketDetailsState();
}

class _RocketDetailsState extends State<RocketDetails> {
  bool cancelButtonTap = true;
  bool yesButtonTap = false;
  late RocketDetailsBloc _rocketDetailsBloc;
  List<ViewModel> _data = [];
  ViewModel? viewModel;

  @override
  void initState() {
    _rocketDetailsBloc = RocketDetailsBloc(
      rocketsDetailsService: RocketsDetailsService(dio: GetIt.instance<DioClient>()),
    );
    super.initState();
    _rocketDetailsBloc.add(GetRocketDetails(id: widget.id ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer(
        bloc: _rocketDetailsBloc,
        listener: (context, state) {
          if (state is RocketDetailsSuccess) {
            setState(() {
              viewModel = state.viewModel;
            });
          }
        },
        builder: (context, state) {
          if (state is RocketDetailsLoading && _data.isEmpty) {
            return const LoadingWidget();
          }

          if (state is RocketDetailsError) {
            return CustomErrorWidget(error: state.error);
          }

          if (state is RocketDetailsSuccess && viewModel == null) {
            return const EmptyListWidget();
          }

          return RocketDetailsWidget(
            name: viewModel?.name ?? '',
            status: viewModel?.active.toString(),
            costPerLaunch: viewModel?.costPerLaunch.toString(),
            successRate: viewModel?.successRatePct.toString(),
            flickerImage: viewModel?.flickrImages,
            description: viewModel?.description,
            height: viewModel?.height?.feet.toString(),
            diameter: viewModel?.diameter?.feet.toString(),
            wikipediaLink: viewModel?.wikipedia,
          );
        },
      ),
    );
  }
}
