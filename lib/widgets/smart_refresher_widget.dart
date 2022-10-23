import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

typedef SmartRefresherWidgetBuilder = Widget Function(
    BuildContext context, RefreshController refreshController);

class SmartRefresherWidget extends StatefulWidget {
  final String textNoMoreData;
  final bool enablePullUp;
  final SmartRefresherWidgetBuilder builder;
  final void Function(BuildContext, RefreshController)? onRefresh;
  final void Function(BuildContext, RefreshController)? onLoading;
  const SmartRefresherWidget({
    Key? key,
    required this.builder,
    this.enablePullUp = true,
    this.onLoading,
    this.onRefresh,
    this.textNoMoreData = 'No more feed',
  }) : super(key: key);

  @override
  _SmartRefresherWidgetState createState() => _SmartRefresherWidgetState();
}

class _SmartRefresherWidgetState extends State<SmartRefresherWidget> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: widget.enablePullUp,
      header: const WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget? body;
          if (mode == LoadStatus.idle) {
            body = const Text('Pull up load');
          } else if (mode == LoadStatus.loading) {
            body = const CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text('Load Failed!Click retry!');
          } else if (mode == LoadStatus.canLoading) {
            body = const Text('release to load more');
          } else {
            body = Text(widget.textNoMoreData);
          }
          return SizedBox(
            height: 55,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: () {
        widget.onRefresh!(context, _refreshController);
        log('---onRefresh ${_refreshController.isRefresh}');
      },
      onLoading: () => widget.onLoading!(context, _refreshController),
      child: widget.builder(context, _refreshController),
    );
  }
}
