import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.productImageUrl,
  }) : super(key: key);
  final String productImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          50.sp,
        ),
        image: DecorationImage(
          image: NetworkImage(productImageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
