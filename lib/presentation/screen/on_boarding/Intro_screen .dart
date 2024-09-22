//package
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
//constant
import 'package:todo_app/constant/color_manger.dart';
import 'package:todo_app/constant/route_name.dart';
import '../../../constant/image_manger.dart';
import '../../../constant/size_manger.dart';
import '../../../constant/string_manger.dart';

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
            color: ColorManger.KWhiteColor),
        bodyTextStyle:
            TextStyle(fontSize: FontSizeValue.Fv16, color: Colors.white),
        titlePadding: EdgeInsets.fromLTRB(
            PaddingManger.P16, 0.0, PaddingManger.P16, 16.0),
        imagePadding: EdgeInsets.all(PaddingManger.P20),
        bodyPadding:
            EdgeInsets.fromLTRB(PaddingManger.P16, 0, PaddingManger.P16, 0));

    return IntroductionScreen(
      globalBackgroundColor: ColorManger.KPrimaryColor,
      pages: [
        PageViewModel(
          image: Image.asset(ImageManger.Kslide1),
          title: StringManger.KmangeYourTask,
          body: StringManger.KdesOnSlidePageOne,
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: Image.asset(ImageManger.Kslide2),
          title: StringManger.KCreatedDailyRoutine,
          body: StringManger.KdesOnSlidePageTwo,
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: Image.asset(ImageManger.Kslide3),
          title: StringManger.KOrgonaizeYourTasks,
          body: StringManger.KdesOnSlidePageThree,
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        Get.toNamed(RouteName.KHelloScreen);
      },
      onSkip: () {
        Get.toNamed(RouteName.KHelloScreen);
      },
      showSkipButton: true,
      nextFlex: 0,
      skip: const Text(
        StringManger.kSkip,
        style: TextStyle(color: ColorManger.KWhiteColor),
      ),
      next: Container(
        color: const Color(0xff8875FF),
        width: WidthManger.W90,
        height: HightManger.H48,
        child: const Center(
          child: Text(
            StringManger.kNext,
            style: TextStyle(
              color: ColorManger.KWhiteColor,
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
            style: TextStyle(color: ColorManger.KWhiteColor),
          ),
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: ColorManger.KHeliotrop,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(BorderRadiusValue.BV25)),
        ),
      ),
    );
  }
}
