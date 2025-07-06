import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/features/pages/presentation/transactions/replace_item_dialog/replace_item_dialog.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class ViewOrderDetailsDialog extends StatelessWidget {
  const ViewOrderDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDialogHeader(context),
          const SizedBox(height: 20),
          _buildOrderedItemList(),
          const SizedBox(height: 20),
          _buildTotalAmount(context),
          const SizedBox(height: 20),
          _buildActionButtons(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDialogHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: AppColors.appTertiary.withValues(alpha: 0.2),
      child: Row(
        children: [
          Icon(Icons.shopping_basket, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            'Ordered Items',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.appPrimary),
          ),
          const Spacer(),
          IconButton(onPressed: () => context.pop(), icon: Icon(Icons.close)),
        ],
      ),
    );
  }

  Widget _buildOrderedItemList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildOrderedItems(context);
      },
    );
  }

  Widget _buildOrderedItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Product Name',
                style: context.bodySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Center(child: Text('S', style: context.bodySmall)),
                ),
              ),
              Text('x', style: context.bodySmall),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Center(child: Text('1', style: context.bodySmall)),
                ),
              ),
              VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Text('Amount: Php 100', style: context.bodySmall),
                    Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) => ReplaceItemDialog(),
                            ),
                            icon: Icon(Icons.change_circle),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.archive),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildTotalAmount(BuildContext context) {
    return ListTile(
      leading: Text(
        'Total Amount:',
        style: context.labelSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        'Php 300',
        style: context.labelSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
              icon: Icon(Icons.arrow_back, color: AppColors.lightBackground),
              label: Text('Back'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(Icons.check),
              onPressed: () {
                context.pop();
              },
              label: Text('Confirm Changes'),
            ),
          ),
        ],
      ),
    );
  }
}
