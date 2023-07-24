part of 'pesanan_list_bloc.dart';

@immutable
abstract class PesananListState {}

class PesananListInitial extends PesananListState {}

class PesananListLoading extends PesananListState {}

class PesananListLoaded extends PesananListState {
  final List<PesananListModel> pesananListResponse;
  PesananListLoaded({required this.pesananListResponse});
}

class PesananListError extends PesananListState {
  final String? message;
  PesananListError({required this.message});
}
