part of 'cek_ongkir_bloc.dart';

@immutable
abstract class CekOngkirState {}

class CekOngkirInitial extends CekOngkirState {}

class CekOngkirLoading extends CekOngkirState {}

class CekOngkirLoaded extends CekOngkirState {
  final List<CekOngkirModel> listCekOngkirModel;
  CekOngkirLoaded({required this.listCekOngkirModel});
}

class CekOngkirError extends CekOngkirState {
  final String message;

  CekOngkirError({required this.message});
}
