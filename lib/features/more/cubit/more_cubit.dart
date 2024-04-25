import 'package:completed/features/more/cubit/more_state.dart';
import '../../../core/src/app_export.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreIdle());

  static MoreCubit get(context) => BlocProvider.of<MoreCubit>(context);
}