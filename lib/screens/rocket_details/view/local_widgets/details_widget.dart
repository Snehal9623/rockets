import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/utils/app_color.dart';
import 'package:test_app/utils/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: constant_identifier_names
// enum Status {ACTIVE, ENGAGED}

class RocketDetailsWidget extends StatefulWidget {
  final String? name;
  final List<String>? flickerImage;
  final String? status;
  final String? costPerLaunch;
  final String? successRate;
  final String? description;
  final String? wikipediaLink;
  final String? height;
  final String? diameter;

  const RocketDetailsWidget({
    Key? key,
    required this.name,
    required this.status,
    required this.costPerLaunch,
    required this.successRate,
    required this.flickerImage,
    required this.description,
    required this.height,
    required this.diameter,
    required this.wikipediaLink,
  }) : super(key: key);

  @override
  State<RocketDetailsWidget> createState() => _RocketDetailsWidgetState();
}

class _RocketDetailsWidgetState extends State<RocketDetailsWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100.h,
          color: AppColors.white,
          child: Center(
            child: Text(
              MyRocketDetailsConstants.ROCKET_NAME + widget.name!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.appBarTitleColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.flickerImage?.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Container(
                    width: ScreenUtil().screenWidth - 30.w,
                    height: 150.h,
                    decoration: BoxDecoration(border: Border.all(color: AppColors.black, width: 3.w)),
                    child: Image.network(
                      widget.flickerImage![index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
          child: Container(
            height: 350.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  child: Text(
                    MyRocketDetailsConstants.ACTIVE_STATUS + widget.status.toString(),
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  child: Text(
                    MyRocketDetailsConstants.COST_PER_LAUNCH + widget.costPerLaunch.toString(),
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  child: Text(
                    MyRocketDetailsConstants.SUCCESS_RATE + widget.successRate.toString(),
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  child: Text(
                    MyRocketDetailsConstants.DESCRIPTION + widget.description.toString(),
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  child: Text(
                    MyRocketDetailsConstants.HEIGHT + widget.height.toString(),
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  child: Text(
                    MyRocketDetailsConstants.DIAMETER + widget.diameter.toString(),
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 2.h,
                    ),
                    child: InkWell(
                      onTap: () => launchUrl(Uri.parse(widget.wikipediaLink!)),
                      child: Text(
                        widget.wikipediaLink!,
                        style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
