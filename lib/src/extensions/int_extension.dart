import 'package:coder0211/src/global_value.dart';

extension IntEX on int {
  double get w => GlobalValue.screenWidth * this;
  double get h => GlobalValue.screenHeight * this;
  double get r =>
      (this / GlobalValue.defauldScreenWidth) * GlobalValue.screenWidth;
}
