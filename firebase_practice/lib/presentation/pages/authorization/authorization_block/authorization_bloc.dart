import 'package:bloc/bloc.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizationState.initial()) {
    on<AuthorizationActionSwitched>(
      _onAuthorizationActionSwitched,
    );
  }

  void _onAuthorizationActionSwitched(
    AuthorizationActionSwitched event,
    Emitter<AuthorizationState> emit,
  ) {
    print('object');
    emit(
      state.copyWith(
        showLoginPage: !state.showLoginPage,
      ),
    );
  }
}
