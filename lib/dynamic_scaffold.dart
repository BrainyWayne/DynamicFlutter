import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kNavBarPersistentHeight = kMinInteractiveDimensionCupertino;

/// Size increase from expanding the navigation bar into an iOS-11-style large title
/// form in a [CustomScrollView].
const double _kNavBarLargeTitleHeightExtension = 52.0;

/// Number of logical pixels scrolled down before the title text is transferred
/// from the normal navigation bar to a big title below the navigation bar.
const double _kNavBarShowLargeTitleThreshold = 10.0;

const double _kNavBarEdgePadding = 16.0;

const double _kNavBarBackButtonTapWidth = 50.0;

/// Title text transfer fade.
const Duration _kNavBarTitleFadeDuration = Duration(milliseconds: 150);

const Color _kDefaultNavBarBorderColor = Color(0x4D000000);

const Border _kDefaultNavBarBorder = Border(
  bottom: BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0, // One physical pixel.
    style: BorderStyle.solid,
  ),
);

const _HeroTag _defaultHeroTag = _HeroTag(null);

class DynamicScaffold extends StatefulWidget {
  final Widget largeTitle;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final bool automaticallyImplyTitle;
  final String previousPageTitle;
  final Widget middle;
  final Widget trailing;
  final Widget body;
  final Color backgroundColor;

  final Brightness brightness;

  final EdgeInsetsDirectional padding;

  final Border border;
  final Color actionsForegroundColor;

  final bool transitionBetweenRoutes;

  final Object heroTag;

  const DynamicScaffold({
    Key key,
    this.largeTitle,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.automaticallyImplyTitle = true,
    this.previousPageTitle,
    this.middle,
    this.trailing,
    this.border = _kDefaultNavBarBorder,
    this.backgroundColor,
    this.brightness,
    this.padding,
    this.actionsForegroundColor,
    this.transitionBetweenRoutes = true,
    this.heroTag = _defaultHeroTag,
    this.body,
  })  : assert(automaticallyImplyLeading != null),
        assert(automaticallyImplyTitle != null),
        assert(
            automaticallyImplyTitle == true || largeTitle != null,
            'No largeTitle has been provided but automaticallyImplyTitle is also '
            'false. Either provide a largeTitle or set automaticallyImplyTitle to '
            'true.'),
        super(key: key);

  @override
  _DynamicScaffoldState createState() => _DynamicScaffoldState();
}

class _DynamicScaffoldState extends State<DynamicScaffold> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: widget.largeTitle,
              trailing: widget.trailing,
              middle: widget.middle,
              leading: widget.leading,
              automaticallyImplyLeading: widget.automaticallyImplyLeading,
              previousPageTitle: widget.previousPageTitle,
              border: widget.border,
              backgroundColor: widget.backgroundColor,
              brightness: widget.brightness,
              padding: widget.padding,
              actionsForegroundColor: widget.actionsForegroundColor,
              transitionBetweenRoutes: widget.transitionBetweenRoutes,
              heroTag: widget.heroTag,
            )
          ];
        },
        body: widget.body,
      ),
    );
  }
}

@immutable
class _HeroTag {
  const _HeroTag(this.navigator);

  final NavigatorState navigator;

  // Let the Hero tag be described in tree dumps.
  @override
  String toString() =>
      'Default Hero tag for Cupertino navigation bars with navigator $navigator';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is _HeroTag && other.navigator == navigator;
  }

  @override
  int get hashCode {
    return identityHashCode(navigator);
  }
}
