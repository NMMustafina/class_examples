/* Задача 4: Создание класса "Product"
Описание задачи:

Создай класс Product, который будет представлять товар.
В классе должны быть три поля:
name (строка) — название продукта.
price (число с плавающей точкой) — цена продукта.
quantity (целое число) — количество продукта на складе.
Добавь конструктор, который принимает параметры для всех трёх полей и инициализирует их.
Создай метод для вывода информации о продукте в формате: "Название: <name>, Цена: <price>, Количество на складе: <quantity>".
Добавь метод для изменения количества продукта на складе, например, при его продаже или поступлении на склад.
Добавь метод для изменения цены продукта.
Цель: Закрепить работу с классами, поля которых могут быть изменены после создания объекта. Это включает управление количеством на складе и ценой продукта. */

void main() {
  Product cucumber = Product(name: 'Огурец', price: 100.00, quantity: 3);
  cucumber.productInfo();
  cucumber.changePrice(200);
  cucumber.productInfo();
  cucumber.updateQuantity(sale: 1);
  cucumber.productInfo();
  cucumber.updateQuantity(entrance: 100);
  cucumber.productInfo();
}

class Product {
  String name;
  double price;
  int quantity;

  Product({required this.name, required this.price, required this.quantity});

  void productInfo() {
    print("Название: $name, Цена: $price, Количество на складе: $quantity");
  }

  void updateQuantity({int sale = 0, int entrance = 0}) {
    quantity = quantity - sale + entrance;
  }

  void changePrice(double newPrice) {
    price = newPrice;
  }
}
