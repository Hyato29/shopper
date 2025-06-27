import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/data/network_config.dart';
import 'package:fskeleton/app/data/wms/model/wms_bundle/wms_bundle.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
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
            label: Text('+ Buat Bundle',
                style: MyText.smSemiBold.copyWith(color: MyColors.primary500)),
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
        onPrimaryButtonPressed: () {},
        secondaryButton: "Batalkan",
        onSecondaryButtonPressed: () {},
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
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: data.length +
              (ref.watch(_controller.select((s) => s.nextPageLoading))?.data ==
                      true
                  ? 1
                  : 0),
          separatorBuilder: (_, __) =>
              const Divider(height: 1, indent: 16, endIndent: 16),
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
      error: (e, s) => MyEmptyState.error(
        context: context,
        onRetried: () => ref.read(_controller.notifier).loadProducts(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _historyListItem(WmsProduct product) {
    final wmsConfig = ref.watch(NetworkConfig.wmsApiProvider);
    final baseUrl =
        "${wmsConfig.apiScheme}://${wmsConfig.apiHost}:${wmsConfig.apiPort}";

    return InkWell(
      onTap: () => ref.read(_controller.notifier).selectProduct(product),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.imageUrl != null && product.imageUrl!.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: baseUrl + product.imageUrl!,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => _imagePlaceholder(),
                    placeholder: (context, url) => _imagePlaceholder(),
                  ),
                ),
              )
            else
              _imagePlaceholder(),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (product.status != null) _statusChip(product.status!),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          product.productName,
                          style: MyText.sm,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _priceChip(product.productPrice),
          ],
        ),
      ),
    );
  }

  Widget _detailSection(WmsProduct product) {
    const barcodeName = "NO-BARCODE";
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
              Text(barcodeName, style: MyText.xs),
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
                _detailQty("Qty", product.quantity.toString()),
                const SizedBox(height: 12),
                _detailHarga("Harga Diskon", product.fixedPrice == null ? "0" : product.fixedPrice.toString()),
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

  Widget _bundleList() {
    final bundles = ref.watch(_controller.select((s) => s.bundles));

    return bundles.when(
      data: (data) {
        if (data.isEmpty) {
          return MyEmptyState.empty(title: "Belum ada bundle");
        }
        return ListView.separated(
          itemCount: data.length,
          separatorBuilder: (_, __) =>
              const Divider(height: 1, indent: 16, endIndent: 16),
          itemBuilder: (context, index) {
            final bundle = data[index];
            return _bundleListItem(bundle);
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
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      leading: const Icon(Icons.folder_outlined,
          color: MyColors.neutral80, size: 28),
      title: Text(bundle.nameBundle, style: MyText.sm),
      trailing: IconButton(
        icon: const Icon(Icons.more_horiz, color: MyColors.neutral80),
        onPressed: () {},
      ),
      onTap: () {},
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

  Widget _statusChip(String status) {
    Color chipColor, textColor;
    String statusText = status;
    switch (status.toLowerCase()) {
      case 'damaged':
        chipColor = MyColors.danger50;
        textColor = MyColors.danger700;
        break;
      case 'karantina':
        chipColor = MyColors.alert50;
        textColor = MyColors.alert700;
        break;
      default:
        chipColor = MyColors.success50;
        textColor = MyColors.success700;
        statusText = "Lolos";
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child:
          Text(statusText, style: MyText.xsSemiBold.copyWith(color: textColor)),
    );
  }

  Widget _priceChip(String price) {
    final priceValue = double.tryParse(price) ?? 0;
    final formattedPrice = priceValue.truncate().toCurrencyFormat();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: MyColors.neutral30,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        formattedPrice,
        style: MyText.xsSemiBold,
      ),
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
