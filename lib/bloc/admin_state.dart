part of 'admin_bloc.dart';

@immutable
sealed class UserState extends Equatable {}

final class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}
final class DataLoadingState extends UserState{
   final bool isLoading;
  DataLoadingState(this.isLoading);
  @override
  List<Object?> get props => [isLoading];
}
final class DataLoadedState extends UserState {
  final UserModel userModel;
   DataLoadedState(this.userModel);
  @override
  List<Object?> get props => [userModel];
}

final class DataLoadingErrorSate extends UserState{
  final String? errorMessage ;
  DataLoadingErrorSate(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
