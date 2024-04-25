import '../../../core/src/app_export.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  static OnBoardingCubit get(context) => BlocProvider.of<OnBoardingCubit>(context);
  List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
        imagePath: ImageConstants.onboarding1,
        title: "مرحباً بكم في واتموا",
        subTitle: "تطبيق واتموا احدث تطبيق عمرة او حج للغير حتي يتمكن غير القتدرين من اداء المناسك والحصول علي اجرها طبقا لما يسمح به ديناً الاسلامي الحنيف من اداء مناسك الحج والعمره لمن فارقوا الحياه او من لا يستطيع ادائها ويقوم مؤدي الخدمة بادائها"),
    OnBoardingModel(
        imagePath: ImageConstants.onboarding2,
        title: "يمكنك تتبع أداء المناسك",
        subTitle: "يمكنك معنا الان تتبع كل خطوة من خطوات اداء العمره علي جوالك."
    ),
    OnBoardingModel(
        imagePath: ImageConstants.onboarding3,
        title: "ابدأ الأن واختر بديلك المناسب",
        subTitle: "وفرنالك بدلاء علي معرفة كبيرة بالامور الفقهية والشرعية ومناسك الحج والعمرة"),
  ];

  void updateIndex(int newIndex) {
    emit(UpDateIndexLoading());
    currentIndex = newIndex;
    emit(UpDateIndex(currentIndex: newIndex));
  }
}