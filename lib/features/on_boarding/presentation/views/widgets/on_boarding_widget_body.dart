import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_assets.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  OnBoardingWidgetBody({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(Assets.imagesOnBoarding1),
              SizedBox(height: 24),
              CustomSmoothPageIndicator(controller: _controller),
              SizedBox(height: 32),
              Text(
                "Explore The history with Dalel in a smart way",
                style: CustomTextStyles.poppins500style24.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                "Using our app’s history libraries you can find many historical periods ",
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
