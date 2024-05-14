part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent extends Equatable {}

final class  SignUpAdminEvent extends AdminEvent {
  final String email;
  final String password ;
  SignUpAdminEvent({required this.email , required this.password});
  @override
  List<Object?> get props => [email , password];
}

final class LogInAdminEvent extends AdminEvent {
  final BuildContext context ;
  final String email  ;
  final String password ;
  LogInAdminEvent({required this.email , required this.password,required this.context});
  @override
  List<Object?> get props => [email , password];
}

final class SignOutAdminEvent extends AdminEvent {
  @override
  List<Object?> get props => [];
}
