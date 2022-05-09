import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ScrollController useScrollController(AnimationController animationController) {
  return use(
      _AnimationScrollController(animationController: animationController));
}

class _AnimationScrollController extends Hook<ScrollController> {
  final AnimationController animationController;
  const _AnimationScrollController({required this.animationController});

  @override
  _AnimationScrollControllerState createState() =>
      _AnimationScrollControllerState();
}

class _AnimationScrollControllerState
    extends HookState<ScrollController, _AnimationScrollController> {
  ScrollController _scrollController = ScrollController();

  @override
  void initHook() {
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          hook.animationController.forward();
          break;
        case ScrollDirection.reverse:
          hook.animationController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
  }

  @override
  ScrollController build(BuildContext context) {
    return _scrollController;
  }

  @override
  void dispose() {
    _scrollController.dispose();
  }
}
