import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fskeleton/app/common/common_screen.dart';
import 'package:fskeleton/app/data/my_search_preferences/saved_search.dart';
import 'package:fskeleton/app/data/serpapi/model/shopping_response.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:fskeleton/app/ui/animated_visibility.dart';
import 'package:fskeleton/app/ui/buttons/my_text_button.dart';
import 'package:fskeleton/app/ui/common_loading.dart';
import 'package:fskeleton/app/ui/empty_state.dart';
import 'package:fskeleton/app/ui/my_alert.dart';
import 'package:fskeleton/app/ui/my_snack_bar.dart';
import 'package:fskeleton/app/ui/tablet_detector.dart';
import 'package:fskeleton/app/ui/theme/my_colors.dart';
import 'package:fskeleton/app/ui/theme/my_text.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/result/result_screen_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

enum PopUpMenu { viewInBrowser, saveToSystem }

extension PopUpMenuExtension on PopUpMenu {
  String title() {
    switch (this) {
      case PopUpMenu.viewInBrowser:
        return 'View in Browser';
      case PopUpMenu.saveToSystem:
        return 'Upload to System';
    }
  }
}

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({
    super.key,
    required this.keyword,
    required this.fileUrl,
    required this.image,
    this.savedSearched,
    required this.onSuccessSubmit,
  });

  final String keyword;
  final String image;
  final String fileUrl;
  final SavedSearch? savedSearched;
  final VoidCallback onSuccessSubmit;

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  final _controller = ResultScreenController.provider;
  final _scrollController = ScrollController();
  late double _paddingLeftRight = 82.0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ref.read(_controller.notifier).requestNextPage();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(_controller.notifier).onScreenLoaded(
            keyword: widget.keyword,
            fileUrl: widget.fileUrl,
            image: widget.image,
            savedSearched: widget.savedSearched,
          );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenToIsError();
    _listenToIsDuplicateSavedResult();
    _listenUploadFileException();
    _listenSuccessSubmitProduct();

    _paddingLeftRight =
        TabletDetector.isTablet(MediaQuery.of(context)) ? 82.0 : 20.0;

    return PopScope(
      canPop: false,
      child: CommonScreen(
        child: Scaffold(
          backgroundColor: MyColors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              toolbarHeight: 90,
              title: _title(),
              backgroundColor: MyColors.white,
              bottomOpacity: 0,
              leading: InkWell(
                onTap: () {
                  _popToHome();
                },
                child: const Icon(Icons.arrow_back, color: MyColors.black),
              ),
            ),
          ),
          body: _resultList(),
          floatingActionButton: _scrollToTopWidget(),
        ),
      ),
    );
  }

  void _popToHome() {
    context.pop(true);
  }

  Widget _title() {
    final savedSearch =
        ref.watch(_controller.select((value) => value.savedSearch));
    return Text(
      savedSearch == null
          ? context.localizations.searchProduct
          : context.localizations.searchResultHistory,
      style: MyText.base,
    );
  }

  Widget _scrollToTopWidget() {
    return Consumer(
      builder: (context, ref, child) {
        final shoppingResults = ref.watch(
          _controller.select((value) => value.shoppingResults),
        );

        return shoppingResults.when(
          data: (_) {
            return FloatingActionButton.small(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                );
              },
              child: const Icon(Icons.arrow_upward),
            );
          },
          error: (_, __) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _loadingWidget() {
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

  Widget _resultList() {
    return Consumer(
      builder: (context, ref, child) {
        final shoppingResults = ref.watch(
          _controller.select((value) => value.shoppingResults),
        );

        final selectedItem =
            ref.watch(_controller.select((value) => value.selectedItem));

        final isTablet = TabletDetector.isTablet(MediaQuery.of(context));

        return shoppingResults.when(
          data: (data) {
            if (data.isEmpty) {
              return _emptyState();
            }

            final rowCount = isTablet ? 4 : 2;
            final List<List<ShoppingResult>> rows = [];
            List<ShoppingResult> tempRows = [];
            for (var i = 0; i < data.length; i++) {
              if (tempRows.length < rowCount) {
                tempRows.add(data[i]);
              } else {
                rows.add(tempRows);
                tempRows = [];
              }
            }

            const crossAxisSpacing = 8;
            final screenWidth =
                MediaQuery.of(context).size.width - (_paddingLeftRight * 2);
            final crossAxisCount = isTablet ? 4 : 2;
            final width =
                (screenWidth - ((crossAxisCount - 1) * crossAxisSpacing)) /
                    crossAxisCount;
            const cellHeight = 380;

            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  _headerProduct(),
                  const Divider(),
                  _relatedSearchLabel(),
                  ...rows.map((row) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: _paddingLeftRight,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...row.mapIndexed(
                                  (index, e) {
                                    return _singleItemBig(
                                      item: e,
                                      index: index,
                                      width: width,
                                      height: cellHeight.toDouble(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedVisibility(
                          isVisible: selectedItem != null &&
                              row.contains(selectedItem),
                          axis: Axis.vertical,
                          child: _selectedDrawer(),
                        ),
                      ],
                    );
                  }),
                  _loadingWidget(),
                ],
              ),
            );
          },
          error: (_, __) {
            return _errorWidget();
          },
          loading: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _errorWidget() {
    return Center(
      child: MyEmptyState.error(
        context: context,
        onRetried: () {
          ref.read(_controller.notifier).onSearchProduct();
        },
      ),
    );
  }

  Widget _selectedDrawer() {
    return Consumer(
      builder: (context, ref, child) {
        final selectedItem =
            ref.watch(_controller.select((value) => value.selectedItem));

        final imageSize =
            TabletDetector.isTablet(MediaQuery.of(context)) ? 300.0 : 120.0;

        if (selectedItem != null) {
          return ColoredBox(
            color: MyColors.selectionBackground,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: _paddingLeftRight,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: selectedItem.thumbnail,
                    height: imageSize,
                    placeholder: (context, url) => const SizedBox.shrink(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedItem.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: MyText.smSemiBold,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedItem.price,
                                  style: MyText.smSemiBold,
                                ),
                                Text(
                                  selectedItem.source,
                                  style: MyText.xs
                                      .copyWith(color: MyColors.neutral80),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            showMyAlert(
                              context: context,
                              data: MyAlertData(
                                title: context.localizations.submitProduct,
                                content: context.localizations
                                    .productSubmissionConfirmationMessage,
                                primaryButton: context.localizations.yes,
                                secondaryButton: context.localizations.cancel,
                                onPrimaryButtonPressed: () {
                                  ref
                                      .read(_controller.notifier)
                                      .submitProduct(selectedItem);
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.blueSource,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                                vertical: 12.0,
                              ),
                              child: Text(
                                context.localizations.selectProduct,
                                style:
                                    MyText.xs.copyWith(color: MyColors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        MyTextButton(
                          label: Text(
                            context.localizations.viewInBrowser,
                            style: MyText.xs.copyWith(
                              color: MyColors.blueSource,
                            ),
                          ),
                          onPressed: () async {
                            final uri = Uri.parse(selectedItem.link);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              _showInvalidUrlSnackbar();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _showInvalidUrlSnackbar() {
    showMySnackBar(
      context,
      MySnackBarData(
        type: MySnackBarType.error,
        message: context.localizations.invalidUrl,
      ),
    );
  }

  Widget _relatedSearchLabel() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: _paddingLeftRight,
      ),
      child: Text(
        'Related Search',
        style: MyText.baseSemiBold,
      ),
    );
  }

  Widget _headerProduct() {
    final savedSearch =
        ref.watch(_controller.select((value) => value.savedSearch));
    final isTablet = TabletDetector.isTablet(MediaQuery.of(context));
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _paddingLeftRight,
        vertical: 24.0,
      ),
      child: Row(
        crossAxisAlignment: savedSearch == null && isTablet
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          _imageContainer(),
          const SizedBox(width: 32),
          _headerRetakeSection(),
          // if (savedSearch == null)
          //   _headerRetakeSection()
          // else
          //   _headerSavedNameLabel(savedSearch),
        ],
      ),
    );
  }

  Widget _headerRetakeSection() {
    return Consumer(
      builder: (context, ref, child) {
        final isTablet = TabletDetector.isTablet(MediaQuery.of(context));
        final keyword =
            ref.watch(_controller.select((value) => value.currentKeyword));

        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                keyword,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: isTablet ? MyText.xlSemiBold : MyText.baseSemiBold,
              ),
              const SizedBox(height: 16),
              if (isTablet) _retakeButtonsTablet() else _retakeButtonsPhone(),
            ],
          ),
        );
      },
    );
  }

  Widget _retakeButtonsPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _popToHome();
          },
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.neutral30,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Text(context.localizations.retakeImage),
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _retakeButtonsTablet() {
    return GestureDetector(
      onTap: () {
        _popToHome();
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.neutral30,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          child: Text(
            context.localizations.retakeImage,
            style: MyText.xs,
          ),
        ),
      ),
    );
  }

  Widget _imageContainer() {
    return Consumer(
      builder: (context, ref, child) {
        final image = ref.watch(_controller.select((value) => value.image));
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.memory(
            base64Decode(image),
            fit: BoxFit.contain,
            height: 120,
            width: 120,
          ),
        );
      },
    );
  }

  Widget _singleItemBig({
    required ShoppingResult item,
    int index = 0,
    double width = 0,
    double height = 0,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedItem =
            ref.watch(_controller.select((value) => value.selectedItem));

        return GestureDetector(
          onTap: () {
            item == selectedItem
                ? ref.read(_controller.notifier).removeSelectedItem()
                : ref.read(_controller.notifier).setSelectedItem(item);
          },
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: item == selectedItem
                  ? MyColors.bodyBackground
                  : MyColors.white,
              border: Border.all(
                color: MyColors.neutral30,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item.thumbnail,
                    height: 184,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox.shrink(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: MyText.sm,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.price,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: MyText.smSemiBold,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.source,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: MyText.xsSemiBold.copyWith(
                          color: MyColors.blueSource,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _emptyState() {
    return MyEmptyState.empty(
      title: context.localizations.searchNotFoundMessage,
      buttonWidget: _retakeButtonsTablet(),
    );
  }

  void _listenToIsError() {
    ref.listen(
      _controller.select((value) => value.isError),
      (previous, next) {
        showMySnackBar(
          context,
          MySnackBarData(
            type: MySnackBarType.error,
            message: context.localizations.failedSystemGetData,
          ),
        );
      },
    );
  }

  void _listenToIsDuplicateSavedResult() {
    ref.listen(
      _controller.select((value) => value.isDuplicateSavedResult),
      (previous, next) {
        showMySnackBar(
          context,
          MySnackBarData(
            type: MySnackBarType.error,
            message: context.localizations.duplicateSaveSearchedErrorMessage,
          ),
        );
      },
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

  void _listenSuccessSubmitProduct() {
    ref.listen(
      _controller.select((value) => value.successSubmit),
      (previous, next) {
        widget.onSuccessSubmit();
      },
    );
  }
}
