import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/infra/datasource/open_chat_whatsapp_datasource.dart';

class OpenChatWhatsappDatasourceImpl implements OpenChatWhatsappDatasource {
  @override
  Future<bool> openChat(int ddd, int telefone, String mensagem) async {
    final url = 'whatsapp://send?phone=55$ddd$telefone&text=$mensagem';
    final resultLaunch = await canLaunch(url);
    if (resultLaunch) {
      return await launch(url);
    } else {
      return false;
    }
  }
}
