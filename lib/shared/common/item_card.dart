import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class ItemCard extends StatelessWidget {
  final String productId;
  final String name;
  final String? imageUrl;
  final List<ProductSizes>? productSizes;
  final int? supply;
  final VoidCallback? onPressed;

  const ItemCard({
    super.key,
    required this.productId,
    required this.name,
    this.imageUrl,
    this.productSizes,
    this.supply,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: Container(
          height: 130,
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImageContainer(context),
              const SizedBox(width: 16),
              Expanded(child: _buildProductDetails(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: imageUrl == null
          ? Image.asset(
              'lib/shared/assets/sales_display.png',
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            )
          : Image.file(
              File(imageUrl ?? ''),
              width: 80,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Theme.of(context).colorScheme.tertiary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_not_supported_outlined,
                        size: 32,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Image not available',
                        style: context.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        if (supply != null)
          Text(
            'Total Supply: $supply',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        if (productSizes != null)
          Text(
            'Sizes Available:',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        const SizedBox(height: 6),
        if (productSizes != null)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: productSizes!
                  .map(
                    (productSize) => Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade100,
                      ),
                      child: Text(
                        productSize.size,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}
