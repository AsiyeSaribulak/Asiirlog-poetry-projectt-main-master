import 'package:flutter_bloc/flutter_bloc.dart';

import '../Wİdget/SiirDurum.dart';
import '../dataAccess/SiirlerRepository.dart';

class SiirCubit extends Cubit<SiirDurum> {
  late SiirlerRepository siirRepository;

  SiirCubit(this.siirRepository) : super(SiirBaslangicDurumu());

  Future<void> SiirAl(int sair_id) async {
    try {
      emit(SiirlerYukleniyor());
      var SiirCevap = await siirRepository.tumSiirlerBySairId(sair_id);
      emit(SiirlerYuklendi(SiirCevap));
    } catch (e) {
      emit(SiirHata("şiirler alınırken hata oluştu"));
    }
  }

  Future<void> SiirSil(int sair_id, int siir_id) async {
    try {
      emit(SiirlerYukleniyor());
      await siirRepository.favoriSil(siir_id);
      var SiirCevap = await siirRepository.tumSiirlerBySairId(sair_id);
      emit(SiirlerYuklendi(SiirCevap));
    } catch (e) {
      emit(SiirHata("Şiirler alınırken hata oluştu"));
    }
  }

  Future<void> SiirEkle(int sair_id, int siir_id, String siir_baslik,
      String siir_icerik, String sair_ad, sair_slug) async {
    try {
      emit(SiirlerYukleniyor());
      await siirRepository.favoriEkleSql(
          siir_id, siir_baslik, siir_icerik, sair_ad, sair_slug);
      var SiirCevap = await siirRepository.tumSiirlerBySairId(sair_id);
      emit(SiirlerYuklendi(SiirCevap));
    } catch (e) {
      emit(SiirHata("Şiirler alınırken hata oluştu"));
    }
  }
}
