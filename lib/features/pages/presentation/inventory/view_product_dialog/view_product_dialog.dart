import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinda_one_app/features/pages/application/product_providers.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/edit_product_dialog/edit_product_dialog.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class ViewProductDialog extends ConsumerWidget {
  final ProductModel product;
  const ViewProductDialog({super.key, required this.product});

  Future<void> _deleteProduct(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(
        deleteProductProvider(productId: product.productId).future,
      );

      ref.invalidate(fetchAllProductsProvider);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product was deleted successfully'),
            backgroundColor: AppColors.appTertiary,
            duration: Duration(seconds: 3),
          ),
        );

        context.pop();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete product: ${e.toString()}'),
            backgroundColor: AppColors.error,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDialogHeader(context, ref),
          const SizedBox(height: 20),
          _buildProductImage(context),
          const SizedBox(height: 20),
          _buildAvailableSizes(context),
          const SizedBox(height: 20),
          _buildInclusionOption(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDialogHeader(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(10),
      color: AppColors.appTertiary.withValues(alpha: 0.2),
      child: Row(
        children: [
          Icon(Icons.sell, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            product.name,
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
                builder: (context) => EditProductDialog(product: product),
              );
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () async => _deleteProduct(context, ref),
            icon: Icon(Icons.delete, color: AppColors.error),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    // Get the total
    final totalSupply =
        product.supply ??
        product.productSizes?.fold(0, (sum, sizes) => sum! + sizes.supply);

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
                child: product.image == null
                    ? Image.asset(
                        'lib/shared/assets/sales_display.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.file(File(product.image ?? ''), fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  title: Text('Total Supply: ', style: context.bodySmall),
                  trailing: Text(
                    totalSupply.toString(),
                    style: context.bodySmall,
                  ),
                ),

                if (product.price != null)
                  ListTile(
                    title: Text('Price: ', style: context.bodySmall),
                    trailing: Text(
                      product.price!.toStringAsFixed(2),
                      style: context.bodySmall,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableSizes(BuildContext context) {
    return product.productSizes != null
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Size',
                          style: context.bodySmall?.copyWith(
                            color: AppColors.appPrimary,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Price',
                            style: context.bodySmall?.copyWith(
                              color: AppColors.appPrimary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'Supply',
                          style: context.bodySmall?.copyWith(
                            color: AppColors.appPrimary,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: product.productSizes?.length,
                      itemBuilder: (context, index) {
                        return _buildSizes(
                          context,
                          sizesData: product.productSizes![index],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        : SizedBox();
  }

  Widget _buildSizes(BuildContext context, {required ProductSizes sizesData}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(sizesData.size, style: context.labelSmall)),
          SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  FontAwesomeIcons.pesoSign,
                  size: 20,
                  color: AppColors.appSecondary,
                ),
                const Spacer(),
                Text(
                  sizesData.price.toStringAsFixed(2),
                  style: context.labelSmall,
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              sizesData.supply.toString(),
              style: context.labelSmall,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInclusionOption(BuildContext context) {
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
                  groupValue: product.isInclusion,
                  onChanged: null,
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text('No', style: context.textTheme.bodySmall),
                  value: false,
                  groupValue: product.isInclusion,
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
