import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roddy/model/dimensions.dart';
import 'package:roddy/views/movie_display_views/app_bar.dart';
import 'package:roddy/widgets/circle_with_icon_button.dart';
import 'package:roddy/widgets/text_descption.dart';

class ExpandableBox extends HookWidget {
  const ExpandableBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationController _animationController =
        useAnimationController(duration: Duration(milliseconds: 200));

    AnimationController _animationControllerForExpandableBoxHeight =
        useAnimationController(duration: Duration(milliseconds: 50));

    Animation<double> animationCurves =
        CurvedAnimation(curve: Curves.linear, parent: _animationController);

    Animation<double> _animationHeightDouble =
        Tween<double>(begin: 170, end: 340)
            .animate(_animationControllerForExpandableBoxHeight);

    Animation<double> _animationWidthDouble =
        Tween<double>(begin: 280.0, end: 345.0).animate(_animationController);

    // Animation<double> _animationFlexInt() =>
    //     Tween<double>(begin: 0.0, end: 2.0).animate(animationCurves);

    void toggleAnimationFunction(bool value) {
      value ? _animationController.forward() : _animationController.reverse();
    }

    Future openExpandableHeight(bool value) async {
      value
          ? _animationControllerForExpandableBoxHeight.forward()
          : _animationControllerForExpandableBoxHeight.reverse();
    }

    var mediaQuery = MediaQuery.of(context).size;

    var newHeight = 340 / 2;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return InkWell(
          onHover: (value) async {
            toggleAnimationFunction(value);
            await openExpandableHeight(value);
          },
          onTap: () {},
          child: Container(
            height: _animationHeightDouble.value,
            width: mediaQuery.width > 600
                ? _animationWidthDouble.value
                : mediaQuery.height / 2.5,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: newHeight,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 25,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black, //Color.fromARGB(136, 11, 11, 11),
                      borderRadius: BorderRadius.vertical(
                        // top: Radius.circular(7),
                        bottom: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            circleWithIconButton(
                              CupertinoIcons.play,
                              mediaQuery,
                            ),
                            circleWithIconButton(
                              CupertinoIcons.plus,
                              mediaQuery,
                            ),
                            circleWithIconButton(
                                CupertinoIcons.hand_thumbsup, mediaQuery),
                            Spacer(),
                            circleWithIconButton(
                                CupertinoIcons.chevron_down, mediaQuery)
                          ],
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            textInfo('97% Match'),
                            SizedBox(width: 10),
                            textInfo('13+'),
                            SizedBox(width: 10),
                            textInfo('3 Seasons'),
                            SizedBox(width: 10),
                            textInfo('HD'),
                          ],
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            textInfo('Rousing'),
                            circleAvatar(),
                            textInfo('Exciting'),
                            circleAvatar(),
                            textInfo('Drama Anime'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: newHeight,
                  width: double.maxFinite,
                  child: Stack(children: [
                    // Image.network(''),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'R',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ]),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: borderRadiusRY(5),
            ),
          ),
        );
      },
    );
  }
}

class CarryOn extends ConsumerWidget {
  const CarryOn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        scrollController.jumpTo(100);
      }),
      body: ListView(
        controller: scrollController,
        children: [
          RoddyAppBar(),
          Text('AHh'),
          Container(
            height: 900,
            color: Colors.greenAccent,
            width: double.maxFinite,
          ),
          Text('AHh'),
        ],
      ),
    );
  }
}
