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
        title: "onBoardHeader1",
        subTitle: "onBoardBody1"),
    OnBoardingModel(
        imagePath: ImageConstants.onboarding2,
        title: "onBoardHeader2",
        subTitle: "onBoardBody2"
    ),
    OnBoardingModel(
        imagePath: ImageConstants.onboarding3,
        title: "onBoardHeader3",
        subTitle: "onBoardBody3"),
  ];

  void updateIndex(int newIndex) {
    emit(UpDateIndexLoading());
    currentIndex = newIndex;
    emit(UpDateIndex(currentIndex: newIndex));
  }
}