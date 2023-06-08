import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/screens/common_widgets/custom_error_widget.dart';
import 'package:test_app/screens/common_widgets/empty_list_widget.dart';
import 'package:test_app/screens/common_widgets/loading_widget.dart';
import 'package:test_app/screens/rocket_details/view/rocket_details_screen.dart';
import 'package:test_app/screens/rockets_list/bloc/rockets_bloc.dart';
import 'package:test_app/screens/rockets_list/model/network/rockets_service.dart';
import 'package:test_app/screens/rockets_list/model/rocket_model.dart';
import 'package:test_app/screens/rockets_list/view/local_widgets/rocket_list_widget.dart';
import 'package:test_app/utils/app_color.dart';
import 'package:test_app/utils/app_constants.dart';

import '../../../core/network/dio_client.dart';

class RocketList extends StatefulWidget {
  const RocketList({Key? key}) : super(key: key);

  @override
  State<RocketList> createState() => _RocketListState();
}

class _RocketListState extends State<RocketList> {
  bool cancelButtonTap = true;
  bool yesButtonTap = false;
  late RocketsBloc _rocketsBloc;
  List<RocketModel> _data = [];
  String id = "0";
  @override
  void initState() {
    _rocketsBloc = RocketsBloc(
      rocketsListService: RocketsListService(dio: GetIt.instance<DioClient>()),
    );
    super.initState();
    _rocketsBloc.add(GetRockets());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: Text(
              MyRocketListConstants.TITLE,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
              child: BlocConsumer(
                  bloc: _rocketsBloc,
                  listener: (context, state) {
                    if (state is RocketsSuccess) {
                      setState(() {
                        _data = state.data;
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is RocketsLoading && _data.isEmpty) {
                      return const LoadingWidget();
                    }

                    if (state is RocketsError) {
                      return CustomErrorWidget(error: state.error);
                    }

                    if (state is RocketsSuccess && state.data.isEmpty) {
                      return const EmptyListWidget();
                    }

                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _data.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 7.h,
                          ),
                          child: RocketListWidget(
                            onTapItem: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => RocketDetails(id: _data[index].id)),
                              );
                            },
                            name: _data[index].name ?? '',
                            country: _data[index].country ?? '',
                            enginesCount: (_data[index].firstStage?.engines ?? 0) + (_data[index].secondStage?.engines ?? 0),
                            flickerImage: _data[index].flickrImages,
                          ),
                        );
                      },
                    );
                  })),
        ],
      ),
    );
  }
}
