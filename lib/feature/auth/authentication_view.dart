import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_full_news_app/feature/auth/authentication_provider.dart';
import 'package:firebase_full_news_app/feature/home/home_view.dart';
import 'package:firebase_full_news_app/product/constants/string_constants.dart';
import 'package:firebase_full_news_app/product/widget/text/sub_title_text.dart';
import 'package:firebase_full_news_app/product/widget/text/title_text.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final authProvider =
      StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  @override
  void initState() {
    super.initState();
    checkUser(FirebaseAuth.instance.currentUser);
  }

  void checkUser(User? user) {
    ref.read(authProvider.notifier).fetchUserDetail(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: firebase.FirebaseUIActions(
          actions: [
            AuthStateChangeAction<SignedIn>(
              (context, state) {
                if (state.user != null) checkUser(state.user);
                Navigator.of(context).push(
                  // ignore: inference_failure_on_instance_creation
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
            ),
          ],
          child: SafeArea(
            child: Padding(
              padding: context.padding.low,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _header(context),
                    Padding(
                      padding: context.padding.normal,
                      child: firebase.LoginView(
                        action: AuthAction.signIn,
                        providers: firebase.FirebaseUIAuth.providersFor(
                          FirebaseAuth.instance.app,
                        ),
                      ),
                    ),
                    if (ref.watch(authProvider).isRedirect)
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          StringConstants.countnieToApp,
                          textAlign: TextAlign.center,
                          style: context.general.textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(
          value: StringConstants.loginWelcomeBack,
        ),
        Padding(
          padding: context.padding.onlyTopLow,
          child: const SubTitleText(
            value: StringConstants.loginWelcomeDetail,
          ),
        ),
      ],
    );
  }
}
