import 'package:flutter/cupertino.dart';

class MediaQueryApp {
  BuildContext pageContext;

  get mediaWidth => MediaQuery.of(pageContext).size.width;

  get mediaHeight => MediaQuery.of(pageContext).size.height;
}
