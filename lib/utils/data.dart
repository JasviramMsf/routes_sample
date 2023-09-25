import 'package:routes/utils/constants.dart';

final optionList = [
  generateCallPutValues(LIST_COUNT, CHNAGE_TXT),
  generateCallPutValues(LIST_COUNT, OI_TXT),
  generateCallPutValues(LIST_COUNT, LTP_TXT)
];

List<String> generateCallPutValues(int count, String type) {
  List<String> result = [];
  String multiple = '';
  for (int i = 1; i <= count; i++) {
    if (type == LTP_TXT) {
      multiple = (i + 0.5).toString();
    } else if (type == OI_TXT) {
      multiple = (i + 50).toString();
    } else {
      multiple = "${i + 0.3}%";
    }
    result.add(multiple);
  }
  return result;
}

final strikePriceList = [generateMultiplesOf5(LIST_COUNT)];

List<String> generateMultiplesOf5(int count) {
  List<String> result = [];

  for (int i = 1; i <= count; i++) {
    String multiple = (i * 5.0).toString();
    result.add(multiple);
  }
  return result;
}