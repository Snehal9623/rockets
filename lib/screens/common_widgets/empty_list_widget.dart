import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.network(
          "https://assets9.lottiefiles.com/packages/lf20_dhtOaoOnRb.json",
          width: 130.w,
        ),
        Center(
          child: Text(
            "Nothing to show...",
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        )
      ],
    );
  }
}
