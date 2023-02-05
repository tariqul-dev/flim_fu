import 'package:flim_fu/src/core/presentation/widgets/text_widgets.dart';
import 'package:flim_fu/src/core/router/on_tap_manager.dart';
import 'package:flim_fu/src/features/bookmark/presentation/pages/bookmark_page.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 41, 39, 39),
      child: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                child: Container(),
              ),
              ListTile(
                onTap: () {},
                title: const WhiteTitleLargeWidget(title: 'Home'),
              ),
              ListTile(
                onTap: () {
                  Goto.navigate(
                    context,
                    routeName: BookmarkPage.routeName,
                  );
                },
                title: const WhiteTitleLargeWidget(title: 'Bookmark'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
