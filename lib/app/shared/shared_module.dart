import 'package:whatsapp_agenda/app/shared/widgets/link-button/link-button/link-button_controller.dart';
import 'package:whatsapp_agenda/app/shared/widgets/bottom/bottom_controller.dart';
import 'package:whatsapp_agenda/app/shared/widgets/top/top_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SharedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LinkButtonController()),
        Bind((i) => BottomController()),
        Bind((i) => TopController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<SharedModule>.of();
}
