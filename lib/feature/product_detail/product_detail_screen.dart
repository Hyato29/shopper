// lib/feature/product_detail/product_detail_screen.dart

// ... (import lainnya)
import 'package:flutter/material.dart';
import 'package:fskeleton/app/data/wms/model/wms_category/wms_category.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/buttons/my_text_button.dart';
import 'package:fskeleton/app/ui/my_text_field.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/app/utils/string_formatter.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/product_detail/product_detail_controller.dart'; // Import controller
import 'package:fskeleton/feature/product_detail/product_detail_params.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  // Ubah menjadi StatefulWidget
  final ProductDetailParams params;
  const ProductDetailScreen({super.key, required this.params});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  final _quantityController = TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    // Panggil fetch categories saat screen pertama kali dibuka
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
                Row(
                  children: [
                    _buildInfoColumn(
                      "Harga Retail",
                      widget.params.productPrice
                          .truncate()
                          .toCurrencyFormat(), // <-- PERBAIKAN 2
                    ),
                    const SizedBox(width: 48),
                    _buildInfoColumn(
                        "Qty", state.quantity.toString()), // Diambil dari state
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // --- KATEGORI ---
            Text("Kategori",
                style: MyText.sm.copyWith(color: MyColors.neutral80)),
            const SizedBox(height: 8),
            _buildCategoryChips(
                state.categories, state.selectedCategoryIds, controller),
            const SizedBox(height: 24),

            // --- STATUS ---
            Text("Status",
                style: MyText.sm.copyWith(color: MyColors.neutral80)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: state.selectedStatus,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12)),
              hint: const Text("Pilih Status"),
              items: ['Lolos', 'Damaged', 'Karantina']
                  .map((label) =>
                      DropdownMenuItem(value: label, child: Text(label)))
                  .toList(),
              onChanged: controller.onStatusChanged,
            ),
            const SizedBox(height: 24),

            // --- KUANTITAS ---
            MyTextField(
              label: "Input Quantity",
              controller: _quantityController,
              keyboardType: TextInputType.number,
              onChanged: controller.onQuantityChanged,
            ),
            const SizedBox(height: 48),

            // --- TOMBOL ---
            Row(
              children: [
                Expanded(
                    child: MyTextButton(
                        label: const Text("Batalkan"),
                        onPressed: () => context.pop())),
                const SizedBox(width: 16),
                Expanded(
                  child: MyPrimaryButton(
                    label: const Text("Simpan Data"),
                    onPressed: () async {
                      final success = await controller.saveData(widget.params);
                      if (success && mounted) {
                        // Kembali ke home dan refresh history
                        context.pop(true);
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget baru untuk menampilkan kategori
  Widget _buildCategoryChips(AsyncValue<List<Category>> categories,
      Set<int> selectedIds, ProductDetailController controller) {
    return categories.when(
      data: (data) => Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: data.map((category) {
          return FilterChip(
            label: Text(category.name),
            selected: selectedIds.contains(category.id),
            onSelected: (isSelected) {
              controller.toggleCategory(category.id);
            },
            selectedColor: MyColors.primary200,
          );
        }).toList(),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (e, s) => const Text("Gagal memuat kategori"),
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
}
