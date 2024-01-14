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
    return AppBar(
      elevation: 10,
      shadowColor: Color(0xffaba9a9),
      backgroundColor: const Color(0xff030303),
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 33,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarHeight: MediaQuery.of(context).size.height / 5,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: true,
      title: Text(pageTitile),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom:
                new Radius.elliptical(MediaQuery.of(context).size.width, 53.0)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}
