import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String webViewUrl;

  const WebView({
    super.key,
    required this.webViewUrl,
  });

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebViewController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        centerTitle: false,
        title: Text(
          Constants.appName,
          style: TextStyles.font24BlackBoldOrbitron,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.blackColor,
                ),
              )
            : WebViewWidget(
                controller: _controller,
              ),
      ),
    );
  }

  WebViewController _initializeWebViewController() {
    return _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.webViewUrl))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      );
  }
}
