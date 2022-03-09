import 'dart:math';

import 'package:flutter/material.dart';

mixin PageViewControlMixin {
  int get totalPages;

  set currentPage(int value);

  int get currentPage;

  PageController get controller;

  int _clampPage(int value) => max(0, min(value, totalPages - 1));

  void jumpToPage(int page) {
    final _page = _clampPage(page);
    if (_page == currentPage) return;
    controller.jumpToPage(_page);
    currentPage = _page;
  }

  Future<void> animateToPage(int page, Duration duration,
      {Curve curve = Curves.easeInCubic}) async {
    final _page = _clampPage(page);
    if (_page == currentPage) return;
    await controller
        .animateToPage(
      page,
      curve: curve,
      duration: duration,
    )
        .then(
      (_) {
        currentPage = _page;
      },
    );
  }

  void jumpToNextPage() {
    final page = currentPage + 1;
    jumpToPage(page);
  }

  void jumpToPreviousPage() {
    final page = currentPage - 1;
    jumpToPage(page);
  }

  Future<void> animateToNextPage(Duration duration,
      {Curve curve = Curves.easeInCubic}) async {
    final page = min(totalPages, currentPage + 1);
    await animateToPage(page, duration);
  }

  Future<void> animateToPreviousPage(Duration duration,
      {Curve curve = Curves.easeInCubic}) async {
    final page = currentPage - 1;
    await animateToPage(page, duration);
  }
}
