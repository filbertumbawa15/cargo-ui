part of 'pesanan_store_bloc.dart';

@immutable
abstract class PesananStoreState {}

class PesananStoreInitial extends PesananStoreState {}

class PesananStoreLoading extends PesananStoreState {}

class PesananStoreSuccess extends PesananStoreState {
  final PesananStoreResponse pesananStoreResponse;
  PesananStoreSuccess({required this.pesananStoreResponse});
}

class PesananStoreError extends PesananStoreState {
  final String? message;
  PesananStoreError({required this.message});
}
