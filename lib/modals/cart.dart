import 'catalog.dart';

class CartModal{

  // Singleton class
  static final cartModal = CartModal._internal();
  CartModal._internal();

  factory CartModal() => cartModal;

  late CatalogModal _catalog;

  final List<double>_itemIds = [];

  CatalogModal get catalog => _catalog;

  set catalog(CatalogModal newCatalog){
    assert(newCatalog!=null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((price) => _catalog.getById(price)).toList();

  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  void add(Item item){
    _itemIds.add(item.price);
  }
  void remove(Item item){
    _itemIds.remove(item.price);
  }
}