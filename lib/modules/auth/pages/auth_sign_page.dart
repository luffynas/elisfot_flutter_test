import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:elisoft_flutter_test/modules/auth/bloc/auth_bloc.dart';
import 'package:elisoft_flutter_test/utils/text_util.dart';
import 'package:elisoft_flutter_test/widgets/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthSignPage extends StatefulWidget {
  const AuthSignPage({super.key});

  @override
  AuthSignPageState createState() => AuthSignPageState();
}

class AuthSignPageState extends State<AuthSignPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _textEmailController = TextEditingController();
  final _textPasswordController = TextEditingController();

  bool _isSecure = true;

  @override
  void initState() {
    super.initState();

    _textEmailController.text = 'rachman.latif@gmail.com';
    _textPasswordController.text = 'testing';
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handlePressLogin() {
    HapticFeedback.vibrate();

    final _email = _textEmailController.text;
    final _password = _textPasswordController.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      BlocProvider.of<AuthBloc>(context).add(SignIn(
        email: _email,
        password: _password,
      ));
    }
  }

  bool get isValid =>
      textUtils.validateEmail(_textEmailController.text) &&
      _textPasswordController.text.length >= 6;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      key: _scaffoldKey,
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Stack(
        children: [
          ListView(
            children: [
              Text(
                'My Apps',
                style: AppTypography.heading4,
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Image.asset(
                  'assets/images/bg_login.png',
                ),
              ),
              _buildForm(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    final focus = FocusNode();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            FocusScope.of(context).unfocus();
            showLoading(context, 'Please wait...');
          } else if (state is LoginSuccess) {
            dissmissLoading(context);
          } else if (state is LoginFieldError) {
            HapticFeedback.vibrate();
          } else if (state is LoginFailure) {
            HapticFeedback.vibrate();
            dissmissLoading(context);
            showSnackBar(context, state.error, Status.FAILED);
          }
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  EdtronsTextForm(
                    textController: _textEmailController,
                    labelText: 'Email',
                    hintText: 'Masukkan email Anda',
                    onSubmited: (value) {
                      FocusScope.of(context).requestFocus(focus);
                      _handlePressLogin();
                    },
                  ),
                  const SizedBox(height: 16),
                  EdtronsTextForm(
                    textController: _textPasswordController,
                    labelText: 'Password',
                    hintText: 'Masukkan password Anda',
                    obscureText: _isSecure,
                    onSubmited: (value) {
                      FocusScope.of(context).requestFocus(focus);
                      _handlePressLogin();
                    },
                    suffixIcon: IconButton(
                      icon: !_isSecure
                          ? const Icon(
                              Icons.visibility,
                              color: Color(0xff039fc0),
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.black12,
                            ),
                      onPressed: () {
                        setState(() {
                          _isSecure = !_isSecure;
                        });
                      },
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 32),
                  EdtronsButton(
                    title: 'Masuk',
                    backgroundColor: AppColors.greenDark,
                    color: AppColors.white,
                    widgetType: WidgetType.lg,
                    onPressed: isValid ? _handlePressLogin : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
