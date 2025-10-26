import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            
            children: [
              SizedBox(height: 40),
              CustomNavBar(),
              OnBoardingWidgetBody(),
              SizedBox(height: 88),
              CustomBtn(text: AppStrings.next),
              SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
