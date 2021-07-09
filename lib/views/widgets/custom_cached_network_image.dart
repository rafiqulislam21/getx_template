import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCachedNetworkImage extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;

  const CustomCachedNetworkImage({Key? key, this.url, this.height, this.width}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: url ?? "",
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
              color: Colors.grey[400],
              border: Border.all(
                color: Colors.grey[200]!,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(child: Text("No Image",textAlign: TextAlign.center ,style: TextStyle(color: Theme.of(context).splashColor,fontSize: height == null ? 15 : height!/4),)),
          height: height,
          width: width,
        ),
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}
