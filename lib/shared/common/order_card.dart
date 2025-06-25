import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final int amount;
  final DateTime orderDate;
  final VoidCallback? onViewItems;
  const OrderCard({
    super.key,
    required this.orderId,
    required this.amount,
    required this.orderDate,
    this.onViewItems,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Container(
        height: 130,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text('Order #: $orderId', style: context.titleSmall),
                  const Spacer(),
                  Text(
                    'Amount: Php ${amount.toStringAsFixed(2)}',
                    style: context.labelSmall,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    DateFormat('MMM dd, yyy | hh:mm aa').format(orderDate),
                    style: context.bodySmall,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: ElevatedButton(
                      onPressed: onViewItems,
                      child: Text('View Items'),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
