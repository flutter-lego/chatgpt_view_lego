import 'package:flutter/material.dart';

class AppbarView extends StatefulWidget implements PreferredSizeWidget {
  const AppbarView({super.key});

  @override
  State<AppbarView> createState() => _AppbarViewState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarViewState extends State<AppbarView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: const Color(0xFF343541),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          color: const Color(0xFF40414f),
          height: 2,
        ),
      ),
      elevation: 0,
      title: Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          'New Chat',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
          )),
      // style: GoogleFonts.roboto(
      //   fontSize: 18,
      //   fontWeight: FontWeight.w300,
      // ).copyWith(color: Colors.white)),
      centerTitle: true,
      titleSpacing: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu,
            size: 25,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: [
        const Icon(
          Icons.add,
          size: 25,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

main() async {
  return runApp(MaterialApp(
    home: AppbarView(),
  ));
}
