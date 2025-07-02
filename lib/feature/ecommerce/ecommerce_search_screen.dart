import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fskeleton/app/data/ecommerce/model/ecommerce_product.dart';
import 'package:fskeleton/app/navigation/router.dart';
import 'package:fskeleton/app/ui/empty_state.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/feature/ecommerce/ecommerce_search_controller.dart';
import 'package:fskeleton/feature/result/product_detail_params.dart';
import 'package:go_router/go_router.dart';

class EcommerceSearchScreen extends ConsumerStatefulWidget {
  final Map<String, String> searchParams;
  const EcommerceSearchScreen({super.key, required this.searchParams});

  @override
  ConsumerState<EcommerceSearchScreen> createState() =>
      _EcommerceSearchScreenState();
}

class _EcommerceSearchScreenState extends ConsumerState<EcommerceSearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String _productName;
  late String _localImagePath;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _productName = widget.searchParams['productName']!;
    _localImagePath = widget.searchParams['localImagePath']!;

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(ecommerceSearchControllerProvider.notifier).search(_productName);
    // });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ecommerceSearchControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hasil Pencarian',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: MyColors.primary500,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Tokopedia'),
            Tab(text: 'Shopee'),
            Tab(text: 'Lazada'),
          ],
        ),
      ),
      body: state.searchResult.when(
        data: (results) => TabBarView(
          controller: _tabController,
          children: [
            _buildProductList(results.tokopedia),
            _buildProductList(results.shopee),
            _buildProductList(results.lazada),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(
          child: MyEmptyState.error(
            context: context,
            onRetried: () => ref
                .read(ecommerceSearchControllerProvider.notifier)
                // .search(_productName),
          ),
        ),
      ),
    );
  }

  Widget _buildProductList(List<EcommerceProduct> products) {
    if (products.isEmpty) {
      return const Center(
          child: Text("Produk tidak ditemukan di platform ini."));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: CachedNetworkImage(
            imageUrl: product.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.contain,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator(strokeWidth: 2)),
            errorWidget: (context, url, error) =>
                const Icon(Icons.image_not_supported_outlined),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          title: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16)),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(product.price,
                style: MyText.smSemiBold.copyWith(color: MyColors.primary500)),
          ),
          onTap: () {
            final params = ProductDetailParams(
              productName: product.title,
              productPrice: double.tryParse(
                    product.price.replaceAll(RegExp('[^0-9]'), ''),
                  ) ??
                  0.0,
              imageUrl: product.imageUrl,
              localImagePath: _localImagePath,
            );
            context.pushReplacementNamed(AppRouter.productDetailRoute,
                extra: params);
          },
        );
      },
    );
  }
}
