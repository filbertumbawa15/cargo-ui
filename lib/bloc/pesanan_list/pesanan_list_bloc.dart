import 'package:bloc/bloc.dart';
import 'package:cargo_ui/models/pesanan_store_models.dart';
import 'package:cargo_ui/params/pesanan_list_param.dart';
import 'package:cargo_ui/repo/pesanan_repository.dart';
import 'package:cargo_ui/response/pesanan_list_response.dart';
import 'package:meta/meta.dart';

part 'pesanan_list_event.dart';
part 'pesanan_list_state.dart';

class PesananListBloc extends Bloc<PesananListEvent, PesananListState> {
  final pesananRepository = PesananRepository();
  PesananListBloc() : super(PesananListInitial()) {
    on<GetListEvents>((event, emit) async {
      emit(PesananListLoading());
      try {
        final params = PesananListParam(
          event.payment_status,
          event.user_id,
        );
        PesananListResponse response =
            await pesananRepository.listPesanan(params);
        emit(PesananListLoaded(pesananListResponse: response.listpesananModel));
      } catch (e) {
        emit(PesananListError(message: e.toString()));
      }
    });
  }
}
