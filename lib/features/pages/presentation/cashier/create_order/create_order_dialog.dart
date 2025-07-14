import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/features/pages/domain/order_model.dart';
import 'package:tinda_one_app/features/pages/presentation/cashier/inclusion_dialog/inclusion_dialog.dart';
import 'package:tinda_one_app/shared/common/item_counter.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class CreateOrderDialog extends HookWidget {
  final ValueNotifier<List<OrderItems>> cartItems;
  const CreateOrderDialog({super.key, required this.cartItems});

  void _updateCartItemQuantity({
    required ValueNotifier<int> itemCount,
    required OrderItems item,
  }) {
    // Update the cart items list
    if (itemCount.value <= 0) {
      // Remove item if quantity is 0 or less
      cartItems.value = cartItems.value
          .where((cartItem) => cartItem.productId != item.productId)
          .toList();
    } else {
      // Create updated item with new quantity
      final updatedItem = item.copyWith(quantity: itemCount.value);

      // Update existing item or add new item
      final existingItemIndex = cartItems.value.indexWhere(
        (cartItem) => cartItem.productId == item.productId,
      );

      if (existingItemIndex != -1) {
        // Update existing item
        final updatedList = List<OrderItems>.from(cartItems.value);
        updatedList[existingItemIndex] = updatedItem;
        cartItems.value = updatedList;
      } else {
        // Add new item to cart
        cartItems.value = [...cartItems.value, updatedItem];
      }
    }
  }

  void _updateCartItemSizeQuantity({
    required ValueNotifier<int> itemCount,
    required OrderItems item,
    required int sizeIndex,
  }) {
    final existingItemIndex = cartItems.value.indexWhere(
      (cartItem) => cartItem.productId == item.productId,
    );

    if (existingItemIndex != -1) {
      final updatedList = List<OrderItems>.from(cartItems.value);
      final existingItem = updatedList[existingItemIndex];

      if (existingItem.itemList != null && existingItem.itemList!.isNotEmpty) {
        // Update the specific size quantity
        final updatedItemList = List<ItemList>.from(existingItem.itemList!);

        if (sizeIndex < updatedItemList.length) {
          if (itemCount.value <= 0) {
            // Remove the size if quantity is 0 or less
            updatedItemList.removeAt(sizeIndex);

            // If no sizes left, remove the entire item
            if (updatedItemList.isEmpty) {
              cartItems.value = cartItems.value
                  .where((cartItem) => cartItem.productId != item.productId)
                  .toList();
            } else {
              // Update item with remaining sizes
              final updatedItem = existingItem.copyWith(
                itemList: updatedItemList,
              );
              updatedList[existingItemIndex] = updatedItem;
              cartItems.value = updatedList;
            }
          } else {
            // Update the quantity for this size
            updatedItemList[sizeIndex] = updatedItemList[sizeIndex].copyWith(
              quantity: itemCount.value,
            );

            final updatedItem = existingItem.copyWith(
              itemList: updatedItemList,
            );
            updatedList[existingItemIndex] = updatedItem;
            cartItems.value = updatedList;
          }
        }
      }
    }
  }

  int _getTotalCartAmount() {
    int totalAmount = 0;

    for (var cartItem in cartItems.value) {
      if (cartItem.itemList != null && cartItem.itemList!.isNotEmpty) {
        // For items with sizes, calculate total from itemList
        int itemListTotal = cartItem.itemList!.fold(
          0,
          (sum, sizes) => sum + (sizes.price * sizes.quantity),
        );
        totalAmount += itemListTotal;
      } else {
        // For items without sizes, use the item's price and quantity
        if (cartItem.price != null && cartItem.quantity != null) {
          totalAmount += (cartItem.price! * cartItem.quantity!);
        }
      }
    }

    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildDialogHeader(context),
            const SizedBox(height: 10),
            _buildItemList(context),

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

  Widget _buildItemList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ValueListenableBuilder<List<OrderItems>>(
        valueListenable: cartItems,
        builder: (context, items, child) {
          if (cartItems.value.isEmpty) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'You have no items added in cart.',
                  style: context.labelSmall,
                ),
              ),
            );
          }

          return Column(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final itemList = items[index].itemList ?? [];

              if (itemList.isEmpty) {
                return _buildItemWithoutSize(context, item: item);
              } else {
                return _buildItemWithSize(context, item: item);
              }
            }),
          );
        },
      ),
    );
  }

  Widget _buildItemWithoutSize(
    BuildContext context, {
    required OrderItems item,
  }) {
    final itemCount = ValueNotifier<int>(item.quantity ?? 0);
    final amount = itemCount.value * item.price!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                item.name,
                style: context.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ItemCounter(
                count: itemCount,
                onCountChanged: () =>
                    _updateCartItemQuantity(item: item, itemCount: itemCount),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.pesoSign,
                    color: AppColors.appSecondary,
                  ),
                  Text(
                    amount.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget _buildItemWithSize(BuildContext context, {required OrderItems item}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: context.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: item.itemList?.length,
          itemBuilder: (context, index) {
            final size = item.itemList?[index].size;
            final quantity = item.itemList![index].quantity;
            final amount = item.itemList![index].price * quantity;
            final sizeItemCount = ValueNotifier<int>(quantity);

            return Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        size ?? '',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ItemCounter(
                    count: sizeItemCount,
                    onCountChanged: () => _updateCartItemSizeQuantity(
                      item: item,
                      itemCount: sizeItemCount,
                      sizeIndex: index,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.pesoSign,
                        color: AppColors.appSecondary,
                      ),
                      Text(
                        amount.toStringAsFixed(2),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        Divider(),
      ],
    );
  }

  Widget _buildInclusionOption(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ValueListenableBuilder<List<OrderItems>>(
        valueListenable: cartItems,
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Inclusions:',
                  style: context.textTheme.displaySmall,
                ),
              ),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: cartItems.value.isEmpty
                      ? null
                      : () {
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
          );
        },
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
      child: ValueListenableBuilder<List<OrderItems>>(
        valueListenable: cartItems,
        builder: (context, items, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  'Total Amount:',
                  style: context.textTheme.displaySmall,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.pesoSign,
                    color: AppColors.appSecondary,
                  ),
                  Text(
                    _getTotalCartAmount().toStringAsFixed(2),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ValueListenableBuilder<List<OrderItems>>(
        valueListenable: cartItems,
        builder: (context, value, child) {
          return Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.appSecondary,
                    ),
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
                  onPressed: cartItems.value.isEmpty
                      ? null
                      : () {
                          context.push('/checkout-page');
                        },
                  label: Text('Go to Checkout'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
