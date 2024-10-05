/* Задача 9: Создание класса "Store"
Описание задачи:

Создай класс Store, который будет представлять магазин.
В классе должно быть поле:
products (список объектов типа Product) — товары, которые есть в наличии в магазине.
Создай конструктор, который будет инициализировать пустой список товаров при создании магазина.
Добавь метод для добавления товара в магазин (addProduct), который принимает объект класса Product и добавляет его в список товаров.
Добавь метод для удаления товара из магазина (removeProduct), который принимает название товара и удаляет его из списка, если товар найден.
Создай метод для вывода информации о всех товарах в магазине. Например, в формате: "Название: <name>, Цена: <price>, Количество: <quantity>".
Дополнительно можно добавить метод для поиска товара по имени, который возвращает информацию о конкретном товаре, если он есть в магазине.
Цель: Закрепить работу с коллекциями объектов, научиться добавлять и удалять элементы из списка. Практика взаимодействия между разными классами, например, классом Store и классом Product. */

main() {
  Store store = Store();

  Product milk = Product(name: 'Молоко', price: 70);
  Product bread = Product(name: 'Хлеб', price: 25);
  Product eggs = Product(name: 'Яйца', price: 110);

  store.addProduct(milk);
  store.addProduct(milk);
  store.addProduct(bread);
  store.addProduct(eggs);
  store.addProduct(eggs);
  store.addProduct(eggs);
  store.removeProduct(eggs);
  store.productsInfo();
  store.searchProduct('Молоко');
  store.searchProduct('Малако');
}

class Store {
  Set<Product> products;

  Store() : products = {};

  addProduct(product) {
    products.add(product);
    product.quantity = product.quantity + 1;
  }

  removeProduct(product) {
    if (products.contains(product)) {
      product.quantity = product.quantity - 1;
    } else {
      print('Такого товара нет');
    }
  }

  searchProduct(productName) {
    bool isContain = false;
    for (var product in products) {
      if (product.name == productName) {
        isContain = true;
        print(
            "Вы искали: ${product.name}, Цена: ${product.price}, Количество: ${product.quantity}");
      }
    }
    if (isContain == false) {
      print('Вы искали: $productName. Такого товара нет');
    }
  }

  productsInfo() {
    print('В магазине есть следующие товары:');
    for (var product in products) {
      print(
          "Название: ${product.name}, Цена: ${product.price}, Количество: ${product.quantity}");
    }
  }
}

class Product {
  String name;
  double price;
  int quantity;

  Product({required this.name, required this.price, this.quantity = 0});
}
