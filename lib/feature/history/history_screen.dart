import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/data/wms/model/wms_bundle/wms_bundle.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/ui/animated_visibility.dart';
import 'package:fskeleton/app/ui/buttons/button_size.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/buttons/my_text_button.dart';
import 'package:fskeleton/app/ui/common_loading.dart';
import 'package:fskeleton/app/ui/empty_state.dart';
import 'package:fskeleton/app/ui/my_alert.dart';
import 'package:fskeleton/app/ui/my_text_field.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/app/utils/string_formatter.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/history/history_screen_controller.dart';
import 'package:go_router/go_router.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen>
    with TickerProviderStateMixin {
  final _controller = HistoryScreenController.provider;
  final _scrollController = ScrollController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() => setState(() {}));
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
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.pop(),
          ),
          title: Text('Scan History', style: MyText.baseSemiBold),
          backgroundColor: MyColors.white,
          actions: _buildAppBarActions(),
          elevation: 0,
        ),
        body: Column(
          children: [
            _searchField(),
            TabBar(
              controller: _tabController,
              tabs: const [Tab(text: 'Scan History'), Tab(text: 'Bundle')],
              labelColor: MyColors.primary500,
              unselectedLabelColor: MyColors.neutral70,
              indicatorColor: MyColors.primary500,
            ),
            const Divider(height: 1, color: MyColors.neutral50),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _historyList(),
                  _bundleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_tabController.index == 1) {
      return [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: MyTextButton(
            onPressed: _showCreateBundleDialog,
            label: Text('+ Buat Bundle', style: MyText.smSemiBold),
          ),
        ),
      ];
    }
    return [];
  }

  void _showCreateBundleDialog() {
    showMyAlert(
      context: context,
      barrierDismissible: true,
      data: MyAlertData(
        title: "Buat nama bundle",
        contentWidget: const MyTextField(
          placeholder: 'Nama Bundle',
        ),
        primaryButton: "Buat Bundle",
        onPrimaryButtonPressed: () {
        },
        secondaryButton: "Batalkan",
        onSecondaryButtonPressed: () {},
      ),
    );
  }

  Widget _bundleList() {
    final bundles = ref.watch(_controller.select((s) => s.bundles));
    final selectedBundle =
        ref.watch(_controller.select((s) => s.selectedBundle));

    return bundles.when(
      data: (data) {
        if (data.isEmpty) {
          return MyEmptyState.empty(title: "Belum ada bundle");
        }
        return ListView.separated(
          itemCount: data.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final bundle = data[index];
            final isSelected = selectedBundle == bundle;
            return isSelected
                ? Column(
                    children: [
                      _bundleListItem(bundle),
                      AnimatedVisibility(
                        isVisible: isSelected,
                        child: _bundleDetailSection(bundle),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _bundleListItem(bundle),
                    ],
                  );
          },
        );
      },
      error: (e, s) => MyEmptyState.error(
        context: context,
        onRetried: ref.read(_controller.notifier).loadBundles,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _bundleListItem(WmsBundle bundle) {
    return ListTile(
      tileColor: MyColors.white,
      leading:
          const Icon(Icons.folder_outlined, color: MyColors.primary500, size: 32),
      title: Text(bundle.nameBundle, style: MyText.base),
      trailing: IconButton(
        icon: const Icon(Icons.more_horiz, color: MyColors.neutral80),
        onPressed: () {},
      ),
      onTap: () {
        ref.read(_controller.notifier).selectBundle(bundle);
      },
    );
  }

  Widget _bundleDetailSection(WmsBundle bundle) {
    return ColoredBox(
      color: MyColors.bodyBackground,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Icon(Icons.qr_code_2_sharp,
                        size: 80, color: MyColors.black),
                    const SizedBox(height: 4),
                    Text(bundle.barcodeBundle, style: MyText.xs),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 36,
                      child: MyPrimaryButton(
                        buttonSize: ButtonSize.small,
                        onPressed: () {},
                        label: Text(
                          "Print Barcode",
                          style:
                              MyText.xsSemiBold.copyWith(color: MyColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(bundle.nameBundle,
                          style: MyText.baseSemiBold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 16),
                      _detailHarga("Harga Retail", bundle.totalPriceBundle),
                      const SizedBox(height: 12),
                      _detailQty("Qty", bundle.totalProductBundle.toString()),
                      const SizedBox(height: 12),
                      _detailHarga(
                          "Harga Diskon", bundle.totalPriceCustomBundle),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          if (bundle.productBundles.isNotEmpty)
            ...bundle.productBundles
                .map((product) => _productInBundleItem(product))
          else
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Tidak ada produk di dalam bundle ini."),
            ),
        ],
      ),
    );
  }

  Widget _productInBundleItem(ProductInBundle product) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: const BoxDecoration(
          border:
              Border(top: BorderSide(color: MyColors.neutral40, width: 0.5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (product.image != null && product.image!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: product.image!,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => _imagePlaceholder(),
                placeholder: (context, url) => _imagePlaceholder(),
              ),
            )
          else
            _imagePlaceholder(),
          const SizedBox(width: 12),
          _statusChip(),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              product.newNameProduct,
              style: MyText.sm,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: MyColors.secondaryGreen500,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              double.parse(product.displayPrice).truncate().toCurrencyFormat(),
              style: MyText.xsSemiBold.copyWith(color: MyColors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: MyTextField(
        placeholder: 'Search with ID / Product Name...',
        onChanged: ref.read(_controller.notifier).onChangeSearchKey,
        trailingIconMode: TrailingIconMode.clear,
      ),
    );
  }

  Widget _historyList() {
    final products = ref.watch(_controller.select((s) => s.products));
    final selectedProduct =
        ref.watch(_controller.select((s) => s.selectedProduct));

    return products.when(
      data: (data) {
        if (data.isEmpty) {
          return const MyEmptyState.empty(title: "Riwayat tidak ditemukan");
        }
        return ListView.separated(
          controller: _scrollController,
          itemCount: data.length +
              (ref.watch(_controller.select((s) => s.nextPageLoading))?.data ==
                      true
                  ? 1
                  : 0),
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            if (index == data.length) {
              return _loadingBottomWidget();
            }
            final product = data[index];
            final isSelected = selectedProduct == product;

            return InkWell(
              onTap: () =>
                  ref.read(_controller.notifier).selectProduct(product),
              child: isSelected
                  ? Column(
                      children: [
                        ColoredBox(
                          color: isSelected
                              ? MyColors.bodyBackground
                              : Colors.white,
                          child: _historyListItem(product),
                        ),
                        _detailSection(product),
                      ],
                    )
                  : Column(
                      children: [
                        _historyListItem(product),
                      ],
                    ),
            );
          },
        );
      },
      error: (_, __) => Text("data"),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _historyListItem(WmsProduct product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (product.image != null && product.image!.isNotEmpty)
          //   ClipRRect(
          //     borderRadius: BorderRadius.circular(8),
          //     child: CachedNetworkImage(
          //       imageUrl: product.image!,
          //       width: 48,
          //       height: 48,
          //       fit: BoxFit.cover,
          //       errorWidget: (context, url, error) => _imagePlaceholder(),
          //       placeholder: (context, url) => _imagePlaceholder(),
          //     ),
          //   )
          // else
          //   _imagePlaceholder(),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: MyText.sm,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    _priceChip(product.productPrice),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _statusChip(),
        ],
      ),
    );
  }

  Widget _detailSection(WmsProduct product) {
    // final barcodeName = product.user?.formatBarcodeName ?? "NO-BARCODE";
    return Container(
      width: double.infinity,
      color: MyColors.bodyBackground,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Icon(
                Icons.qr_code_2_sharp,
                size: 80,
                color: MyColors.black,
              ),
              const SizedBox(height: 4),
              // Text(barcodeName, style: MyText.xs),
              const SizedBox(height: 8),
              SizedBox(
                height: 36,
                child: MyPrimaryButton(
                  buttonSize: ButtonSize.small,
                  onPressed: () {},
                  label: Text(
                    "Print Barcode",
                    style: MyText.xsSemiBold.copyWith(color: MyColors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: MyText.baseSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                _detailHarga("Harga Retail", product.productPrice),
                const SizedBox(height: 12),
                _detailQty("Qty", "1"),
                const SizedBox(height: 12),
                _detailHarga("Harga Diskon", "0"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailHarga(String label, String value) {
    final formattedValue = double.tryParse(value);
    final displayValue = (formattedValue != null)
        ? formattedValue.truncate().toCurrencyFormat()
        : value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: MyText.xs.copyWith(color: MyColors.neutral80)),
        Text(displayValue, style: MyText.smSemiBold),
      ],
    );
  }

  Widget _detailQty(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: MyText.xs.copyWith(color: MyColors.neutral80)),
        Text(value, style: MyText.smSemiBold),
      ],
    );
  }

  Widget _priceChip(String price) {
    final formattedPrice = double.parse(price).truncate().toCurrencyFormat();
    return Text(formattedPrice,
        style: MyText.smSemiBold.copyWith(color: MyColors.primary700));
  }

  Widget _statusChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: MyColors.success50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text("Lolos",
          style: MyText.xsSemiBold.copyWith(color: MyColors.success700)),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: MyColors.neutral30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.image_not_supported_outlined,
          color: MyColors.neutral70, size: 24),
    );
  }

  Widget _loadingBottomWidget() {
    final isLoading = ref.watch(_controller.select((s) => s.nextPageLoading));
    if (isLoading?.data == true) {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: CommonLoading(ballColor: Colors.lightBlue),
      );
    }
    return const SizedBox.shrink();
  }
}
