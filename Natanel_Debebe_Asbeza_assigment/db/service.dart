import 'package:asbeza/db/repository.dart';
import 'package:asbeza/model/item.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  save_item(Item item) async {
    return await _repository!.insertData('item', item.toJson());
  }

  read_item() async {
    return await _repository!.readData('item');
  }

  update_item(Item item) async {
    return await _repository!.updateData('item', item.toJson());
  }

  delete_item(dispatchId) async {
    return await _repository!.deleteData('item', dispatchId);
  }
}
