import 'package:bloc/bloc.dart';
import 'package:cargo_ui/params/pesanan_store_param.dart';
import 'package:cargo_ui/repo/pesanan_repository.dart';
import 'package:cargo_ui/response/pesanan_store_response.dart';
import 'package:meta/meta.dart';

part 'pesanan_store_event.dart';
part 'pesanan_store_state.dart';

class PesananStoreBloc extends Bloc<PesananStoreEvent, PesananStoreState> {
  final pesananRepository = PesananRepository();
  PesananStoreBloc() : super(PesananStoreInitial()) {
    on<CreatePesananStoreEvent>(_storePesanan);
  }

  void _storePesanan(
      CreatePesananStoreEvent event, Emitter<PesananStoreState> emit) async {
    final params = PesananStoreParam(
      event.payment_code,
      event.jarak,
      event.waktu,
      //Sender
      event.namapengirim,
      event.notelppengirim,
      event.alamatdetailpengirim,
      event.placeidlokasiasal,
      event.note_pengirim,
      //Receiver
      event.namapenerima,
      event.notelppenerima,
      event.alamatdetailpenerima,
      event.placeidlokasitujuan,
      event.note_penerima,
      //Other
      event.harga,
      event.type_cargo,
      event.category,
      event.user_id,
    );
    emit(PesananStoreLoading());
    try {
      PesananStoreResponse response =
          await pesananRepository.storePesanan(params);
      emit(PesananStoreSuccess(pesananStoreResponse: response));
    } catch (e) {
      emit(PesananStoreError(message: e.toString()));
    }
  }
}
