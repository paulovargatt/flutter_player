import 'package:flutter_event_bus/flutter_event_bus/EventBus.dart';

class TabsChangeEvent {
  var indexTab;

  TabsChangeEvent(this.indexTab);
}

final storeEventBus = EventBus();
