import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:unxfy/widgets/header_title.dart';
import 'package:unxfy/widgets/header_value.dart';

class HomePageLayout extends StatefulWidget {
  final String header_title;
  final String header_label;
  final double header_value;
  final Widget child;

  const HomePageLayout(
      {Key? key,
      required this.child,
      required this.header_title,
      required this.header_label,
      required this.header_value})
      : super(key: key);

  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(36, 64, 36, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            title: widget.header_title,
          ),
          const SizedBox(height: 28),
          HeaderValue(
            label: widget.header_label,
            value: widget.header_value,
          ),
          const SizedBox(height: 70),
          widget.child
        ],
      ),
    ));
  }
}
