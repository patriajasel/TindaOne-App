import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class ReplaceItemDialog extends StatelessWidget {
  const ReplaceItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: BoxConstraints(maxHeight: 600),
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildItemList()),
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
          Icon(Icons.change_circle, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            'Replace Item',
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

  Widget _buildItemList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildItem(context);
      },
    );
  }

  Widget _buildItem(BuildContext context) {
    final List<String> sizes = ['S', 'M', 'L'];
    final List<int> quantities = List.generate(10, (index) => index + 1);
    String selectedSize = sizes.first;
    int selectedQuantity = 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: RadioListTile<String>(
              title: Text('Product Name', style: context.labelSmall),
              value: 'Product Name',
              groupValue: 'Product Name',
              onChanged: (value) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: DropdownButton<String>(
              dropdownColor: AppColors.lightBackground,
              style: context.labelSmall,
              value: selectedSize,
              items: sizes.map((size) {
                return DropdownMenuItem<String>(value: size, child: Text(size));
              }).toList(),
              onChanged: (value) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: DropdownButton<int>(
              dropdownColor: AppColors.lightBackground,
              style: context.labelSmall,
              value: selectedQuantity,
              items: quantities.map((qty) {
                return DropdownMenuItem<int>(value: qty, child: Text('$qty'));
              }).toList(),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
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
