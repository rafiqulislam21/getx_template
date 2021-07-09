import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatelessWidget {
  late final String url;

  CustomWebView({Key? key, required this.url}) : super(key: key);

  // final bool isLoading = true;
  // final bool isError = false;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isError = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isError,
        builder: (BuildContext context, bool value, Widget? child) {
          return SizedBox(
            child: isError.value
                ? Scaffold(
                    body: Center(
                      child: Text('Not Available!'),
                    ),
                  )
                : ValueListenableBuilder<bool>(
                    valueListenable: isLoading,
                    builder: (BuildContext context, bool value, Widget? child) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: WebView(
                              initialUrl: url,
                              onWebResourceError: (error) {
                                isError.value = true;
                              },
                              javascriptMode: JavascriptMode.unrestricted,
                              onPageFinished: (val) {
                                isLoading.value = false;
                              },
                            ),
                          ),
                          isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SizedBox(),
                        ],
                      );
                    }),
          );
        });
  }
}

/*
class CustomWebView extends StatefulWidget {
  final String url;

  const CustomWebView({Key key, this.url}) : super(key: key);

  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  bool isLoading = true;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return isError
        ? Scaffold(
          body: Center(
              child: Text('Not Available!'),
            ),
        )
        : Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: WebView(
                  initialUrl: widget.url ?? "",
                  onWebResourceError: (error) {
                    setState(() {
                      isError = true;
                    });
                  },
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: (val) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(),
            ],
          );
  }
}
*/
