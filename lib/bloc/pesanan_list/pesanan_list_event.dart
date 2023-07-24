part of 'pesanan_list_bloc.dart';

@immutable
abstract class PesananListEvent {}

class GetListEvents extends PesananListEvent {
  int payment_status;
  int user_id;

  GetListEvents({
    required this.payment_status,
    required this.user_id,
  });
}
