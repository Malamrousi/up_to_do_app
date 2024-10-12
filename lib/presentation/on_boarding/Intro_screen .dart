//package
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
//constant
import 'package:todo_app/core/utils/color_manger.dart';
import 'package:todo_app/core/utils/route_name.dart';
import '../../core/utils/image_manger.dart';
import '../../core/utils/size_manger.dart';
import '../../core/utils/string_manger.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: FontSizeValue.Fv32,
            fontWeight: FontWeight.w700,
            color: ColorManger.kWhiteColor),
        bodyTextStyle:
            TextStyle(fontSize: FontSizeValue.Fv16, color: Colors.white),
        titlePadding: EdgeInsets.fromLTRB(
            PaddingManger.P16, 0.0, PaddingManger.P16, 16.0),
        imagePadding: EdgeInsets.all(PaddingManger.P20),
        bodyPadding:
            EdgeInsets.fromLTRB(PaddingManger.P16, 0, PaddingManger.P16, 0));

    return IntroductionScreen(
      globalBackgroundColor: ColorManger.kPrimaryColor,
      pages: [
        PageViewModel(
          image: Image.asset(ImageManger.kSlide1),
          title: StringManger.kMangeYourTask,
          body: StringManger.kDesOnSlidePageOne,
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: Image.asset(ImageManger.kSlide2),
          title: StringManger.kCreatedDailyRoutine,
          body: StringManger.kDesOnSlidePageTwo,
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: Image.asset(ImageManger.kSlide3),
          title: StringManger.kOrganizeYourTasks,
          body: StringManger.kDesOnSlidePageThree,
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        Get.toNamed(RouteName.kStartScreen);
      },
      onSkip: () {
        Get.toNamed(RouteName.kStartScreen);
      },
      showSkipButton: true,
      nextFlex: 0,
      skip: const Text(
        StringManger.kSkip,
        style: TextStyle(color: ColorManger.kWhiteColor),
      ),
      next: Container(
        color: const Color(0xff8875FF),
        width: WidthManger.W90,
        height: HightManger.H48,
        child: const Center(
          child: Text(
            StringManger.kNext,
            style: TextStyle(
              color: ColorManger.kWhiteColor,
            ),
          ),
        ),
      ),
      done: Container(
        width: WidthManger.W140,
        height: HightManger.H48,
        decoration:const BoxDecoration(
            color:  Color(0xff8875FF),
            ),
        child: const Center(
          child: Text(
            StringManger.kGettingStarted,
            style: TextStyle(color: ColorManger.kWhiteColor),
          ),
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: ColorManger.kHeliotrop,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(BorderRadiusValue.BV25)),
        ),
      ),
    );
  }
}
