abstract class WriteDataCubitState {}

class WriteDataCubitInitial extends WriteDataCubitState {}

class WriteDataCubitLoading extends WriteDataCubitState {}

class WriteDataCubitSuccess extends WriteDataCubitState {}

class WriteDataCubitFailure extends WriteDataCubitState {
  final String errorMessage;

  WriteDataCubitFailure({required this.errorMessage});
}
