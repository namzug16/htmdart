import 'package:htmdart/htmdart.dart';

extension TextExtensions on String {
  HTML get dartCode => this.code("language-dart");
  HTML get bashCode => this.code("language-bash no-line-numbers");
}
