import 'package:flutter/material.dart';

class AppBarBase extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final TabBar? bottom;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;

  const AppBarBase({
    super.key,
    this.onBackPressed,
    required this.title,
    this.bottom,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: actions,
      bottom: bottom,
      title: title,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
