import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class HomePage extends HookWidget {
  final StatefulNavigationShell navigationShell;
  const HomePage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final navIndex = useState<int>(0);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.fastLinearToSlowEaseIn,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).colorScheme.primary,
        buttonBackgroundColor: Theme.of(context).colorScheme.primary,
        index: navIndex.value,
        onTap: (index) {
          // Navigate to the selected branch
          navigationShell.goBranch(
            index,
            // Optional: Set to true if you want to restore the previous location
            // on the branch when switching back to it
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: [
          Icon(Icons.point_of_sale, color: Theme.of(context).primaryColorDark),
          Icon(Icons.inventory_2, color: Theme.of(context).primaryColorDark),
          Icon(Icons.qr_code_2, color: Theme.of(context).primaryColorDark),
          Icon(Icons.receipt_long, color: Theme.of(context).primaryColorDark),
          Icon(Icons.analytics, color: Theme.of(context).primaryColorDark),
        ],
      ),
    );
  }
}
