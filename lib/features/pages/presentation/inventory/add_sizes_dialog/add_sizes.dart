import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/add_sizes_dialog/validators/add_sizes_validators.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class AddSizesDialog extends HookWidget {
  final ValueNotifier<List<ProductSizes>?> productSizes;
  const AddSizesDialog({super.key, required this.productSizes});

  @override
  Widget build(BuildContext context) {
    final sizeController = useTextEditingController();
    final supplyController = useTextEditingController();
    final priceController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>(), []);

    return Dialog(
      child: Container(
        constraints: BoxConstraints(maxHeight: 350),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildDialogHeader(context),
              Form(
                key: formKey,
                child: _buildSizeForm(
                  context,
                  formKey,
                  sizeController: sizeController,
                  supplyController: supplyController,
                  amountController: priceController,
                ),
              ),
            ],
          ),
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
    BuildContext context,
    GlobalKey<FormState> formKey, {
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

          const SizedBox(height: 20),
          _buildActionButtons(
            context,
            formKey,
            sizeController: sizeController,
            supplyController: supplyController,
            amountController: amountController,
          ),
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
      validator: AddSizesValidators.size,
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
      validator: AddSizesValidators.supply,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
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
      validator: AddSizesValidators.amount,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    required TextEditingController sizeController,
    required TextEditingController supplyController,
    required TextEditingController amountController,
  }) {
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
            label: Text('Add Size'),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                _addSizes(
                  context,
                  sizeController: sizeController,
                  amountController: amountController,
                  supplyController: supplyController,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  void _addSizes(
    BuildContext context, {
    required TextEditingController sizeController,
    required TextEditingController supplyController,
    required TextEditingController amountController,
  }) {
    // Create a ProductSizes Data
    final productSizesData = ProductSizes(
      size: sizeController.text,
      price: int.parse(amountController.text),
      supply: int.parse(supplyController.text),
    );

    // Initialize the list if it's null
    if (productSizes.value == null) {
      productSizes.value = <ProductSizes>[];
    }

    // Create a new list with the existing items plus the new one
    final updatedList = List<ProductSizes>.from(productSizes.value!)
      ..add(productSizesData);

    // Update the ValueNotifier with the new list (this triggers rebuild)
    productSizes.value = updatedList;

    // Pop the dialog
    context.pop();
  }
}
