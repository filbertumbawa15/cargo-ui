import 'package:bloc/bloc.dart';
import 'package:cargo_ui/models/cek_ongkir_models.dart';
import 'package:cargo_ui/params/cek_ongkir_param.dart';
import 'package:cargo_ui/repo/pesanan_repository.dart';
import 'package:cargo_ui/response/cek_ongkir_response.dart';
import 'package:meta/meta.dart';

part 'cek_ongkir_event.dart';
part 'cek_ongkir_state.dart';

class CekOngkirBloc extends Bloc<CekOngkirEvent, CekOngkirState> {
  final pesananrepository = PesananRepository();
  CekOngkirBloc() : super(CekOngkirInitial()) {
    on<GetCekOngkirEvent>(_cekOngkir);
  }

  void _cekOngkir(GetCekOngkirEvent event, Emitter<CekOngkirState> emit) async {
    final params = CekOngkirParam(
      event.alamatdetailpengirim,
      event.alamatdetailpenerima,
      event.berat_barang,
    );
    emit(CekOngkirLoading());
    try {
      CekOngkirResponse response = await pesananrepository.cekongkir(params);
      emit(CekOngkirLoaded(listCekOngkirModel: response.listCekOngkir));
    } catch (e) {
      emit(CekOngkirError(message: e.toString()));
    }
  }
}