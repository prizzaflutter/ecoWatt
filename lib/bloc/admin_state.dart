part of 'admin_bloc.dart';

@immutable
sealed class AdminState extends Equatable {}

final class AdminInitial extends AdminState {
  @override
  List<Object?> get props => [];
}
final class DataLoadingState extends AdminState{
   final bool isLoading;
  DataLoadingState(this.isLoading);
  @override
  List<Object?> get props => [isLoading];
}
final class DataLoadedState extends AdminState {
  final AdminModel adminModel;
   DataLoadedState(this.adminModel);
  @override
  List<Object?> get props => [adminModel];
}
final class DataLoadingErrorSate extends AdminState{
  final String? errorMessage ;
  DataLoadingErrorSate(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
final class ReportGetSuccessfullyState extends AdminState{
  final ReportModel reportModel ;
  ReportGetSuccessfullyState({required this.reportModel});
  @override
  List<Object?> get props => [reportModel];

}
final class ReportLoadingState extends AdminState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class ReportLoadingErrorState extends AdminState{
  final String? ErrorMessage;
  ReportLoadingErrorState({this.ErrorMessage});
  @override
  List<Object?> get props => [ErrorMessage];
}
