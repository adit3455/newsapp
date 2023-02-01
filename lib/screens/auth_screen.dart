import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:news_app/utils/app_utils.dart';

import '../blocs/export_blocs.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/login';
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabBar = [
      _tabBarSignin(context),
      _tabBarRegister(context)
    ];

    return Scaffold(
      backgroundColor: AppUtils.loginBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppUtils.loginBackgroundColor,
        leading: const SizedBox(),
        centerTitle: true,
        title: const Text("Login Screen"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
          if (state is AuthRegistration) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                    "Registration has been completed try to Sign In in the Sign In Form")));
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UnAuthentitcated) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    Stack(
                      children: [
                        Center(
                          child: GifView.asset(
                            'assets/gif/68312-login.gif',
                            height: 225,
                            width: 225,
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.17,
                          left: MediaQuery.of(context).size.width * 0.28,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width * 0.15,
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: Card(
                                child: Text(
                              '''Read Your Favorite News From Here''',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<AuthChangerListBloc, AuthChangerListState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            FlashyTabBar(
                              backgroundColor: AppUtils.loginBackgroundColor,
                              selectedIndex: (state as AuthChangerListInitial)
                                  .selectedIndex,
                              shadows: const [],
                              showElevation: true,
                              onItemSelected: (value) {
                                context
                                    .read<AuthChangerListBloc>()
                                    .add(OnSelectedIndexAuth(value: value));
                              },
                              items: [
                                FlashyTabBarItem(
                                  icon: const Icon(Icons.login_outlined),
                                  title: const Text('Sign in'),
                                ),
                                FlashyTabBarItem(
                                  icon: const Icon(
                                      Icons.app_registration_rounded),
                                  title: const Text('Register'),
                                ),
                              ],
                            ),
                            Column(
                              children: [tabBar[(state).selectedIndex]],
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return const Text("Theres Something Wrong");
        },
      ),
    );
  }

  void _authenticateWithEmailAndPassword(
    context,
    TextEditingController emailControllerLogin,
    TextEditingController passControllerLogin,
  ) {
    BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(emailControllerLogin.text, passControllerLogin.text));
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  Column _tabBarSignin(BuildContext context) {
    TextEditingController emailControllerLogin = TextEditingController();
    TextEditingController passControllerLogin = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email', style: Theme.of(context).textTheme.bodyLarge),
        TextFormField(controller: emailControllerLogin),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Password', style: Theme.of(context).textTheme.bodyLarge),
            TextButton(onPressed: () {}, child: const Text("Forget Password?"))
          ],
        ),
        TextFormField(controller: passControllerLogin),
        const SizedBox(height: 20.0),
        Center(
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.all(10.0)),
                onPressed: () {
                  _authenticateWithEmailAndPassword(
                      context, emailControllerLogin, passControllerLogin);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ))),
        const SizedBox(height: 30.0),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {}, child: const Text("Sign In Anonymously")),
        )
      ],
    );
  }

  Column _tabBarRegister(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name', style: Theme.of(context).textTheme.bodyLarge),
        TextFormField(controller: nameController),
        const SizedBox(
          height: 10.0,
        ),
        Text('Email', style: Theme.of(context).textTheme.bodyLarge),
        TextFormField(controller: emailController),
        const SizedBox(height: 10.0),
        Text('Password', style: Theme.of(context).textTheme.bodyLarge),
        TextFormField(controller: passwordController),
        const SizedBox(height: 20.0),
        Center(
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.all(10.0)),
                onPressed: () {
                  context.read<AuthBloc>().add(SignUpWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                      nameController.text));
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ))),
        const SizedBox(height: 20.0),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {}, child: const Text("Sign In Anonymously")),
        )
      ],
    );
  }
}
