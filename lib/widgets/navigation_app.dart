import 'package:flutter/material.dart';
import 'package:hoyomi/constraints/huge_icons.dart';
import 'package:hoyomi/widgets/iconify.dart';

class NavigationApp extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool rail;

  const NavigationApp({
    super.key,
    required this.selectedIndex,
    required this.rail,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final destinations = const [
      (icon: Iconify(Hg.strokeRoundedBook04), label: ('Comic')),
      (icon: Iconify(Hg.strokeRoundedFlimSlate), label: ('Eiga')),
      (icon: Iconify(Hg.search01), label: ('Search')),
      (icon: Iconify(Hg.safari), label: ('Library')),
      (icon: Iconify(Hg.userCircle), label: ('Profile')),
    ];

    if (rail) {
      return NavigationRail(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        labelType: NavigationRailLabelType.all,
        destinations:
            destinations
                .map(
                  (dest) => NavigationRailDestination(
                    label: Text(dest.label),
                    icon: dest.icon,
                  ),
                )
                .toList(),
      );
    }

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations:
          destinations
              .map(
                (dest) =>
                    NavigationDestination(label: dest.label, icon: dest.icon),
              )
              .toList(),
    );
  }
}
