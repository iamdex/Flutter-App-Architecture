import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: viewModel.getPages(),
            // bottomNavigationBar: BottomNavigationBar(
            //   items: <BottomNavigationBarItem>[
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.account_circle), label: "characters".tr()),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.dashboard), label: "episodes".tr()),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.location_city), label: "locations".tr()),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.settings), label: "settings".tr()),
            //   ],
            //   onTap: viewModel.onItemTapped,
            //   currentIndex: viewModel.selectedIndex,
            // ),
          );
        });
  }
}
