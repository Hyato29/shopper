import 'package:flutter/material.dart';

import 'package:fskeleton/app/ui/theme/my_colors.dart';

const _dialogSize = 80.0;
const _dialogElevation = 15.0;

enum LoadingOverlayUiState {
  hidden,
  loading,
}

class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({
    super.key,
    required this.uiState,
    required this.child,
  });

  final LoadingOverlayUiState uiState;

  final Widget child;

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  final _childKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final child = KeyedSubtree(key: _childKey, child: widget.child);
    if (widget.uiState == LoadingOverlayUiState.loading) {
      return PopScope(
        canPop: false,
        child: Stack(
          children: [
            child,
            ModalBarrier(color: Colors.black.withOpacity(0.7)),
            _dialog(),
          ],
        ),
      );
    } else {
      return child;
    }
  }

  Widget _dialog() {
    return Center(
      child: Material(
        color: Colors.grey.withOpacity(0.5),
        elevation: _dialogElevation,
        borderRadius: BorderRadius.circular(_dialogSize * 0.5),
        child: SizedBox(
          width: _dialogSize,
          height: _dialogSize,
          child: Center(
            child: _dialogContent(),
          ),
        ),
      ),
    );
  }

  Widget _dialogContent() {
    switch (widget.uiState) {
      case LoadingOverlayUiState.hidden:
        return const SizedBox.shrink();
      case LoadingOverlayUiState.loading:
        return const CircularProgressIndicator(
          color: MyColors.white,
        ); // CommonLoading();
    }
  }
}
