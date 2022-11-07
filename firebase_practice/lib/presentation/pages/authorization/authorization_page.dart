import 'package:flutter/material.dart';
import 'package:firebase_practice/presentation/pages/authorization/authorization_block/authorization_bloc.dart';
import 'package:firebase_practice/presentation/pages/authorization/login_page.dart';
import 'package:firebase_practice/presentation/pages/authorization/registration_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthorizationBloc authorizationBloc = AuthorizationBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => authorizationBloc,
      child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
        builder: (context, state) {
          return state.showLoginPage ? const LoginPage() : const RegistrationPage();
        },
      ),
    );
  }
}
