import 'package:ibnt/src/modules/auth/auth_imports.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc(this._repository) : super(AuthInitialState()) {
    on<GoogleSignInEvent>(_mapGoogleSignInEventToState);
    on<SignOutEvent>(_mapSignOutEventToState);
  }

  final IAuthRepository _repository;

  _mapGoogleSignInEventToState(GoogleSignInEvent event, Emitter<AuthStates> state) async {
    state(AuthLoadingState());
    final result = await _repository.signInWithGoogleAccount();
    result.fold(
      (left) => state(AuthFailureState(left.exception)),
      (right) => state(AuthSuccessState(right)),
    );
  }

  _mapSignOutEventToState(SignOutEvent event, Emitter<AuthStates> state) async {
    state(AuthLoadingState());
    await _repository.signOut();
    state(AuthSignOutState());
  }
}
