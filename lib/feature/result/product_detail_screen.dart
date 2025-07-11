import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fskeleton/app/data/wms/model/wms_category/wms_category.dart';
import 'package:fskeleton/app/navigation/router.dart';
import 'package:fskeleton/app/ui/buttons/my_text_button.dart';
import 'package:fskeleton/app/ui/my_text_field.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/app/utils/string_formatter.dart';
import 'package:fskeleton/feature/result/product_detail_controller.dart';
import 'package:fskeleton/feature/result/product_detail_params.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final ProductDetailParams params;
  const ProductDetailScreen({super.key, required this.params});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  late final TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(text: '1');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productDetailControllerProvider.notifier).onScreenLoaded();
    });
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productDetailControllerProvider);
    final controller = ref.read(productDetailControllerProvider.notifier);

    ref.listen(productDetailControllerProvider.select((s) => s.navigateBack),
        (previous, next) {
      if (next != null) {
        context.goNamed(AppRouter.successRoute);
      }
    });

    final isSaveButtonEnabled =
        state.selectedStatus != null && state.quantity > 0 && !state.isSaving;

    return Scaffold(
      backgroundColor: MyColors.white,
      bottomNavigationBar: _buildBottomButtons(
        isSaveButtonEnabled: isSaveButtonEnabled,
        state: state,
        controller: controller,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 350,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: widget.params.localImagePath.isNotEmpty
                                ? Image.file(
                                    File(widget.params.localImagePath),
                                    fit: BoxFit.cover,
                                  )
                                : (widget.params.imageUrl != null &&
                                        widget.params.imageUrl!.isNotEmpty)
                                    ? CachedNetworkImage(
                                        imageUrl: widget.params.imageUrl!,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.image_not_supported_outlined,
                                          size: 50,
                                        ),
                                      )
                                    : const ColoredBox(
                                        color: MyColors.neutral40,
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 50,
                                          color: MyColors.neutral70,
                                        ),
                                      ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: CircleAvatar(
                            backgroundColor: MyColors.black.withOpacity(0.5),
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                color: MyColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.params.productName,
                              overflow: TextOverflow.visible,
                              softWrap: true,
                              style: MyText.lgSemiBold,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            widget.params.productPrice
                                .truncate()
                                .toCurrencyFormat(),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                            style: MyText.lgBold
                                .copyWith(color: MyColors.blueSource),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(color: MyColors.neutral40),
                    ),
                    const SizedBox(height: 20),
                    if (widget.params.listEcomerce.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Harga Tersebut Diambil dari:",
                          style: MyText.smSemiBold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _buildEcommerceList(widget.params.listEcomerce),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(color: MyColors.neutral40),
                      ),
                      const SizedBox(height: 20),
                    ],
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Kategori",
                        style: MyText.sm.copyWith(color: MyColors.neutral80),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildPickerField<Category>(
                        hintText: 'Pilih Kategori',
                        value: state.categories.whenData((categories) {
                          return categories
                              .firstWhere(
                                (c) => c.id == state.selectedCategoryId,
                                orElse: () => const Category(id: -1, name: ''),
                              )
                              .name;
                        }).value,
                        onTap: () {
                          state.categories.whenData((categories) {
                            _showPickerBottomSheet<Category>(
                              context: context,
                              title: 'Pilih Kategori', 
                              items: categories,
                              itemBuilder: (category) => Text(category.name),
                              onItemSelected: (category) =>
                                  controller.onCategoryChanged(category.id),
                              isValueSelected: (category) =>
                                  category.id == state.selectedCategoryId,
                            );
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Status",
                        style: MyText.sm.copyWith(color: MyColors.neutral80),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildPickerField<String>(
                        hintText: 'Pilih Status',
                        value: state.selectedStatus,
                        onTap: () {
                          _showPickerBottomSheet<String>(
                            context: context,
                            title: 'Pilih Status',
                            items: ['Lolos', 'Damaged', 'Abnormal'],
                            itemBuilder: (status) => Text(status),
                            onItemSelected: controller.onStatusChanged,
                            isValueSelected: (status) =>
                                status == state.selectedStatus,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MyTextField(
                        label: "Input Quantity",
                        controller: _quantityController,
                        keyboardType: TextInputType.number,
                        onChanged: controller.onQuantityChanged,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons({
    required bool isSaveButtonEnabled,
    required ProductDetailState state,
    required ProductDetailController controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: MyColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.neutral40),
                borderRadius: BorderRadius.circular(8),
              ),
              child: MyTextButton(
                label: Text(
                  "Scan Ulang",
                  style: MyText.smSemiBold.copyWith(color: MyColors.neutral80),
                ),
                onPressed: () => context.pop(),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isSaveButtonEnabled
                    ? MyColors.primary500
                    : MyColors.neutral30,
                borderRadius: BorderRadius.circular(8),
              ),
              child: MyTextButton(
                onPressed: isSaveButtonEnabled
                    ? () => controller.saveData(widget.params)
                    : null,
                label: state.isSaving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        "Simpan",
                        style: MyText.smSemiBold.copyWith(
                          color: MyColors.white,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEcommerceList(List<String> ecommerceNames) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 8.0,
      children: ecommerceNames.map((name) {
        return Text(
          "$name,",
          style: MyText.sm,
        );
      }).toList(),
    );
  }

  Widget _buildPickerField<T>({
    required String hintText,
    required String? value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value != null && value.isNotEmpty ? value : hintText,
              style: MyText.base.copyWith(
                color: value != null && value.isNotEmpty
                    ? MyColors.black
                    : MyColors.neutral70,
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: MyColors.neutral80),
          ],
        ),
      ),
    );
  }

  void _showPickerBottomSheet<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required Widget Function(T item) itemBuilder,
    required void Function(T item) onItemSelected,
    required bool Function(T item) isValueSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        String searchQuery = "";
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            List<T> filteredItems = items;
            if (T == Category && searchQuery.isNotEmpty) {
              filteredItems = items.where((item) {
                final category = item as Category;
                return category.name
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase());
              }).toList();
            }
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title, style: MyText.baseSemiBold),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                    if (T == Category)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Cari kategori...',
                            hintStyle: MyText.base.copyWith(
                              color: MyColors.neutral70,
                            ),
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: MyColors.neutral50),
                            ),
                          ),
                        ),
                      ),
                    const Divider(height: 1),
                    LimitedBox(
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];
                          final bool isSelected = isValueSelected(item);
                          return ListTile(
                            title: itemBuilder(item),
                            trailing: isSelected
                                ? const Icon(
                                    Icons.check_circle,
                                    color: MyColors.success700,
                                  )
                                : null,
                            onTap: () {
                              onItemSelected(item);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
