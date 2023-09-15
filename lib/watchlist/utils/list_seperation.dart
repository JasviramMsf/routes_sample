import 'package:routes/watchlist/utils/constants.dart';

final Map<String, int> subList = {START: 0, END: 14};

void setListIndex(int selectedIndex) {
  switch (selectedIndex) {
    case 1:
      {
        subList[START] = 14;
        subList[END] = 29;
      }
    case 2:
      {
        subList[START] = 29;
        subList[END] = 44;
      }
    case 3:
      {
        subList[START] = 44;
        subList[END] = 59;
      }
    case 4:
      {
        subList[START] = 59;
        subList[END] = 74;
      }
    case 5:
      {
        subList[START] = 74;
        subList[END] = 100;
      }
    default:
      {
        subList[START] = 0;
        subList[END] = 14;
      }
  }
}
