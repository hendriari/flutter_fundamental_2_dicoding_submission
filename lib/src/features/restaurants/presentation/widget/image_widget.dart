import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/shimmer_loading_widget.dart';
import 'package:go_router/go_router.dart';

class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? imageHeight;
  final double? imageWidth;
  final double? borderRadius;

  const ImageWidget({
    super.key,
    required this.imageUrl,
    this.borderRadius,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ??
          'https://icon-library.com/images/image-placeholder-icon/image-placeholder-icon-3.jpg',
      imageBuilder: (context, imageProvider) => Material(
        child: InkWell(
          onTap: () =>
              showImage(imageProvider: imageProvider, context: context),
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          splashColor: Colors.grey.withOpacity(.5),
          child: Container(
            height: imageHeight,
            width: imageWidth,
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

  Future<dynamic> showImage({
    required BuildContext context,
    required ImageProvider imageProvider,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(
            left: 2.w,
            right: 2.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: imageProvider,
              ),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () => context.pop(),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.cancel_outlined,
                    color: Colors.black,
                    size: 25.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
