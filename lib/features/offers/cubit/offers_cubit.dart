import 'dart:developer';

import '../../../core/src/app_export.dart';
import '../data/models/offer_model.dart';
import '../data/models/offers_res_model.dart';
import '../data/repository/offers_repository.dart';
part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  final OffersRepository _repository;
  OffersCubit(
      this._repository,
      ) : super(OffersIdle());

  static OffersCubit get(context) => BlocProvider.of<OffersCubit>(context);

  List<OffersModel> offersList = [];

  void getOffersData() async {
    log("message ===========>>>>>>>>> 44556}");
    emit(OffersLoading());
    try {
      await Future.wait([
        getOffers(),
      ]);
      emit(OffersSuccess());
    } catch (error) {
      emit(OffersError(networkExceptions: error as NetworkExceptions));
    }
  }

  Future<void> getOffers() async {
    NetworkService<OffersResModel> data = await _repository.getOffers();
    switch (data) {
      case Succeed<OffersResModel>(
          data: OffersResModel offersResModel
      ):
        offersList.addAll(offersResModel.offers ?? []);

      case Failure<OffersResModel>(
          networkExceptions: NetworkExceptions error
      ):
        throw error;
    }
  }
}