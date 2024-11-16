import 'package:flutter/material.dart';

class NavigationApp extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool rail;

  const NavigationApp({
    required this.selectedIndex,
    required this.rail,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final destinations = const [
      (
        icon: Icon(Icons.home),
        label: ('Home'),
      ),
      (
        icon: Icon(Icons.search),
        label: ('Search'),
      ),
      (
        icon: Icon(Icons.account_circle),
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
