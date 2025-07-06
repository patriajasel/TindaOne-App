import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/edit_product_dialog/edit_product_dialog.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class ViewProductDialog extends StatelessWidget {
  const ViewProductDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDialogHeader(context),
          const SizedBox(height: 20),
          _buildProductImage(context),
          const SizedBox(height: 20),
          _buildAvailableSizes(context),
          const SizedBox(height: 20),
          _buildInclusionOption(context, isInclusion: false),
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
          Icon(Icons.sell, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            'Blouse (Blue)',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.appPrimary),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => EditProductDialog(),
              );
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.delete, color: AppColors.error),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  title: Text('Total Supply: ', style: context.bodySmall),
                  trailing: Text('100', style: context.bodySmall),
                ),

                ListTile(
                  title: Text('Price: ', style: context.bodySmall),
                  trailing: Text('Php 100', style: context.bodySmall),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableSizes(BuildContext context) {
    List<String> sizes = [
      '8',
      '10',
      '12',
      '14',
      '16',
      '18',
      '20',
      '22',
      '24',
      'XS',
      'S',
      'M',
      'L',
      'XL',
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Sizes:',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sizes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1.5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              final size = sizes[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                child: Center(child: Text(size, style: context.bodySmall)),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInclusionOption(
    BuildContext context, {
    required bool isInclusion,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Can this product become an inclusion?',
            style: context.bodySmall,
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text('Yes', style: context.textTheme.bodySmall),
                  value: true,
                  groupValue: isInclusion,
                  onChanged: null,
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text('No', style: context.textTheme.bodySmall),
                  value: false,
                  groupValue: isInclusion,
                  onChanged: null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
