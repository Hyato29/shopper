// lib/feature/product_detail/product_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fskeleton/app/data/wms/model/wms_category/wms_category.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/buttons/my_text_button.dart';
import 'package:fskeleton/app/ui/my_text_field.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/app/utils/string_formatter.dart';
import 'package:go_router/go_router.dart';
import 'product_detail_controller.dart';
import 'product_detail_params.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final ProductDetailParams params;
  const ProductDetailScreen({super.key, required this.params});

  @override
  ConsumerState<ProductDetailScreen> createState() => _ProductDetailScreenState();
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.params.productName, style: MyText.x2lSemiBold),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildInfoColumn("Harga Retail",
                    widget.params.productPrice.truncate().toCurrencyFormat()),
                const SizedBox(width: 48),
                _buildInfoColumn("Qty", state.quantity.toString()),
              ],
            ),
            const SizedBox(height: 24),
            
            Text("Kategori", style: MyText.sm.copyWith(color: MyColors.neutral80)),
            const SizedBox(height: 8),
            _buildCategoryChips(state.categories, state.selectedCategoryIds, controller),
            const SizedBox(height: 24),
            
            Text("Status", style: MyText.sm.copyWith(color: MyColors.neutral80)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: state.selectedStatus,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Pilih Status",
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              ),
              items: ['Lolos', 'Damaged', 'Karantina']
                  .map((label) => DropdownMenuItem(value: label, child: Text(label)))
                  .toList(),
              onChanged: controller.onStatusChanged,
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
                    label: const Text("Batalkan"),
                    onPressed: () => context.pop(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MyPrimaryButton(
                    onPressed: state.isSaving
                        ? null
                        : () async {
                            final success = await controller.saveData(widget.params);
                            if (success && mounted) {
                              context.pop(true);
                            }
                          },
                    label: state.isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text("Simpan Data"),
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
        Text(value, style: MyText.lgSemiBold),
      ],
    );
  }

  Widget _buildCategoryChips(
    AsyncValue<List<Category>> categories,
    Set<int> selectedIds,
    ProductDetailController controller,
  ) {
    return categories.when(
      data: (data) => Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: data.map((category) {
          return FilterChip(
            label: Text(category.name),
            selected: selectedIds.contains(category.id),
            onSelected: (_) => controller.toggleCategory(category.id),
            selectedColor: MyColors.primary500.withOpacity(0.2),
            checkmarkColor: MyColors.primary700,
          );
        }).toList(),
      ),
      loading: () => const SizedBox(
          height: 36, child: Center(child: CircularProgressIndicator())),
      error: (e, s) => Text("Gagal memuat kategori: $e"),
    );
  }
}