part of 'authorization_bloc.dart';

class AuthorizationState {
  final bool showLoginPage;

  AuthorizationState.initial() : this(showLoginPage: true);

  AuthorizationState({
    required this.showLoginPage,
  });

  AuthorizationState copyWith({
    bool? showLoginPage,
  }) {
    return AuthorizationState(
      showLoginPage: showLoginPage ?? this.showLoginPage,
    );
  }
}
