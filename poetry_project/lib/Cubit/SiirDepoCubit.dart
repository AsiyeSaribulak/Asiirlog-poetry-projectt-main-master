import 'package:flutter_bloc/flutter_bloc.dart';
import '../Wİdget/SiirDepoDurum.dart';
import '../dataAccess/SiirDepoRepository.dart';

class SiirDepoCubit extends Cubit<SiirDepoDurum> {
  late SiirDepoRepository siirDepoRepository;

  SiirDepoCubit(this.siirDepoRepository) : super(SiirDepoBaslangicDurumu());

  Future<void> SiirDepoAl() async {
    try {
      emit(SiirDepoYukleniyor());
      var SiirDepoCevap = await siirDepoRepository.tumSiirler();
      emit(SiirDepoYuklendi(SiirDepoCevap));
    } catch (e) {
      emit(SiirDepoHata("şiirler alınırken hata oluştu"));
    }
  }

  Future<void> SiirDepoSil(int siir_id) async {
    try {
      emit(SiirDepoYukleniyor());
      await siirDepoRepository.siirSil(siir_id);
      var SiirDepoCevap = await siirDepoRepository.tumSiirler();
      emit(SiirDepoYuklendi(SiirDepoCevap));
    } catch (e) {
      emit(SiirDepoHata("Şiirler alınırken hata oluştu"));
    }
  }

  Future<void> SiirDepoEkle(String siir_baslik, String siir_icerik) async {
    try {
      emit(SiirDepoYukleniyor());
      await siirDepoRepository.siirEkle(siir_baslik, siir_icerik);
      var SiirDepoCevap = await siirDepoRepository.tumSiirler();
      emit(SiirDepoYuklendi(SiirDepoCevap));
    } catch (e) {
      emit(SiirDepoHata("Şiirler alınırken hata oluştu"));
    }
  }

  Future<void> SiirDepoGuncelle(
      int siir_id, String siir_baslik, String siir_icerik) async {
    try {
      emit(SiirDepoYukleniyor());
      await siirDepoRepository.siirGuncelle(siir_id, siir_baslik, siir_icerik);
      var SiirDepoCevap = await siirDepoRepository.tumSiirler();
      emit(SiirDepoYuklendi(SiirDepoCevap));
    } catch (e) {
      emit(SiirDepoHata("Şiirler alınırken hata oluştu"));
    }
  }
}
