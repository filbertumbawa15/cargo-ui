import 'package:cargo_ui/bloc/login_user/login_user_bloc.dart';
import 'package:cargo_ui/bloc/register_user/register_user_bloc.dart';
import 'package:cargo_ui/ui/user/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loggedIn = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // get prefs => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<LoginUserBloc>(
            create: (context) => LoginUserBloc(),
          ),
        ],
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back Guy!',
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      'Sign in to your account',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: TextFormField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Color(0xFFB7B7B7)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                hintText: "Enter your Username",
                                filled: true,
                                fillColor: Color(0xFFFFFFFF),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xFF8B8B8B)),
                                ),
                              ),
                              onChanged: (val) {}),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: TextFormField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Color(0xFFB7B7B7)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                hintText: "Enter your password",
                                filled: true,
                                fillColor: Color(0xFFFFFFFF),
                                suffixIcon: Icon(Icons.visibility_off),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xFF8B8B8B)),
                                ),
                              ),
                              onChanged: (val) {}),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: const Text(
                              "Forgot your Password?",
                              style: TextStyle(
                                color: Color(0xFF41D5FB),
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 65.0,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: BlocConsumer<LoginUserBloc, LoginUserState>(
                          listener: (context, state) {
                            if (state is LoginUserSuccess) {
                              Navigator.pushNamed(context, '/dashboard');
                            }
                          },
                          builder: (context, state) {
                            if (state is LoginUserLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is LoginUserError) {
                              return Center(
                                child: Text(state.message),
                              );
                            }
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF41D5FB),
                              ),
                              onPressed: () async {
                                context.read<LoginUserBloc>().add(
                                      LoggedInUserEvent(
                                        username:
                                            _usernameController.text.toString(),
                                        password:
                                            _passwordController.text.toString(),
                                      ),
                                    );
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have account? ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                          GestureDetector(
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xFF41D5FB),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                          ),
                        ],
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
}
