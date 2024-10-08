/* Задача 11: Взаимодействие объектов "Customer" и "Order"
Описание задачи:

Создай класс Customer, который будет представлять клиента.

Поля:
name (строка) — имя клиента.
orders (список объектов типа Order) — список заказов клиента.
Конструктор должен принимать имя клиента и инициализировать пустой список заказов.
Методы:
addOrder(Order order) — добавляет заказ в список заказов клиента.
getOrderDetails() — выводит информацию о всех заказах клиента (название продукта и его цена).
Создай класс Order, который будет представлять заказ.

Поля:
productName (строка) — название продукта.
price (число с плавающей точкой) — цена продукта.
Конструктор должен принимать название продукта и его цену.
В классе Customer добавь метод для вывода общего количества заказов и их суммарной стоимости. Например: "Клиент <name> сделал <количество заказов> заказов на сумму <общая сумма>."

В классе Order можно добавить метод для вывода информации о конкретном заказе, например: "Продукт: <productName>, Цена: <price>."

Создай взаимодействие между классами:

Клиент добавляет заказы в список заказов.
После добавления заказов можно выводить информацию обо всех заказах клиента и их стоимости.
Цель: Закрепить взаимодействие между объектами разных классов. Здесь важно понимать, как один объект может содержать коллекции других объектов (например, заказы клиента). Задача помогает закрепить навыки работы с объектами, коллекциями и методами взаимодействия. */

main() {
  Customer alex = Customer(name: 'Алекс');
  Customer marti = Customer(name: 'Марти');

  Order firstOrder = Order(productName: 'Рубашка', price: 500);
  Order secondOrder = Order(productName: 'Штаны', price: 700);
  Order thirdOrder = Order(productName: 'Пиджак', price: 1000);

  alex.addOrder(firstOrder);
  alex.addOrder(secondOrder);
  alex.getOrderDetails();
  alex.getOrdersSum();

  marti.addOrder(thirdOrder);
  thirdOrder.orderInfo();
  marti.getOrderDetails();
  marti.getOrdersSum();
}

class Customer {
  String name;
  List<Order> orders = [];

  Customer({required this.name});

  void addOrder(Order order) {
    orders.add(order);
  }

  void getOrderDetails() {
    print('Клиент $name сделал следующие заказы:');
    for (var order in orders) {
      print('Продукт: ${order.productName}, Цена: ${order.price}.');
    }
  }

  void getOrdersSum() {
    int numberOfOrders = 0;
    double sum = 0;
    for (var order in orders) {
      numberOfOrders++;
      sum += order.price;
    }

    print('Клиент $name сделал $numberOfOrders заказов на сумму $sum.');
  }
}

class Order {
  String productName;
  double price;

  Order({required this.productName, required this.price});

  void orderInfo() {
    print('Продукт: $productName, Цена: $price.');
  }
}
