import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class AddSizes extends HookWidget {
  const AddSizes({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeController = useTextEditingController();
    final supplyController = useTextEditingController();
    final priceController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>(), []);

    return Dialog(
      child: Container(
        constraints: BoxConstraints(maxHeight: 350),
        child: Column(
          children: [
            _buildDialogHeader(context),
            Form(
              key: formKey,
              child: _buildSizeForm(
                context,
                sizeController: sizeController,
                supplyController: supplyController,
                amountController: priceController,
              ),
            ),
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
          Icon(Icons.straighten, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            'Add Size',
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

  Widget _buildSizeForm(
    BuildContext context, {
    required TextEditingController sizeController,
    required TextEditingController supplyController,
    required TextEditingController amountController,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildSizeTextField(context, controller: sizeController),

          const SizedBox(height: 10),
          _buildSupplyTextField(context, controller: supplyController),

          const SizedBox(height: 10),
          _buildAmountTextField(context, controller: amountController),

          const SizedBox(height: 30),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildSizeTextField(
    BuildContext context, {
    required TextEditingController controller,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text('Size'),
        prefixIcon: Icon(Icons.straighten),
      ),
      style: context.bodySmall,
      controller: controller,
      //validator: LoginValidators.email,
    );
  }

  Widget _buildSupplyTextField(
    BuildContext context, {
    required TextEditingController controller,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text('Supply'),
        prefixIcon: Icon(Icons.inventory),
      ),
      style: context.bodySmall,
      controller: controller,
      //validator: LoginValidators.email,
    );
  }

  Widget _buildAmountTextField(
    BuildContext context, {
    required TextEditingController controller,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text('Amount'),
        prefixIcon: Icon(FontAwesomeIcons.pesoSign, size: 20),
      ),
      style: context.bodySmall,
      controller: controller,
      //validator: LoginValidators.email,
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
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
            icon: Icon(Icons.add),
            onPressed: () {
              context.pop();
            },
            label: Text('Add Size'),
          ),
        ),
      ],
    );
  }
}
