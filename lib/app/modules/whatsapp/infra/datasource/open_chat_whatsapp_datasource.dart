import 'package:flutter/foundation.dart';

abstract class OpenChatDataSource {
  Future<bool> openChat(int ddd, int telefone, String mensagem);
}
