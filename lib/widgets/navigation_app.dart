import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class NavigationApp extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool rail;

  const NavigationApp({super.key, 
    required this.selectedIndex,
    required this.rail,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final destinations = const [
      (
        icon: Icon(MaterialCommunityIcons.home),
        label: ('Home'),
      ),
      (
        icon: Icon(MaterialCommunityIcons.magnify),
        label: ('Search'),
      ),
      (
        icon: Icon(MaterialCommunityIcons.account_circle),
        label: ('Profile'),
      )
    ];

    if (rail) {
      return NavigationRail(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          labelType: NavigationRailLabelType.all,
          destinations: destinations
              .map((dest) => NavigationRailDestination(
                  label: Text(dest.label), icon: dest.icon))
              .toList());
    }

    return NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations
            .map((dest) =>
                NavigationDestination(label: dest.label, icon: dest.icon))
            .toList());
  }
}
