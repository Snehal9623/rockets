import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/utils/app_color.dart';
import 'package:test_app/utils/app_constants.dart';

// ignore: constant_identifier_names
// enum Status {ACTIVE, ENGAGED}

class RocketListWidget extends StatefulWidget {
  final String? name;
  final String? country;
  final int? enginesCount;
  final List<String>? flickerImage;
  final Function onTapItem;

  const RocketListWidget({
    Key? key,
    required this.name,
    required this.country,
    required this.enginesCount,
    required this.flickerImage,
    required this.onTapItem,
  }) : super(key: key);

  @override
  State<RocketListWidget> createState() => _RocketListWidgetState();
}

class _RocketListWidgetState extends State<RocketListWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTapItem();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Container(
          height: 150.h,
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
            horizontal: 5.w,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.containerColor : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.containerBorder,
              width: 1.w,
            ),
            // boxShadow: const [
            //   BoxShadow(
            //     blurRadius: 5,
            //     spreadRadius: 1,
            //     offset: Offset(0, 1),
            //   ),
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 160.w,
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
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Container(
                          width: 160.w,
                          height: 140.h,
                          child: Image.network(widget.flickerImage![index], fit: BoxFit.contain),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 8.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 2.h,
                        ),
                        child: Text(
                          widget.name ?? '',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 2.h,
                        ),
                        child: Text(
                          widget.country ?? '',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 2.h,
                        ),
                        child: Text(
                          MyRocketListConstants.ENGINES_COUNT + widget.enginesCount.toString(),
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
