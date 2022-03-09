import '../../../core/generics.dart';
import '../../../data/models/boarding_model.dart';

class BoardingState extends DataReadyState<List<BoardingModel>> {
  final int currentPage;
  BoardingState(List<BoardingModel> data, this.currentPage) : super(data);

  @override
  BoardingState copyWith(Map<String, dynamic> data) {
    return BoardingState(
        data['data'] ?? this.data, data['currentPage'] ?? currentPage);
  }
}
