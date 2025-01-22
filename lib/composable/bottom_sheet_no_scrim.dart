import 'package:flutter/material.dart';

const double _defaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;
Future<T?> showModalBottomSheetNoScrim<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  String? barrierLabel,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool isScrollControlled = false,
  double scrollControlDisabledMaxHeightRatio =
      _defaultScrollControlDisabledMaxHeightRatio,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  bool? showDragHandle,
  bool useSafeArea = false,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
  Offset? anchorPoint,
  AnimationStyle? sheetAnimationStyle,
}) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));

  final NavigatorState navigator =
      Navigator.of(context, rootNavigator: useRootNavigator);
  final MaterialLocalizations localizations = MaterialLocalizations.of(context);
  return navigator.push(ModalBottomSheetRouteNoScrim<T>(
    builder: builder,
    capturedThemes:
        InheritedTheme.capture(from: context, to: navigator.context),
    isScrollControlled: isScrollControlled,
    scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
    barrierLabel: barrierLabel ?? localizations.scrimLabel,
    barrierOnTapHint:
        localizations.scrimOnTapHint(localizations.bottomSheetLabel),
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    constraints: constraints,
    isDismissible: isDismissible,
    modalBarrierColor:
        barrierColor ?? Theme.of(context).bottomSheetTheme.modalBarrierColor,
    enableDrag: enableDrag,
    showDragHandle: showDragHandle,
    settings: routeSettings,
    transitionAnimationController: transitionAnimationController,
    anchorPoint: anchorPoint,
    useSafeArea: useSafeArea,
    sheetAnimationStyle: sheetAnimationStyle,
  ));
}

class ModalBottomSheetRouteNoScrim<T> extends ModalBottomSheetRoute<T> {
  ModalBottomSheetRouteNoScrim({
    required super.builder,
    super.capturedThemes,
    super.barrierLabel,
    super.barrierOnTapHint,
    super.backgroundColor,
    super.elevation,
    super.shape,
    super.clipBehavior,
    super.constraints,
    super.modalBarrierColor,
    super.isDismissible = true,
    super.enableDrag = true,
    super.showDragHandle,
    required super.isScrollControlled,
    super.scrollControlDisabledMaxHeightRatio =
        _defaultScrollControlDisabledMaxHeightRatio,
    super.settings,
    super.requestFocus,
    super.transitionAnimationController,
    super.anchorPoint,
    super.useSafeArea = false,
    super.sheetAnimationStyle,
  });

  @override
  Widget buildModalBarrier() {
    return SizedBox.shrink();
  }
}
