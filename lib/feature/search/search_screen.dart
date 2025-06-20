import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/data/wms/model/wms_product.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:fskeleton/app/ui/buttons/button_size.dart';
import 'package:fskeleton/app/ui/buttons/my_primary_button.dart';
import 'package:fskeleton/app/ui/common_loading.dart';
import 'package:fskeleton/app/ui/empty_state.dart';
import 'package:fskeleton/app/ui/my_alert.dart';
import 'package:fskeleton/app/ui/my_snack_bar.dart';
import 'package:fskeleton/app/ui/my_text_field.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/app/utils/string_formatter.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/search/search_screen_controller.dart';
import 'package:fskeleton/feature/webview/webview_screen_params.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({
    super.key,
    required this.onSuccessUpload,
    required this.navigateToSuccessScreen,
  });

  final Function(WebViewScreenParams) onSuccessUpload;
  final VoidCallback navigateToSuccessScreen;

  @override
  ConsumerState<SearchScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<SearchScreen> {
  final _controller = SearchScreenController.provider;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ref.read(_controller.notifier).loadNextProducts();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(_controller.notifier).onScreenLoaded();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenUploadFileException();
    _listenAddProduct();

    return CommonScreen(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            toolbarHeight: 90,
            title: Text(
              context.localizations.searchProduct,
              style: MyText.base,
            ),
            leading: InkWell(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back, color: MyColors.black),
            ),
            backgroundColor: MyColors.white,
            bottomOpacity: 0,
          ),
        ),
        body: Column(
          children: [
            _searchField(),
            Expanded(child: _productList()),
          ],
        ),
      ),
    );
  }

  Widget _productList() {
    return Consumer(
      builder: (context, ref, child) {
        final products =
            ref.watch(_controller.select((state) => state.products));

        return products.when(
          data: (data) {
            if (data.isEmpty) {
              return MyEmptyState.empty(
                title: context.localizations.noData,
                buttonWidget: MyPrimaryButton(
                  label: Text(context.localizations.chooseOptionToGetImage),
                  buttonSize: ButtonSize.small,
                  onPressed: () {
                    context.pop(true);
                  },
                ),
              );
            }

            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  ...data.map((e) => _singleProduct(e)),
                  _loadingBottomWidget(),
                ],
              ),
            );
          },
          error: (_, __) {
            return MyEmptyState.error(
              context: context,
              onRetried: ref.read(_controller.notifier).onRetrySeach,
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  Widget _singleProduct(WmsProduct data) {
    const verticalPadding = 20.0;

    return InkWell(
      onTap: () {
        showMyAlert(
          context: context,
          data: MyAlertData(
            title: context.localizations.submitProduct,
            content: context.localizations.productSubmissionConfirmationMessage,
            primaryButton: context.localizations.yes,
            secondaryButton: context.localizations.cancel,
            onPrimaryButtonPressed: () {
              ref.read(_controller.notifier).onProductTapped(data);
            },
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(height: verticalPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.productName,
                        style: MyText.sm,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _priceChip(data.productPrice),
              ],
            ),
          ),
          const SizedBox(height: verticalPadding),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _priceChip(String price) {
    final formattedPrice = double.parse(price).truncate().toCurrencyFormat();

    return Container(
      decoration: BoxDecoration(
        color: MyColors.neutral30,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/pricetag.svg', width: 14),
            const SizedBox(width: 4),
            Text(formattedPrice, style: MyText.xsSemiBold),
          ],
        ),
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: MyTextField(
        placeholder: context.localizations.searchBarPlaceholder,
        trailingIconMode: TrailingIconMode.clear,
        onChanged: ref.read(_controller.notifier).onChangeSearchKey,
      ),
    );
  }

  void _listenUploadFileException() {
    ref.listen(_controller.select((value) => value.uploadFileException),
        (previous, next) {
      showMySnackBar(
        context,
        MySnackBarData(
          type: MySnackBarType.error,
          message: context.localizations.failedSystemGetData,
        ),
      );
    });
  }

  void _listenAddProduct() {
    ref.listen(
      _controller.select((value) => value.addProductSuccess),
      (previous, next) {
        widget.navigateToSuccessScreen();
      },
    );
  }

  Widget _loadingBottomWidget() {
    return Consumer(
      builder: (context, ref, child) {
        final isLoading =
            ref.watch(_controller.select((value) => value.nextPageLoading));
        if (isLoading != null) {
          return isLoading.data
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CommonLoading(ballColor: Colors.lightBlue),
                  ),
                )
              : const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
