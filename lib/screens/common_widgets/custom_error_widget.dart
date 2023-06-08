import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;

  const CustomErrorWidget({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: LottieBuilder.network(
              "https://assets7.lottiefiles.com/packages/lf20_07TnvN.json",
              width: 200.w,
            ),
          ),
          Center(
            child: Text(
              "ERROR",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
          Center(
            child: Text(
              error,
              style: const TextStyle(
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
