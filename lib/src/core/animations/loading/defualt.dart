import 'package:clz/src/core/extensions/extensions.dart';
import 'package:clz/src/core/theme/theme.dart';
import 'package:flutter/widgets.dart';

import 'line.dart';
import 'prograssive_dots.dart';
import 'two_rotating_arc.dart';

class AppLoading {
  final BuildContext context;
  AppLoading(this.context);

  ///
  Align get arc => Align(
    alignment: Alignment.center,
    child: TwoRotatingArc(size: 50, color: context.theme.icon),
  );

  ///
  Align get dots => Align(
    alignment: Alignment.center,
    child: PrograssiveDots(color: context.theme.icon, size: 50.0),
  );

  ///
  Widget get line => LoadingIndicator(color: context.theme.icon);
}
