import 'package:intl/intl.dart';
import '../../../src/app_export.dart';
import 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial());

  String birthDate = DateFormat("yyyy-MM-dd").parse(
      DateTime.now().toString()).toString().substring(0, 10);
  DateTime? birthDateValue;
  DateTime? selectedBirthDateValue;

  static CalendarCubit get(context) => BlocProvider.of<CalendarCubit>(context);

  void changeBirthDate(DateTime birth) {
    birthDate = DateFormat("yyyy-MM-dd").parse(
        birth.toString()).toString().substring(0, 10);
    birthDateValue = birth;
    selectedBirthDateValue = birth;
  }

  void confirmBirthDate() {
    birthDate = DateFormat("yyyy-MM-dd").parse(
        selectedBirthDateValue.toString()).toString().substring(0, 10);
    birthDateValue = selectedBirthDateValue;
    emit(BirthDateSuccess());
  }
}
