import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offermath/colors/main_colors.dart';

class CustomToggleSwitch extends StatefulWidget {
  const CustomToggleSwitch({super.key});

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch>
    with SingleTickerProviderStateMixin {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isToggled = !isToggled),
      child: SizedBox(
        height: 90.h,
        width: 81.w,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            // дорожка
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 80.w,
              height: 15.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            // кнопка
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: isToggled ? 32 : 0,
              child: Container(
                width: 40.w,
                height: 200.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: MainColors.mainOrrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
