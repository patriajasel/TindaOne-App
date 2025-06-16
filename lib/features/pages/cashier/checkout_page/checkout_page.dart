import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(child: _buildMainContent(context)),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      children: [
        _buildReceiptPhoto(),
        const SizedBox(height: 10),
        _buildActionButtons(context),
      ],
    );
  }

  Widget _buildReceiptPhoto() {
    // This is a placeholder for a receipt
    return Column(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          margin: EdgeInsets.all(40),
          color: AppColors.appTertiary,
          child: Center(
            child: Text('This is a placeholder', textAlign: TextAlign.center),
          ),
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.receipt),
            label: Text('Print Receipt'),
          ),
        ),
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
              label: Text('Cancel Order'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(Icons.payment),
              onPressed: () {
                context.pop();
              },
              label: Text('Confirm Payment'),
            ),
          ),
        ],
      ),
    );
  }
}
