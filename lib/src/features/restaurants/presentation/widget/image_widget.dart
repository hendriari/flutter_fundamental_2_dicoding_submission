import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/shimmer_loading_widget.dart';

Widget imageWidget({
  required String? imageUrl,
  double? imageHeight,
  double? imageWidth,
  double? borderRadius,
}) {
  return CachedNetworkImage(
    imageUrl: imageUrl ??
        'https://icon-library.com/images/image-placeholder-icon/image-placeholder-icon-3.jpg',
    imageBuilder: (context, imageProvider) => Material(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                left: 2.w,
                right: 2.w,
              ),
              child: Image(
                image: imageProvider,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        splashColor: Colors.grey.withOpacity(.5),
        child: Container(
          height: imageHeight,
          width: imageWidth,
          margin: EdgeInsets.all(.1.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
            boxShadow: [
              BoxShadow(
                offset: const Offset(2, 2),
                color: Colors.grey.withOpacity(.5),
                blurRadius: 3,
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imageProvider,
            ),
          ),
        ),
      ),
    ),
    placeholder: (context, url) => shimmerLoadingWidget(
      child: Container(
        height: imageHeight,
        width: imageWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurStyle: BlurStyle.solid,
              blurRadius: 3,
            ),
          ],
          color: Colors.grey,
        ),
      ),
    ),
    errorWidget: (context, url, error) => Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurStyle: BlurStyle.solid,
            blurRadius: 3,
          ),
        ],
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://icon-library.com/images/image-placeholder-icon/image-placeholder-icon-3.jpg'),
        ),
        color: Colors.grey,
      ),
    ),
  );
}
