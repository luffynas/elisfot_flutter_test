import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:elisoft_flutter_test/modules/auth/cubit/auth_page_cubit.dart';
import 'package:elisoft_flutter_test/widgets/custom_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/main_bloc.dart';
import 'auth_sign_page.dart';

class AuthScreen extends StatefulWidget {
  final Function(BuildContext, bool)? onSuccess;
  const AuthScreen({Key? key, this.onSuccess}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int page = 1;

  List<CustomPopupMenu> channelsMenu = [
    CustomPopupMenu(id: 0, icon: Icons.edit, title: 'Create Channel'),
  ];

  Future<bool> _onBackPressed(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text(
                'Are you sure want to cancel reset password process?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('OK'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<bool> onWillPop() async {
    if (page != 1) {
      BlocProvider.of<MainBloc>(context).add(const Logout());
      await BlocProvider.of<AuthPageCubit>(context)
          .pageChange(AuthPageType.first_screen);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.bluePrimary,
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: BlocBuilder<AuthPageCubit, AuthPageState>(
                builder: (context, state) {
                  return const AuthSignPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
