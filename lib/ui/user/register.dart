import 'package:cargo_ui/bloc/register_user/register_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _controllerFirstName = TextEditingController();

  final TextEditingController _controllerLastName = TextEditingController();

  final TextEditingController _controllerUsername = TextEditingController();

  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterUserBloc(),
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
                      'Create your account',
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      'Already have an account? Log In',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "First Name",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: TextFormField(
                              controller: _controllerFirstName,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Color(0xFFB7B7B7)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                hintText: "Enter your firstname",
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
                          "Last Name",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: TextFormField(
                              controller: _controllerLastName,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Color(0xFFB7B7B7)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                hintText: "Enter your lastname",
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
                          "Username",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: TextFormField(
                              controller: _controllerUsername,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Color(0xFFB7B7B7)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                hintText: "Enter your username",
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
                          "Email",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: TextFormField(
                              controller: _controllerEmail,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Color(0xFFB7B7B7)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                hintText: "Enter your email",
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
                              controller: _controllerPassword,
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
                    SizedBox(height: 12.0),
                    SizedBox(
                      height: 65.0,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child:
                            BlocConsumer<RegisterUserBloc, RegisterUserState>(
                          listener: (context, state) {
                            if (state is RegisterUserSuccess) {
                              Navigator.pushNamed(context, '/login');
                            }
                          },
                          builder: (context, state) {
                            if (state is RegisterUserLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is RegisterUserError) {
                              return Center(
                                child: Text(state.message),
                              );
                            }
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF41D5FB),
                              ),
                              onPressed: () async {
                                context.read<RegisterUserBloc>().add(
                                      CreateUserEvent(
                                        username:
                                            _controllerUsername.text.toString(),
                                        email: _controllerEmail.text.toString(),
                                        isActive: true,
                                        isCustomer: true,
                                        firstName: _controllerFirstName.text
                                            .toString(),
                                        lastName:
                                            _controllerLastName.text.toString(),
                                        password1:
                                            _controllerPassword.text.toString(),
                                        password2:
                                            _controllerPassword.text.toString(),
                                      ),
                                    );
                              },
                              child: Text(
                                'Sign Up',
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
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "By Clicking “Sign Up” you agree to our terms and conditions as well our privacy policy",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                        textAlign: TextAlign.center,
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
