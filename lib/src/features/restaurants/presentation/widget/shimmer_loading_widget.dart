import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerLoadingWidget({
  required Widget child,
}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(.6),
    highlightColor: Colors.grey.withOpacity(.3),
    child: child,
  );
}
