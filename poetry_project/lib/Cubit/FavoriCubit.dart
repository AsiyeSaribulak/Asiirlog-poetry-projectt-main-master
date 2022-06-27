import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poetry_project/dataAccess/FavorilerRepository.dart';
import '../Wİdget/FavoriDurum.dart';

class FavoriCubit extends Cubit<FavoriDurum> {
  late FavorilerRepository favorilerRepository;

  FavoriCubit(this.favorilerRepository) : super(FavorilerBaslangicDurumu());

  Future<void> FavoriAl() async {
    try {
      emit(FavorilerYukleniyor());
      var FavoriCevap = await favorilerRepository.tumFavoriler();
      emit(FavorilerYuklendi(FavoriCevap));
    } catch (e) {
      emit(FavorilerHata("şiirler alınırken hata oluştu"));
    }
  }

  Future<void> FavoriSil(int siir_id) async {
    try {
      emit(FavorilerYukleniyor());
      await favorilerRepository.favoriSil(siir_id);
      var FavoriCevap = await favorilerRepository.tumFavoriler();
      emit(FavorilerYuklendi(FavoriCevap));
    } catch (e) {
      emit(FavorilerHata("Şiirler alınırken hata oluştu"));
    }
  }

  Future<void> FavoriEkle(int siir_id, String siir_baslik, String siir_icerik,
      String sair_ad, String sair_slug) async {
    try {
      emit(FavorilerYukleniyor());
      await favorilerRepository.favoriEkleSql(
          siir_id, siir_baslik, siir_icerik, sair_ad, sair_slug);
      var FavoriCevap = await favorilerRepository.tumFavoriler();
      emit(FavorilerYuklendi(FavoriCevap));
    } catch (e) {
      emit(FavorilerHata("Şiirler alınırken hata oluştu"));
    }
  }
}
