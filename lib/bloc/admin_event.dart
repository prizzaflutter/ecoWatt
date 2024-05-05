part of 'admin_bloc.dart';

@immutable
sealed class UserEvent extends Equatable {}

final class  SignUpUserEvent extends UserEvent {
  final String email;
  final String password ;
  SignUpUserEvent({required this.email , required this.password});
  @override
  List<Object?> get props => [email , password];
}

final class LogInUserEvent extends UserEvent {
  final String email  ;
  final String password ;
  LogInUserEvent({required this.email , required this.password});
  @override
  List<Object?> get props => [email , password];
}

final class SignOutUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
