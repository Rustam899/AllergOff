import 'package:allerg_off_prototype/domain/User.dart';
import 'package:allerg_off_prototype/auth.dart';
import 'package:allerg_off_prototype/home/Navigation/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LendingPage extends StatelessWidget {
  const LendingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;
    return isLoggedIn ? BottomBar() : AuthorizationPage();
  }
}
