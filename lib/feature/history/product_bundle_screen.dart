import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fskeleton/app/data/wms/model/wms_bundle/wms_bundle.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/ui/common_loading.dart';
import 'package:fskeleton/app/ui/empty_state.dart';
import 'package:fskeleton/app/ui/my_text_field.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/app/utils/string_formatter.dart';
import 'package:fskeleton/feature/history/product_bundle_controller.dart';
import 'package:go_router/go_router.dart';

class ProductBundleScreen extends ConsumerStatefulWidget {
  final WmsBundle bundle;
  const ProductBundleScreen({super.key, required this.bundle});

  @override
  ConsumerState<ProductBundleScreen> createState() =>
      _ProductBundleScreenState();
}

class _ProductBundleScreenState extends ConsumerState<ProductBundleScreen> {
  final _controller = ProductBundleController.provider;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ref.read(_controller.notifier).loadNextProducts();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_controller.notifier).onScreenLoaded();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(_controller.select((s) => s.insertionSuccess), (prev, next) {
      if (next != null && next.data) {
        context.pop(true);
      }
    });

    final state = ref.watch(_controller);
    final notifier = ref.read(_controller.notifier);
    final allProducts = state.products.value ?? [];
    final allSelected = allProducts.isNotEmpty &&
        state.selectedProductIds.length == allProducts.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 1,
        title: Text('Add to Bundle', style: MyText.baseSemiBold),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: allProducts.isEmpty ? null : notifier.toggleSelectAll,
            child: Text(
              allSelected ? 'Deselect All' : 'Select All',
              style: MyText.xsSemiBold.copyWith(color: MyColors.primary500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: state.isInserting || state.selectedProductIds.isEmpty
                  ? null
                  : () => notifier.addProductsToBundle(widget.bundle.id),
              child: state.isInserting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      "Insert",
                      style: MyText.xsSemiBold.copyWith(
                        color: state.selectedProductIds.isEmpty
                            ? MyColors.neutral60
                            : MyColors.primary500,
                      ),
                    ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bundle Name :",
                  style: MyText.sm,
                ),
                Text(
                  widget.bundle.nameBundle,
                  style: MyText.smSemiBold,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: MyTextField(
              placeholder: 'Search with ID / Product Name...',
              onChanged: notifier.onChangeSearchKey,
              trailingIconMode: TrailingIconMode.clear,
            ),
          ),
          Expanded(
            child: state.products.when(
              data: (products) {
                if (products.isEmpty) {
                  return MyEmptyState.searchNotFound(context: context);
                }
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: products.length + (state.nextPageLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == products.length) {
                      return const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CommonLoading(ballColor: Colors.lightBlue),
                      );
                    }
                    final product = products[index];
                    return _buildProductItem(product);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => MyEmptyState.error(
                context: context,
                onRetried: notifier.loadProducts,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(WmsProduct product) {
    final selectedIds =
        ref.watch(_controller.select((s) => s.selectedProductIds));
    final isSelected = selectedIds.contains(product.id);
    const wmsBaseUrl = "https://wms-server.digitalindustryagency.com";
    String? displayImageUrl;
    if (product.image != null && product.image!.startsWith('http')) {
      displayImageUrl = product.image;
    } else if (product.imageUrl != null && product.imageUrl!.isNotEmpty) {
      displayImageUrl = wmsBaseUrl + product.imageUrl!;
    }

    return Column(
      children: [
        const SizedBox(height: 10),
        ListTile(
          onTap: () =>
              ref.read(_controller.notifier).toggleProductSelection(product.id),
          leading: Checkbox(
            value: isSelected,
            onChanged: (_) => ref
                .read(_controller.notifier)
                .toggleProductSelection(product.id),
            activeColor: MyColors.primary500,
            shape: const CircleBorder(),
          ),
          title: Row(
            children: [
              if (displayImageUrl != null)
                CachedNetworkImage(
                  imageUrl: displayImageUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) => const Icon(Icons.image),
                  placeholder: (_, __) =>
                      const CircularProgressIndicator(strokeWidth: 2),
                )
              else
                Container(
                  width: 40,
                  height: 40,
                  color: MyColors.neutral40,
                  child: const Icon(Icons.image_not_supported),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  product.productName,
                  style: MyText.sm,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          trailing: Text(
            (double.tryParse(product.productPrice) ?? 0)
                .truncate()
                .toCurrencyFormat(),
            style: MyText.xsBold.copyWith(color: MyColors.primary700),
          ),
        ),
        const SizedBox(height: 10),
        const Divider(height: 1, indent: 16, endIndent: 16),
      ],
    );
  }
}
