import 'package:flutter/material.dart';

import '../constant/resources/resources.dart';

class CircleImageView extends StatelessWidget {
  final String imgUrl;
  final double? radius;
  final String? errorImage;
  final Color? backgroundcolor;

  const CircleImageView(
      {Key? key,
      required this.imgUrl,
      this.radius,
      this.errorImage,
      this.backgroundcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: backgroundcolor ?? R.colors.kcGrey,
        radius: radius ?? 30,
        child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ClipOval(
                child: SizedBox.fromSize(
                    size: const Size.fromRadius(40),
                    // Image radius
                    child: Image.network(imgUrl,
                        errorBuilder: (context, url, error) =>
                            Image.asset(errorImage ?? R.images.defaultAvatar),
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                              child: CircularProgressIndicator(
                                  color: R.colors.kcWhite,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null));
                        },
                        fit: BoxFit.cover)))));
  }
}
