import 'package:flutter/material.dart';

void main() => runApp(const ToolBar(
      pageTitile: '',
      automaticallyImplyLeading: false,
    ));

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitile;
  final bool automaticallyImplyLeading;

  const ToolBar(
      {required this.pageTitile,
      required this.automaticallyImplyLeading,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const AppBarTheme _style = AppBarTheme(
      backgroundColor: Colors.black,
      centerTitle: true,
      shadowColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(2), top: Radius.circular(2)),
      ),
    );

    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading:
          automaticallyImplyLeading ? BackButton(color: Colors.white) : null,
      backgroundColor: Colors.black,
      centerTitle: true,
      shadowColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(2), top: Radius.circular(2)),
      ),
      title: Text(
        pageTitile,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
