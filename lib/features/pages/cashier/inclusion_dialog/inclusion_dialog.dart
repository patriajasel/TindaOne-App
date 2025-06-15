import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/shared/common/item_counter.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class InclusionDialog extends HookWidget {
  const InclusionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final countNotifier = useState<int>(1);

    return Dialog(
      child: Container(
        constraints: BoxConstraints(maxHeight: 400),
        child: Column(
          children: [
            _buildHeader(context),
            _buildInclusionList(context, itemCount: countNotifier),
            const SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: AppColors.appTertiary.withValues(alpha: 0.2),
      child: Row(
        children: [
          Icon(Icons.extension, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            'Inclusions',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.appPrimary),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildInclusionList(
    BuildContext context, {
    required ValueNotifier<int> itemCount,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: List.generate(3, (index) {
          return _buildInclusionItem(context, countNotifier: itemCount);
        }),
      ),
    );
  }

  Widget _buildInclusionItem(
    BuildContext context, {
    required ValueNotifier<int> countNotifier,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Product Name',
                style: context.textTheme.displaySmall,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ItemCounter(count: countNotifier),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.appSecondary),
              ),
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.cancel, color: AppColors.lightBackground),
              label: Text('Cancel'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(Icons.check_circle),
              onPressed: () {
                context.pop();
              },
              label: Text('Confirm'),
            ),
          ),
        ],
      ),
    );
  }
}
