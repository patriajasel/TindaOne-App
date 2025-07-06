import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/add_sizes_dialog/add_sizes.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class EditProductDialog extends HookWidget {
  const EditProductDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);

    final productNameController = useTextEditingController();
    final priceOptions = useState<List<String>>([
      'Fixed Price',
      'Price by Size',
    ]);
    final selectedPriceOption = useState<String>(priceOptions.value.first);
    final amountController = useTextEditingController();
    final supplyController = useTextEditingController();

    final isInclusion = useState<bool>(false);

    return FractionallySizedBox(
      heightFactor: 0.8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDialogHeader(context),
            const SizedBox(height: 10),
            Form(
              key: formKey,
              child: _buildAddProductForm(
                context,
                productNameController: productNameController,
                priceOptions: priceOptions.value,
                selectedOption: selectedPriceOption,
                amountController: amountController,
                supplyController: supplyController,
                isInclusion: isInclusion,
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
          Icon(Icons.edit, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            'Edit Product',
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

  Widget _buildAddProductForm(
    BuildContext context, {
    required TextEditingController productNameController,
    required List<String> priceOptions,
    required ValueNotifier<String> selectedOption,
    required TextEditingController amountController,
    required TextEditingController supplyController,
    required ValueNotifier<bool> isInclusion,
  }) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _buildUploadImage(),
          const SizedBox(height: 20),
          _buildProductNameTextField(
            context,
            controller: productNameController,
          ),
          const SizedBox(height: 10),
          _buildPriceOption(
            context,
            priceOptions: priceOptions,
            selectedOption: selectedOption,
            amountController: amountController,
            supplyController: supplyController,
          ),

          const SizedBox(height: 30),

          _buildInclusionOption(context, isInclusion: isInclusion),

          const SizedBox(height: 10),

          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildUploadImage() {
    return Row(
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
              ElevatedButton(onPressed: () {}, child: Text('Upload Photo')),
              ElevatedButton(onPressed: () {}, child: Text('Remove Photo')),
              ElevatedButton(
                onPressed: () {},
                child: Text('Generate Bar Code'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductNameTextField(
    BuildContext context, {
    required TextEditingController controller,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text('Product Name'),
        prefixIcon: Icon(Icons.title),
      ),
      style: context.bodySmall,
      controller: controller,
      //validator: LoginValidators.email,
    );
  }

  Widget _buildPriceOption(
    BuildContext context, {
    required List<String> priceOptions,
    required ValueNotifier<String> selectedOption,
    required TextEditingController amountController,
    required TextEditingController supplyController,
  }) {
    return Column(
      children: [
        Row(
          children: priceOptions.map((option) {
            return Expanded(
              child: RadioListTile<String>(
                contentPadding: const EdgeInsets.all(0),
                title: Text(option, style: context.textTheme.bodySmall),
                value: option,
                groupValue: selectedOption.value,
                onChanged: (value) {
                  if (value != null) {
                    selectedOption.value = value;
                  }
                },
              ),
            );
          }).toList(),
        ),

        if (selectedOption.value == 'Fixed Price')
          _buildFixedPriceAndSupply(
            context,
            selectedOption: selectedOption,
            amountController: amountController,
            supplyController: supplyController,
          ),

        if (selectedOption.value == 'Price by Size') _buildPriceBySize(context),
      ],
    );
  }

  Widget _buildFixedPriceAndSupply(
    BuildContext context, {
    required ValueNotifier<String> selectedOption,
    required TextEditingController amountController,
    required TextEditingController supplyController,
  }) {
    return Column(
      children: [
        _buildAmountTextField(context, controller: amountController),

        const SizedBox(height: 10),

        _buildSupplyTextField(context, controller: supplyController),
      ],
    );
  }

  Widget _buildPriceBySize(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddSizesDialog(),
              );
            },
            icon: Icon(Icons.straighten),
            label: Text('Add Sizes'),
          ),
        ),
      ],
    );
  }

  Widget _buildInclusionOption(
    BuildContext context, {
    required ValueNotifier<bool> isInclusion,
  }) {
    return Column(
      children: [
        Text(
          'Do you want to include this product as an inclusion?',
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<bool>(
                contentPadding: const EdgeInsets.all(0),
                title: Text('Yes', style: context.textTheme.bodySmall),
                value: true,
                groupValue: isInclusion.value,
                onChanged: (value) {
                  if (value != null) {
                    isInclusion.value = value;
                  }
                },
              ),
            ),
            Expanded(
              child: RadioListTile<bool>(
                contentPadding: const EdgeInsets.all(0),
                title: Text('No', style: context.textTheme.bodySmall),
                value: false,
                groupValue: isInclusion.value,
                onChanged: (value) {
                  if (value != null) {
                    isInclusion.value = value;
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAmountTextField(
    BuildContext context, {
    required TextEditingController controller,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text('Amount'),
        prefixIcon: Icon(FontAwesomeIcons.pesoSign, size: 15),
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
        label: Text('Supply Amount'),
        prefixIcon: Icon(Icons.inventory, size: 15),
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
            icon: Icon(Icons.save),
            onPressed: () {
              context.pop();
            },
            label: Text('Save'),
          ),
        ),
      ],
    );
  }
}
