import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinda_one_app/features/pages/application/product_providers.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/add_product_dialog/validators/add_product_validators.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/add_sizes_dialog/add_sizes.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';
import 'package:uuid/uuid.dart';

class AddProductDialog extends HookConsumerWidget {
  const AddProductDialog({super.key});

  // Select Image using Image Picker
  Future<void> _uploadImage(
    BuildContext context, {
    required ImagePicker picker,
    required ValueNotifier<File?> selectedImage
  }) async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to upload image: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  // Add the product to hive box
  Future<void> _addProducts(
    BuildContext context,
    WidgetRef ref, {
    required TextEditingController productNameController,
    required ValueNotifier<String> selectedOption,
    required TextEditingController amountController,
    required TextEditingController supplyController,
    required ValueNotifier<bool> isInclusion,
    required ValueNotifier<File?> selectedImage,
    required ValueNotifier<List<ProductSizes>?> productSizes,
  }) async {
    // Create a product Id
    final productId = Uuid().v4();

    // Create a product model
    final productData = ProductModel(
      productId: productId,
      name: productNameController.text,
      isInclusion: isInclusion.value,
      priceType: selectedOption.value,
      price: amountController.text == ''
          ? null
          : int.parse(amountController.text),
      supply: supplyController.text == ''
          ? null
          : int.parse(amountController.text),
      productSizes: productSizes.value,
    );

    try {
      await ref.read(
        createProductProvider(
          product: productData,
          imageFile: selectedImage.value,
        ).future,
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product was added successfully'),
            backgroundColor: AppColors.appTertiary,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add product: ${e.toString()}'),
            backgroundColor: AppColors.error,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    final selectedImage = useState<File?>(null);
    final productSizes = useState<List<ProductSizes>?>(null);

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
                ref,
                formKey: formKey,
                productNameController: productNameController,
                priceOptions: priceOptions.value,
                selectedOption: selectedPriceOption,
                amountController: amountController,
                supplyController: supplyController,
                isInclusion: isInclusion,
                selectedImage: selectedImage,
                productSizes: productSizes,
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
          Icon(Icons.add, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            'Add Product',
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
    BuildContext context,
    WidgetRef ref, {
    required GlobalKey<FormState> formKey,
    required TextEditingController productNameController,
    required List<String> priceOptions,
    required ValueNotifier<String> selectedOption,
    required TextEditingController amountController,
    required TextEditingController supplyController,
    required ValueNotifier<bool> isInclusion,
    required ValueNotifier<File?> selectedImage,
    required ValueNotifier<List<ProductSizes>?> productSizes,
  }) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _buildUploadImage(context, selectedImage: selectedImage),
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
            productSizes: productSizes,
          ),

          const SizedBox(height: 30),

          _buildInclusionOption(context, isInclusion: isInclusion),

          const SizedBox(height: 10),

          _buildActionButtons(
            context,
            ref,
            formKey,
            productNameController: productNameController,
            amountController: amountController,
            isInclusion: isInclusion,
            productSizes: productSizes,
            selectedImage: selectedImage,
            selectedOption: selectedOption,
            supplyController: supplyController,
          ),
        ],
      ),
    );
  }

  Widget _buildUploadImage(
    BuildContext context, {
    required ValueNotifier<File?> selectedImage,
  }) {
    final ImagePicker picker = ImagePicker();

    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.appSecondary, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 180,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: selectedImage.value == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported,
                          color: AppColors.appSecondary,
                        ),
                        Text(
                          'No Image has been uploaded yet',
                          style: context.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Image.file(selectedImage.value!, fit: BoxFit.cover),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              // Elevated button for uploading image
              ElevatedButton.icon(
                onPressed: () async => await _uploadImage(
                  context,
                  picker: picker,
                  selectedImage: selectedImage,
                ),
                icon: Icon(Icons.upload),
                label: Text('Upload Photo'),
              ),

              // Elevated button for removing photo
              if (selectedImage.value != null)
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.image_not_supported),
                  label: Text('Remove Photo'),
                ),

              // Elevated button for generating bar code
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.qr_code_2),
                label: Text('Generate Bar Code'),
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
      validator: AddProductValidators.productName,
    );
  }

  Widget _buildPriceOption(
    BuildContext context, {
    required List<String> priceOptions,
    required ValueNotifier<String> selectedOption,
    required TextEditingController amountController,
    required TextEditingController supplyController,
    required ValueNotifier<List<ProductSizes>?> productSizes,
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

        if (selectedOption.value == 'Price by Size')
          _buildPriceBySize(context, productSizes: productSizes),
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

  Widget _buildPriceBySize(
    BuildContext context, {
    required ValueNotifier<List<ProductSizes>?> productSizes,
  }) {
    return Column(
      children: [
        if (productSizes.value == null || productSizes.value!.isEmpty)
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'No sizes have been added yet.',
                style: context.bodySmall,
              ),
            ),
          )
        else
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
                itemCount: productSizes.value?.length,
                itemBuilder: (context, index) {
                  return _buildAddedSizes(
                    context,
                    sizesData: productSizes.value![index],
                  );
                },
              ),
            ],
          ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: ElevatedButton.icon(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AddSizesDialog(productSizes: productSizes),
            ),
            icon: Icon(Icons.straighten),
            label: Text('Add Sizes'),
          ),
        ),
      ],
    );
  }

  Widget _buildAddedSizes(
    BuildContext context, {
    required ProductSizes sizesData,
  }) {
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
      validator: AddProductValidators.amount,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
      validator: AddProductValidators.supply,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey, {
    required TextEditingController productNameController,
    required ValueNotifier<String> selectedOption,
    required TextEditingController amountController,
    required TextEditingController supplyController,
    required ValueNotifier<bool> isInclusion,
    required ValueNotifier<File?> selectedImage,
    required ValueNotifier<List<ProductSizes>?> productSizes,
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
            onPressed: () {
              if (formKey.currentState!.validate()) {
                _addProducts(
                  context,
                  ref,
                  amountController: amountController,
                  isInclusion: isInclusion,
                  productNameController: productNameController,
                  productSizes: productSizes,
                  selectedImage: selectedImage,
                  selectedOption: selectedOption,
                  supplyController: supplyController,
                );
              }
            },
            label: Text('Add Product'),
          ),
        ),
      ],
    );
  }
}
