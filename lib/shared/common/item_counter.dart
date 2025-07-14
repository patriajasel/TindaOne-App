import 'package:flutter/material.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';

class ItemCounter extends StatelessWidget {
  final ValueNotifier<int> count;
  final VoidCallback? onCountChanged;

  const ItemCounter({super.key, required this.count, this.onCountChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if (count.value == 0) return;
            count.value -= 1;
            onCountChanged?.call();
          },
          icon: Icon(Icons.remove, color: AppColors.error),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            count.value.toString(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.appPrimary,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            count.value += 1;
            onCountChanged?.call(); // Notify parent of change
          },
          icon: Icon(Icons.add, color: AppColors.success),
        ),
      ],
    );
  }
}
