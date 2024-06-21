import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/platform_widget.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar> implements PreferredSizeWidget {
  final Widget title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? color;
  final bool needBackButton;
  final double? appBarSize;
  const PlatformAppBar({
    super.key,
    required this.title,
    this.leading,
    this.bottom,
    this.elevation,
    this.color,
    this.needBackButton = true,
    this.appBarSize,
  });

  @override
  Size get preferredSize => Size.fromHeight(appBarSize ?? UIHelper.setSp(70));

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) => CupertinoNavigationBar(
        middle: title,
        leading: leading,
      );

  @override
  AppBar createAndroidWidget(BuildContext context) => AppBar(
        title: title,
        leadingWidth: !needBackButton ? 0 : null,
        leading: !needBackButton
            ? null
            : leading ??
                IconButton(
                  onPressed: () => AutoRouter.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
        bottom: bottom,
        elevation: elevation ?? 0,
        backgroundColor: color,
      );
}
