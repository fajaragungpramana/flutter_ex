import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExFlexibleSpaceBar extends StatefulWidget {
  /// Creates a flexible space bar.
  ///
  /// Most commonly used in the [AppBar.flexibleSpace] field.
  const ExFlexibleSpaceBar({
    super.key,
    this.title,
    this.background,
    this.centerTitle,
    this.titlePadding,
    this.collapseMode = CollapseMode.parallax,
    this.stretchModes = const <StretchMode>[StretchMode.zoomBackground],
    this.expandedTitleScale = 1.5,
  }) : assert(expandedTitleScale >= 1);

  /// The primary contents of the flexible space bar when expanded.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Shown behind the [title] when expanded.
  ///
  /// Typically an [Image] widget with [Image.fit] set to [BoxFit.cover].
  final Widget? background;

  /// Whether the title should be centered.
  ///
  /// By default this property is true if the current target platform
  /// is [TargetPlatform.iOS] or [TargetPlatform.macOS], false otherwise.
  final bool? centerTitle;

  /// Collapse effect while scrolling.
  ///
  /// Defaults to [CollapseMode.parallax].
  final CollapseMode collapseMode;

  /// Stretch effect while over-scrolling.
  ///
  /// Defaults to include [StretchMode.zoomBackground].
  final List<StretchMode> stretchModes;

  /// Defines how far the [title] is inset from either the widget's
  /// bottom-left or its center.
  ///
  /// Typically this property is used to adjust how far the title is
  /// inset from the bottom-left and it is specified along with
  /// [centerTitle] false.
  ///
  /// By default the value of this property is
  /// `EdgeInsetsDirectional.only(start: 72, bottom: 16)` if the title is
  /// not centered, `EdgeInsetsDirectional.only(start: 0, bottom: 16)` otherwise.
  final EdgeInsetsTween? titlePadding;

  /// Defines how much the title is scaled when the FlexibleSpaceBar is expanded
  /// due to the user scrolling downwards. The title is scaled uniformly on the
  /// x and y axes while maintaining its bottom-left position (bottom-center if
  /// [centerTitle] is true).
  ///
  /// Defaults to 1.5 and must be greater than 1.
  final double expandedTitleScale;

  /// Wraps a widget that contains an [AppBar] to convey sizing information down
  /// to the [FlexibleSpaceBar].
  ///
  /// Used by [Scaffold] and [SliverAppBar].
  ///
  /// `toolbarOpacity` affects how transparent the text within the toolbar
  /// appears. `minExtent` sets the minimum height of the resulting
  /// [FlexibleSpaceBar] when fully collapsed. `maxExtent` sets the maximum
  /// height of the resulting [FlexibleSpaceBar] when fully expanded.
  /// `currentExtent` sets the scale of the [FlexibleSpaceBar.background] and
  /// [FlexibleSpaceBar.title] widgets of [FlexibleSpaceBar] upon
  /// initialization. `scrolledUnder` is true if the [FlexibleSpaceBar]
  /// overlaps the app's primary scrollable, false if it does not, and null
  /// if the caller has not determined as much.
  /// See also:
  ///
  ///  * [FlexibleSpaceBarSettings] which creates a settings object that can be
  ///    used to specify these settings to a [FlexibleSpaceBar].
  static Widget createSettings({
    double? toolbarOpacity,
    double? minExtent,
    double? maxExtent,
    bool? isScrolledUnder,
    bool? hasLeading,
    required double currentExtent,
    required Widget child,
  }) {
    return FlexibleSpaceBarSettings(
      toolbarOpacity: toolbarOpacity ?? 1.0,
      minExtent: minExtent ?? currentExtent,
      maxExtent: maxExtent ?? currentExtent,
      isScrolledUnder: isScrolledUnder,
      hasLeading: hasLeading,
      currentExtent: currentExtent,
      child: child,
    );
  }

  @override
  State<ExFlexibleSpaceBar> createState() => _ExFlexibleSpaceBarState();
}

class _ExFlexibleSpaceBarState extends State<ExFlexibleSpaceBar> {
  bool _getEffectiveCenterTitle(ThemeData theme) {
    if (widget.centerTitle != null) {
      return widget.centerTitle!;
    }
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return true;
    }
  }

  Alignment _getTitleAlignment(bool effectiveCenterTitle) {
    if (effectiveCenterTitle) {
      return Alignment.bottomCenter;
    }
    final TextDirection textDirection = Directionality.of(context);
    switch (textDirection) {
      case TextDirection.rtl:
        return Alignment.bottomRight;
      case TextDirection.ltr:
        return Alignment.bottomLeft;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final FlexibleSpaceBarSettings settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;

        final List<Widget> children = <Widget>[];

        final double deltaExtent = settings.maxExtent - settings.minExtent;

        // 0.0 -> Expanded
        // 1.0 -> Collapsed to toolbar
        final double t = clampDouble(1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent, 0.0, 1.0);

        // background
        if (widget.background != null) {
          final double fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
          const double fadeEnd = 1.0;
          assert(fadeStart <= fadeEnd);
          // If the min and max extent are the same, the app bar cannot collapse
          // and the content should be visible, so opacity = 1.
          final double opacity = settings.maxExtent == settings.minExtent
              ? 1.0
              : 1.0 - Interval(fadeStart, fadeEnd).transform(t);
          double height = settings.maxExtent;

          // StretchMode.zoomBackground
          if (widget.stretchModes.contains(StretchMode.zoomBackground) &&
              constraints.maxHeight > height) {
            height = constraints.maxHeight;
          }
        }

        // title
        if (widget.title != null) {
          final ThemeData theme = Theme.of(context);

          Widget? title;
          switch (theme.platform) {
            case TargetPlatform.iOS:
            case TargetPlatform.macOS:
              title = widget.title;
            case TargetPlatform.android:
            case TargetPlatform.fuchsia:
            case TargetPlatform.linux:
            case TargetPlatform.windows:
              title = Semantics(
                namesRoute: true,
                child: widget.title,
              );
          }

          // StretchMode.fadeTitle
          if (widget.stretchModes.contains(StretchMode.fadeTitle) &&
              constraints.maxHeight > settings.maxExtent) {
            final double stretchOpacity = 1 -
                clampDouble(
                    (constraints.maxHeight - settings.maxExtent) / 100,
                    0.0,
                    1.0);
            title = Opacity(
              opacity: stretchOpacity,
              child: title,
            );
          }

          final double opacity = settings.toolbarOpacity;
          if (opacity > 0.0) {
            TextStyle titleStyle = theme.primaryTextTheme.titleLarge!;
            titleStyle = titleStyle.copyWith(
              color: titleStyle.color!.withOpacity(opacity),
            );
            final bool effectiveCenterTitle = _getEffectiveCenterTitle(theme);
            final EdgeInsetsGeometry padding = widget.titlePadding?.transform(t) ??
                EdgeInsetsDirectional.only(
                  start: effectiveCenterTitle && !(settings.hasLeading ?? false) ? 0.0 : 72.0,
                  bottom: 16.0,
                );
            final double scaleValue = Tween<double>(begin: widget.expandedTitleScale, end: 1.0).transform(t);
            final Matrix4 scaleTransform = Matrix4.identity()
              ..scale(scaleValue, scaleValue, 1.0);
            final Alignment titleAlignment = _getTitleAlignment(effectiveCenterTitle);
            children.add(Container(
              padding: padding,
              child: Transform(
                alignment: titleAlignment,
                transform: scaleTransform,
                child: Align(
                  alignment: titleAlignment,
                  child: DefaultTextStyle(
                    style: titleStyle,
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          width: constraints.maxWidth / scaleValue,
                          alignment: titleAlignment,
                          child: title,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
          }
        }

        return ClipRect(child: Stack(children: children));
      },
    );
  }
}