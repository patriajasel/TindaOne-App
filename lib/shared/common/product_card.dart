import 'package:flutter/material.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class ProductCard extends StatelessWidget {
  final String productId;
  final String name;
  final String photo;
  final List<String> sizes;
  final int supply;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.productId,
    required this.name,
    required this.photo,
    required this.sizes,
    required this.supply,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProductImage(context),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductName(context),
                    const Spacer(),
                    _buildStockInfo(context),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.3),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Stack(
          children: [
            Image.network(
              photo,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
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
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),  
                      ),
                    ],
                  ),
                );
              },
            ),
            if (supply == 0)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'OUT OF STOCK',
                        style: context.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductName(BuildContext context) {
    return Text(
      name,
      style: context.textTheme.titleSmall,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildStockInfo(BuildContext context) {
    Color stockColor;
    String stockText;
    IconData stockIcon;

    if (supply == 0) {
      stockColor = Theme.of(context).colorScheme.error;
      stockText = 'Out of Stock';
      stockIcon = Icons.remove_circle_outline;
    } else if (supply <= 10) {
      stockColor = Theme.of(context).colorScheme.secondary;
      stockText = 'Low Stock ($supply left)';
      stockIcon = Icons.warning_amber_outlined;
    } else {
      stockColor = Theme.of(context).colorScheme.primary;
      stockText = 'In Stock ($supply available)';
      stockIcon = Icons.check_circle_outline;
    }

    return Row(
      children: [
        Icon(stockIcon, size: 16, color: stockColor),
        const SizedBox(width: 4),
        Text(
          stockText,
          style: context.textTheme.bodySmall?.copyWith(color: stockColor),
        ),
      ],
    );
  }
}
