import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:onfly_project/app/modules/home/presentation/home_page.dart';

import '../../../../../utils/auth_utils.dart';
import '../controller/authentication_controller.dart';
import '../../../../../common/constants/app_string.dart';
import '../../../../../utils/form_field_validations.dart';
import '../../../../../common/components/custom_form_field_widget.dart';

enum AuthMode { Authenticate, Signup }

class AuthenticationFormWidget extends StatefulWidget {
  const AuthenticationFormWidget({Key? key}) : super(key: key);

  @override
  _AuthenticationFormWidgetState createState() =>
      _AuthenticationFormWidgetState();
}

class _AuthenticationFormWidgetState extends State<AuthenticationFormWidget>
    with SingleTickerProviderStateMixin {
  late AuthenticationController authenticationController;
  final TextEditingController? userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;
  final _form = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.Authenticate;
  bool _isAuthenticate() => _authMode == AuthMode.Authenticate;

  Animation<Offset>? _slideAnimation;
  Animation<double>? _opacityAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    authenticationController = GetIt.instance<AuthenticationController>();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.linear,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  void _switchAuthMode() {
    if (_isAuthenticate()) {
      setState(() => _authMode = AuthMode.Signup);
      _animationController?.forward();
    } else {
      setState(() => _authMode = AuthMode.Authenticate);
      _animationController?.reverse();
    }
  }

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _form.currentState?.save();

    try {
      await authenticationController.authenticateUser(
        AuthUtils.authAction(_isAuthenticate()),
      );
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormFieldWidget(
                controller: userController,
                hint: AppString.authenticationUserInput,
                prefix: const Icon(Icons.person),
                textInputType: TextInputType.emailAddress,
                onSaved: (value) => authenticationController.setUser(value),
                validator: (text) => FieldValidation.isEmpty(text),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormFieldWidget(
                controller: _passwordController,
                hint: AppString.authenticationPasswordInput,
                obscureText: _passwordVisible,
                prefix: const Icon(Icons.vpn_key),
                suffix: IconButton(
                  onPressed: () => setState(() {
                    _passwordVisible = !_passwordVisible;
                  }),
                  icon: _passwordVisible
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                onSaved: (value) => authenticationController.setPassword(value),
                validator: (text) => FieldValidation.valueLength(text, 6),
              ),
            ),
            AnimatedContainer(
              constraints: BoxConstraints(
                minHeight: _isAuthenticate() ? 0 : 80,
                maxHeight: _isAuthenticate() ? 0 : 160,
              ),
              duration: const Duration(milliseconds: 600),
              curve: Curves.linear,
              child: FadeTransition(
                opacity: _opacityAnimation!,
                child: SlideTransition(
                  position: _slideAnimation!,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormFieldWidget(
                      hint: AppString.authenticationConfirmPasswordInput,
                      obscureText: _passwordVisible,
                      prefix: const Icon(Icons.vpn_key),
                      suffix: IconButton(
                        onPressed: () => setState(() {
                          _passwordVisible = !_passwordVisible;
                        }),
                        icon: _passwordVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      validator: _isAuthenticate()
                          ? null
                          : (value) {
                              if (value != _passwordController.text) {
                                return AppString.notConfirmedPassword;
                              }
                              return null;
                            },
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _submit();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => const HomePage(),
                    //     fullscreenDialog: true,
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A5B9D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    _isAuthenticate()
                        ? AppString.authenticationSignInButton
                        : AppString.authenticationSignUpButton,
                  ),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: _switchAuthMode,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    _isAuthenticate()
                        ? AppString.authenticationSignUpButton
                        : AppString.authenticationSignInButton,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
