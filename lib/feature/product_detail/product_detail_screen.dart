// lib/feature/product_detail/product_detail_screen.dart

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fskeleton/app/data/wms/model/wms_category/wms_category.dart';
import 'package:fskeleton/app/navigation/router.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/buttons/my_text_button.dart';
import 'package:fskeleton/app/ui/my_text_field.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/app/utils/string_formatter.dart';
import 'package:fskeleton/feature/product_detail/product_detail_controller.dart';
import 'package:fskeleton/feature/product_detail/product_detail_params.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.white,
        title: Text('Detail Produk',
            style: MyText.baseSemiBold.copyWith(color: MyColors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.black),
          onPressed: () => context.pop(),
        ),
      ),
      backgroundColor: MyColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.params.imageUrl != null &&
                widget.params.imageUrl!.isNotEmpty)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: widget.params.imageUrl!,
                    height: 200,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                        Icons.image_not_supported_outlined,
                        size: 50),
                  ),
                ),
              ),
            const SizedBox(height: 24),
            Text(widget.params.productName, style: MyText.x2lSemiBold),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn("Harga Retail",
                    widget.params.productPrice.truncate().toCurrencyFormat()),
                _buildInfoColumn("Qty", state.quantity.toString()),
                _buildInfoColumn("Fixed Price", 0.toCurrencyFormat()),
              ],
            ),
            const SizedBox(height: 32),
            Text("Kategori",
                style: MyText.sm.copyWith(color: MyColors.neutral80)),
            const SizedBox(height: 8),
            _buildPickerField<Category>(
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
            const SizedBox(height: 24),
            Text("Status",
                style: MyText.sm.copyWith(color: MyColors.neutral80)),
            const SizedBox(height: 8),
            _buildPickerField<String>(
              hintText: 'Pilih Status',
              value: state.selectedStatus,
              onTap: () {
                _showPickerBottomSheet<String>(
                  context: context,
                  title: 'Pilih Status',
                  items: ['Lolos', 'Damaged', 'Abnormal'],
                  itemBuilder: (status) => Text(status),
                  onItemSelected: controller.onStatusChanged,
                  isValueSelected: (status) => status == state.selectedStatus,
                );
              },
            ),
            const SizedBox(height: 24),
            MyTextField(
              label: "Input Quantity",
              controller: _quantityController,
              keyboardType: TextInputType.number,
              onChanged: controller.onQuantityChanged,
            ),
            const SizedBox(height: 48),
            Row(
              children: [
                Expanded(
                  child: MyTextButton(
                    label: Text("Batalkan",
                        style: MyText.smSemiBold
                            .copyWith(color: MyColors.neutral80)),
                    onPressed: () => context.pop(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MyPrimaryButton(
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
                        : Text("Simpan Data",
                            style: MyText.smSemiBold
                                .copyWith(color: MyColors.white)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: MyText.sm.copyWith(color: MyColors.neutral80)),
        const SizedBox(height: 4),
        Text(value, style: MyText.baseSemiBold),
      ],
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
                      : MyColors.neutral70),
            ),
            const Icon(Icons.arrow_drop_down, color: MyColors.neutral80),
          ],
        ),
      ),
    );
  }

  // --- FUNGSI INI TELAH DIPERBAIKI ---
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
        // Pindahkan deklarasi state pencarian ke sini
        // agar tidak direset setiap kali UI keyboard berubah.
        String searchQuery = "";

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            List<T> filteredItems = items;

            // Logika filter hanya berjalan jika ada query dan tipenya adalah Category
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
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title, style: MyText.lgSemiBold),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),

                    // Hanya tampilkan search bar untuk kategori
                    if (T == Category)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Cari kategori...',
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
                                ? const Icon(Icons.check_circle,
                                    color: MyColors.success700)
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
