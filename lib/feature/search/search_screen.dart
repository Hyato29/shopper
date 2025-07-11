import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/app/navigation/router.dart';
import 'package:fskeleton/app/ui/buttons/button_size.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/common_loading.dart';
import 'package:fskeleton/app/ui/empty_state.dart';
import 'package:fskeleton/app/ui/my_text_field.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/app/utils/string_formatter.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/search/search_screen_controller.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = SearchScreenController.provider;
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
    return CommonScreen(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: MyColors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: MyColors.black),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Pencarian Produk',
            style: MyText.baseSemiBold.copyWith(color: MyColors.black),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: MyTextField(
                autofocus: true,
                placeholder: 'Search Product',
                onChanged: ref.read(_controller.notifier).onChangeSearchKey,
                trailingIconMode: TrailingIconMode.clear,
              ),
            ),
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    final state = ref.watch(_controller);
    final products = state.products;

    return products.when(
      data: (data) {
        if (data.isEmpty && state.searchKey.isEmpty) {
          return MyEmptyState.empty(
            title: "Tidak ada pencarian.",
            buttonWidget: MyPrimaryButton(
              label: const Text("Pilih opsi ambil gambar"),
              buttonSize: ButtonSize.small,
              onPressed: () => context.pop(),
            ),
          );
        }
        if (data.isEmpty && state.searchKey.isNotEmpty) {
          return MyEmptyState.searchNotFound(
            context: context,
            buttonWidget: MyPrimaryButton(
              label: const Text("Pilih opsi ambil gambar"),
              buttonSize: ButtonSize.small,
              onPressed: () => context.pop(),
            ),
          );
        }

        return ListView.separated(
          controller: _scrollController,
          itemCount:
              data.length + (state.nextPageLoading?.data == true ? 1 : 0),
          separatorBuilder: (context, index) =>
              const Divider(height: 1, indent: 16, endIndent: 16),
          itemBuilder: (context, index) {
            if (index == data.length) {
              return _loadingBottomWidget();
            }
            final product = data[index];
            return _buildProductItem(product);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => MyEmptyState.error(
        context: context,
        onRetried: () => ref.read(_controller.notifier).loadProducts(),
      ),
    );
  }

  Widget _buildProductItem(WmsProduct product) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        product.productName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: MyText.sm,
      ),
      trailing: _priceChip(product.productPrice),
      onTap: () async {
        final params =
            ref.read(_controller.notifier).prepareProductForDetail(product);

        if (mounted) {
          context.pushNamed(AppRouter.productDetailRoute, extra: params);
        }
      },
    );
  }

  Widget _priceChip(String price) {
    final formattedPrice =
        (double.tryParse(price) ?? 0).truncate().toCurrencyFormat();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: MyColors.neutral30,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/pricetag.svg',
            width: 14,
            colorFilter:
                const ColorFilter.mode(MyColors.neutral80, BlendMode.srcIn),
          ),
          const SizedBox(width: 4),
          Text(
            formattedPrice,
            style: MyText.xsSemiBold.copyWith(color: MyColors.primary700),
          ),
        ],
      ),
    );
  }

  Widget _loadingBottomWidget() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CommonLoading(ballColor: Colors.lightBlue),
    );
  }
}
