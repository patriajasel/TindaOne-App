import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/features/pages/presentation/cashier/inclusion_dialog/inclusion_dialog.dart';
import 'package:tinda_one_app/shared/common/item_counter.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class CreateOrderDialog extends HookWidget {
  const CreateOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final countNotifier = useState<int>(1);
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildDialogHeader(context),
            const SizedBox(height: 10),
            _buildItemList(context, itemCount: countNotifier),

            const SizedBox(height: 10),
            _buildInclusionOption(context),

            const SizedBox(height: 10),
            _buildDiscountSection(context),

            const SizedBox(height: 20),
            _buildTotalAmount(context),

            const SizedBox(height: 20),
            _buildActionButtons(context),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: AppColors.appTertiary.withValues(alpha: 0.2),
      child: Row(
        children: [
          Icon(Icons.shopping_cart_checkout, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            'Item List',
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

  Widget _buildItemList(
    BuildContext context, {
    required ValueNotifier<int> itemCount,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: List.generate(5, (index) {
          return _buildItem(context, countNotifier: itemCount);
        }),
      ),
    );
  }

  Widget _buildItem(
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  'S',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ItemCounter(count: countNotifier),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.pesoSign),
                  Text('500', style: Theme.of(context).textTheme.displaySmall),
                ],
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget _buildInclusionOption(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text('Inclusions:', style: context.textTheme.displaySmall),
          ),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => InclusionDialog(),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Add Item'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text('Discount:', style: context.textTheme.displaySmall),
          ),
          Expanded(
            child: TextField(
              style: context.bodyMedium,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalAmount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text('Total Amount:', style: context.textTheme.displaySmall),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.pesoSign),
              Text(
                '1500',
                style: Theme.of(
                  context,
                ).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
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
              label: Text('Cancel Order'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(Icons.shopping_cart_checkout),
              onPressed: () {
                context.push('/checkout-page');
              },
              label: Text('Go to Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
