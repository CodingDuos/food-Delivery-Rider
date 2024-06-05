import 'package:delivery_boy/app/constants/constants_colors.dart';
import 'package:delivery_boy/app/modules/onboard_screen/controllers/onboard_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardScreenPage extends StatelessWidget {
  const OnboardScreenPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<OnboardScreenController>(builder: (controller) {
      String onBoardImage = controller.onBoardData[index]["image"] as String;
      String onboardTitle = controller.onBoardData[index]["title"] as String;
      String onBoardDescription =
          controller.onBoardData[index]["description"] as String;
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              buildSkipButton(controller),
              buildImageWidget(
                onBoardImage: onBoardImage,
                size: (size.height / 2) - 50,
              ),
              buildTitleWidget(onboardTitle),
              buildDescriptionWidget(onBoardDescription),
              const SizedBox(height: 10),
              buildDotIndicator(index),
              const Spacer(),
              buildNextButton(controller),
            ],
          ),
        ),
      );
    });
  }

  /// The `buildSkipButton` function in Dart creates a row with a TextButton labeled "Skip" styled in grey
  /// at the end of the row.
  ///
  /// Args:
  ///   controller (SplashScreenController): The `controller` parameter in the `buildSkipButton` function
  /// is of type `SplashScreenController`. This parameter is used to pass an instance of the
  /// `SplashScreenController` class to the function, which can be used to interact with the controller's
  /// properties and methods within the function's implementation.
  ///
  /// Returns:
  ///   A Row widget containing a TextButton with the text 'Skip' styled in grey.
  ///
  buildSkipButton(OnboardScreenController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.grey),
            ))
      ],
    );
  }

  /// The `buildImageWidget` function returns a `SizedBox` widget containing an image asset with specified
  /// height and width.
  ///
  /// Args:
  ///   onBoardImage (String): The `onBoardImage` parameter is a required String that specifies the image
  /// asset to be displayed in the widget.
  ///   size (double): The `size` parameter in the `buildImageWidget` function is used to specify the
  /// height of the `SizedBox` widget that contains the image. It determines how much vertical space the
  /// image widget will occupy on the screen.
  ///
  /// Returns:
  ///   The `buildImageWidget` function is returning a `SizedBox` widget containing an `Image` widget with
  /// the specified `onBoardImage` asset and size. The `Image` widget is set to cover the available space
  /// within the `SizedBox`.
  buildImageWidget({required String onBoardImage, required double size}) {
    return SizedBox(
        height: size,
        width: double.infinity,
        child: Image.asset(onBoardImage, fit: BoxFit.cover));
  }

  /// The `buildTitleWidget` function in Dart returns a Text widget with the specified `onBoardTitle` text
  /// and styling.
  ///
  /// Args:
  ///   onBoardTitle (String): The `onBoardTitle` parameter is a string that represents the title text to
  /// be displayed in the `Text` widget.
  ///
  /// Returns:
  ///   The `buildTitleWidget` function is returning a `Text` widget with the `onBoardTitle` text, styled
  /// with a font size of 20 and bold weight.

  buildTitleWidget(String onBoardTitle) {
    return Text(onBoardTitle,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ));
  }

  /// The function `buildDescriptionWidget` returns a `Text` widget with the provided
  /// `onBoardDescription` centered.
  ///
  /// Args:
  ///   onBoardDescription (String): The `buildDescriptionWidget` function takes a string parameter
  /// `onBoardDescription` which represents the description text to be displayed in a widget. The
  /// function returns a `Text` widget with the provided description text centered within it.
  ///
  /// Returns:
  ///   A Text widget displaying the onBoardDescription text with center alignment.
  buildDescriptionWidget(String onBoardDescription) {
    return Text(onBoardDescription, textAlign: TextAlign.center);
  }

  /// The `buildNextButton` function returns a MaterialButton with a text that changes based on the value
  /// of the `index` variable.
  ///
  /// Args:
  ///   controller (SplashScreenController): The `controller` parameter in the `buildNextButton` function
  /// is of type `SplashScreenController`. It is used to handle the logic related to the splash screen,
  /// such as updating the page when the button is pressed.
  ///
  /// Returns:
  ///   A MaterialButton widget is being returned with an onPressed function that calls the
  /// `updateSplashPage` function from the `SplashScreenController`. The button has a Container with
  /// specified height, width, color, and border radius. Inside the Container, there is a Text widget that
  /// displays either 'Continue' or 'Next' based on the value of the `index` variable.
  ///
  buildNextButton(OnboardScreenController controller) {
    return MaterialButton(
        onPressed: controller.updateOnboardPage,
        child: Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              index == 2 ? 'Continue' : "Next",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ));
  }

  /// The `buildDotIndicator` function creates a row of animated containers representing page indicators
  /// with different sizes and colors based on the current page.
  ///
  /// Args:
  ///   currentPage (int): The `currentPage` parameter in the `buildDotIndicator` function is used to
  /// determine which dot should be highlighted based on the current page index. The function generates a
  /// row of dots where one dot is highlighted based on the `currentPage` value.
  ///
  /// Returns:
  ///   The `buildDotIndicator` function returns a `Row` widget containing a row of 3 `AnimatedContainer`
  /// widgets. Each `AnimatedContainer` widget represents a dot indicator with different width, height,
  /// border radius, shape, and color based on the `currentPage` value compared to the index.
  Widget buildDotIndicator(int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: const EdgeInsets.all(8),
          width: currentPage == index ? 30 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius:
                currentPage == index ? BorderRadius.circular(10) : null,
            shape: currentPage == index ? BoxShape.rectangle : BoxShape.circle,
            color: currentPage == index ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}
