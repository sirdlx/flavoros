import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavor/web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';


class ThumbTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String cover;

  final DataItem data;

  final double borderRadius;

  final double elevation;

  const ThumbTile({
    Key key,
    this.title,
    this.subtitle,
    this.cover,
    this.borderRadius = 28,
    this.elevation = 0,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      animationDuration: Duration(milliseconds: 700),
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.all(Radius.circular(this.borderRadius)),
      child: new GridTile(
        footer: new GridTileBar(
          title: this.title != null
              ? Text(
                  '${this.title}',
                  style: TextStyle(
                    shadows: [
                      BoxShadow(
                          blurRadius: 2,
                          color: Colors.black.withOpacity(.5),
                          offset: Offset(-2, 1),
                          spreadRadius: 6)
                    ],
                    //  fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          subtitle: this.subtitle != null
              ? Text("  ${this.subtitle}",
                  style: TextStyle(
                    shadows: [
                      BoxShadow(
                          blurRadius: 2,
                          color: Colors.black.withOpacity(.5),
                          offset: Offset(-2, 1),
                          spreadRadius: 6)
                    ],
                  ))
              : null,
        ),
        child: this.cover != null
            ? CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "${this.cover}",
                placeholder: (context, url) => ShimmerPlaceholder(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : Container(),
      ),
    );
  }
}

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).primaryColorDark.withOpacity(.5),
      highlightColor: Theme.of(context).primaryColorDark.withOpacity(.6),
      child: Container(
        height: 200,
        width: 200,
        color: Colors.white,
      ),
    );
  }
}
