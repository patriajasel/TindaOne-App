import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinda_one_app/features/pages/application/order_providers.dart';
import 'package:tinda_one_app/features/pages/domain/order_model.dart';
import 'package:tinda_one_app/features/pages/presentation/cashier/inclusion_dialog/inclusion_dialog.dart';
import 'package:tinda_one_app/shared/common/item_counter.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';
import 'package:uuid/uuid.dart';

class CreateOrderDialog extends HookConsumerWidget {
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

  int _getTotalCartAmount({required int discountAmount}) {
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

    return totalAmount - discountAmount;
  }

  Future<void> _createOrder(
    BuildContext context,
    WidgetRef ref, {
    required List<OrderItems> orderItems,
    required int totalAmount,
    required int discountAmount,
    required List<OrderInclusion> orderInclusion,
  }) async {
    // Create Order ID
    final orderId = Uuid().v4();

    // Date Time now
    final now = DateTime.now();

    // Create Order Model
    final orderData = OrderModel(
      orderId: orderId,
      date: now,
      items: orderItems,
      totalAmount: totalAmount,
      discount: discountAmount,
      inclusion: orderInclusion,
    );

    try {
      await ref.read(createOrderProvider(order: orderData).future);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Order created successfully'),
            backgroundColor: AppColors.appTertiary,
            duration: Duration(seconds: 3),
          ),
        );

        context.push('/checkout-page');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create order: ${e.toString()}'),
            backgroundColor: AppColors.error,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discountController = useTextEditingController();
    useListenable(discountController);

    final orderInclusions = useState<List<OrderInclusion>>([]);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildDialogHeader(context),
            const SizedBox(height: 10),
            _buildItemList(context),

            const SizedBox(height: 10),
            _buildInclusionOption(context, orderInclusions: orderInclusions),

            const SizedBox(height: 10),
            _buildDiscountSection(context, controller: discountController),

            const SizedBox(height: 20),
            _buildTotalAmount(context, discountController: discountController),

            const SizedBox(height: 20),
            _buildActionButtons(
              context,
              ref,
              orderItems: cartItems,
              orderInclusion: orderInclusions,
              discountAmount: int.parse(discountController.text),
            ),

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

  Widget _buildInclusionOption(
    BuildContext context, {
    required ValueNotifier<List<OrderInclusion>> orderInclusions,
  }) {
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
                            builder: (context) => InclusionDialog(
                              orderInclusions: orderInclusions,
                            ),
                          );
                        },
                  icon: Icon(
                    orderInclusions.value.isNotEmpty
                        ? Icons.visibility
                        : Icons.add,
                  ),
                  label: Text(
                    orderInclusions.value.isNotEmpty
                        ? 'View Items'
                        : 'Add Items',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDiscountSection(
    BuildContext context, {
    required TextEditingController controller,
  }) {
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
              controller: controller,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalAmount(
    BuildContext context, {
    required TextEditingController discountController,
  }) {
    final discountAmount = int.parse(
      discountController.text == '' ? '0' : discountController.text,
    );

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
                    _getTotalCartAmount(
                      discountAmount: discountAmount,
                    ).toStringAsFixed(2),
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

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref, {
    required ValueNotifier<List<OrderItems>> orderItems,
    required ValueNotifier<List<OrderInclusion>> orderInclusion,
    required int discountAmount,
  }) {
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
                      : () async => _createOrder(
                          context,
                          ref,
                          orderItems: orderItems.value,
                          orderInclusion: orderInclusion.value,
                          discountAmount: discountAmount,
                          totalAmount: _getTotalCartAmount(
                            discountAmount: discountAmount,
                          ),
                        ),
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
