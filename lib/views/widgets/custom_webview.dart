import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


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
        ? Center(
          child:Text('not_available'),
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
/*

class CustomWebViewLandscape extends StatefulWidget {
  final String url;
  final int stockId;
  final String stockName;

  const CustomWebViewLandscape({
    Key key,
    this.url,
    this.stockId,
    this.stockName,
  }) : super(key: key);

  @override
  _CustomWebViewLandscapeState createState() => _CustomWebViewLandscapeState();
}

class _CustomWebViewLandscapeState extends State<CustomWebViewLandscape> {
  DateTime backButtonPressedTime;
  bool isLoading = true;
  bool isError = false;

  Future<bool> onWillPop() async {
    */
/*DateTime currentTime = DateTime.now();

    bool backButton = backButtonPressedTime == null ||
        currentTime.difference(backButtonPressedTime) > Duration(seconds: 1);

    if (backButton) {
      HapticFeedback.vibrate();
      backButtonPressedTime = currentTime;

//      pageController.animateToPage(0,duration: Duration(milliseconds: 800),curve: Curves.easeOutExpo);
      return false;
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MarketDetails(
            stockId: widget.stockId,
            stockName: widget.stockName,
          ))
      );
    }*//*

    */
/*SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MarketDetails(
                  stockId: widget.stockId,
                  stockName: widget.stockName,
                )));*//*

    return true;
  }

  Future<bool> onlyPop() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return WillPopScope(
      onWillPop: widget.stockId == null ? onlyPop : onWillPop,
      child: SafeArea(
        child: isError
            ? Center(
                child: EmptyWidget(
                  icon: Icons.insert_chart,
                  title: tr('not_available'),
                ),
              )
            :Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: WebView(
                initialUrl: widget.url ?? "",
                javascriptMode: JavascriptMode.unrestricted,
                onWebResourceError: (error){
                  setState(() {
                    isError = true;
                  });
                },
                onPageFinished: (val) {
                  if (mounted) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
*/
