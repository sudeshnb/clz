import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clz/src/core/constants/constants.dart';
import 'package:clz/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageView extends StatelessWidget {
  ///[imagePath] is required parameter for showing image
  final String? imagePath;

  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final String placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final BoxBorder? border;
  final bool overlay;

  ///a [CustomImageView] it can be used for showing any type of images
  /// it will shows the placeholder image if image is not found on network image
  const CustomImageView({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = 'assets/icons/image_not_found.png',
    this.overlay = false,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(onTap: onTap, child: _buildCircleImage()),
    );
  }

  ///build the image with border radius
  dynamic _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius!)),
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  ///build the image with border and border radius style
  dynamic _buildImageWithBorder() {
    if (border != null) {
      return Container(
        // clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: border,
          // borderRadius: radius,
          borderRadius: BorderRadius.all(Radius.circular(radius!)),
        ),
        child: _buildImageOverlay(),
      );
    } else {
      return _buildImageOverlay();
    }
  }

  ///build the image with border and border radius style
  Widget _buildImageOverlay() {
    if (overlay) {
      return SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            _buildImageView(),
            Container(color: AppColor.green.withValues(alpha: 0.1)),
          ],
        ),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svg:
          return SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              imagePath!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            ),
          );
        case ImageType.svgNetwork:
          return SizedBox(
            height: height,
            width: width,
            child: SvgPicture.network(
              imagePath!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            ),
          );
        case ImageType.file:
          return Image.file(
            File(imagePath!),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            fit: fit,
            imageUrl: imagePath!,
            color: color,
            placeholder: (_, p_) => const _ImagePlaceholder(),
            errorWidget: (_, p_, pp_) => const _ImageError(),
          );
        case ImageType.png:
        default:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
      }
    }
    return const SizedBox();
  }
}

extension ImageTypeExtension on String {
  ImageType get imageType {
    if ((startsWith('http') || startsWith('https')) && endsWith('.svg')) {
      return ImageType.svgNetwork;
    } else if ((startsWith('http') || startsWith('https')) &&
        !endsWith('.svg')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, network, file, unknown, svgNetwork }

class _ImageError extends StatelessWidget {
  const _ImageError();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.error_outline,
        size: 40.r,
        color: context.colorScheme.onErrorContainer,
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    // return AppLoading(context).arc;
    return SizedBox();
  }
}
