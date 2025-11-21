import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../widgets/on_boarding_body.dart';
import '../../data/model/on_boarding.dart';
import '../../../../Core/widgets/custom_text.dart';
import '../../../../core/widgets/back_ground.dart';
import '../../../../Core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../configuration/presentation/views/pages/configuration_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BackGround(
      body: PageView.builder(
        itemCount: 3,
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        itemBuilder:
            (context, index) => SafeArea(
              child: OnBoardingBody(
                onBoarding: onBoardingData(context: context)[index],
              ),
            ),
      ),
      bottom: _Bottom(controller: pageController),
    );
  }
}

class _Bottom extends StatelessWidget {
  final PageController controller;
  const _Bottom({required this.controller});

  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    var color = Theme.of(context).primaryColor;
    final s = S.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 7.h),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              NavTo.pushReplacement(
                context: context,
                nextPage: ConfigurationView(),
              );
            },
            child: CustomText(isHead: false, title: s.skip, fontSize: 20.sp),
          ),
          Spacer(),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: WormEffect(
              dotHeight: 12,
              dotWidth: 12,
              spacing: 8,
              dotColor: Colors.grey,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              if (currentPage < 2) {
                controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                currentPage++;
              } else {
                NavTo.pushReplacement(
                  context: context,
                  nextPage: ConfigurationView(),
                );
              }
            },
            child: CustomText(
              isHead: true,
              title: s.next,
              fontSize: 25.sp,
              fontColor: color,
            ),
          ),
        ],
      ),
    );
  }
}
