import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var sizeProvider = StateProvider<double>(((ref) => 1));
var colorProvider = StateProvider<Color>((ref) => Colors.pink);
StateProvider<bool> startAnimation = StateProvider<bool>((ref) => false);

class ExpandableBox extends HookWidget {
  const ExpandableBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationController _animationController =
        useAnimationController(duration: Duration(milliseconds: 500));
    double maxSlide = 225.0;
    double slide = maxSlide * _animationController.value;
    // double scale = 1 - (_animationController.value * 0.3);
    void toggleAnimationFunction() {
      _animationController.isDismissed
          ? _animationController.forward()
          : _animationController.reverse();
    }

    return Consumer(builder: (context, ref, _) {
      var colorPro = ref.watch(colorProvider.state);
      var height = ref.watch(sizeProvider.state);
      return InkWell(
        onHover: (value) {
          toggleAnimationFunction();
          // colorPro.state = Colors.blue;
        },
        onTap: () {
          toggleAnimationFunction();
          colorPro.state = Colors.orangeAccent;
          height.state = 3.0;
        },
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            var animationHeight = height.state * _animationController.value;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              height:
                  maxSlide, //slide, //200, //* animationHeight, //200 * height.state,
              width: 280,
              child: Stack(
                children: [
                  // Image.network(''),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'R',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: colorPro.state,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          },
        ),
      );
    });
  }
}

class CarryOn extends StatelessWidget {
  const CarryOn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ExpandableBox()),
    );
  }
}

class Example extends HookWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 250),
    );
    double maxSlide = 225.0;

    void _onDragStart(DragStartDetails details) {
      double minDragStartEdge = 0.3;
      double maxDragStartEdge = 10;
      bool isDragOpenFromLeft = animationController.isDismissed &&
          details.globalPosition.dx < minDragStartEdge;
      bool isDragCloseFromLeft = animationController.isCompleted &&
          details.globalPosition.dx > maxDragStartEdge;

      bool canBeDragged = isDragOpenFromLeft || isDragCloseFromLeft;
    }

    void _onDragUpdate(DragUpdateDetails details) {
      bool canBeDragged = true;
      // bool  _canBeDragged;
      if (canBeDragged) {
        double delta = details.primaryDelta! / maxSlide;
        animationController.value += delta;
      }
    }

    void _onDragEnd(DragEndDetails details) {
      if (animationController.isDismissed || animationController.isCompleted) {
        return;
      }
      if (details.velocity.pixelsPerSecond.dx.abs() >= 345) {
        double visualVelocity = details.velocity.pixelsPerSecond.dx /
            MediaQuery.of(context).size.width;

        animationController.fling(velocity: visualVelocity);
      } else if (animationController.value < 0.5) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }

    void toggle() {
      animationController.isDismissed
          ? animationController.forward()
          : animationController.reverse();
    }

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragEnd: _onDragEnd,
        onHorizontalDragUpdate: _onDragUpdate,
        onTap: toggle,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            double slide = maxSlide * animationController.value;
            double scale = 1 - (animationController.value * 0.3);
            return Stack(
              children: [
                // const WidgetDrawer(),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      // boxShadow: [
                      //   BoxShadow(
                      //     blurRadius: 30 / animationController!.value,
                      //     spreadRadius: 2 / animationController!.value,
                      //     color:
                      //         Colors.lightBlueAccent.shade100.withOpacity(0.7),
                      //     offset: Offset.fromDirection(
                      //       -10,
                      //       25,
                      //     ),
                      //   ),
                      // ],
                      borderRadius: BorderRadius.circular(
                        50 * animationController.value,
                      ),
                    ),
                    // child: const HomePageWidget(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
