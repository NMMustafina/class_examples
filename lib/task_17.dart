/* Задача 17: Создание интерфейса "Payment" (Оплата)
Описание задачи:

Создай интерфейс Payment, который будет представлять способ оплаты. В интерфейсе должны быть определены методы, которые каждый конкретный способ оплаты должен реализовать:

void pay(double amount) — метод для выполнения оплаты на определенную сумму.
void cancel() — метод для отмены платежа.
Реализуй два класса, которые будут представлять различные способы оплаты:

Класс CreditCardPayment:
Поля:
cardNumber (строка) — номер кредитной карты.
balance (число с плавающей точкой) — баланс карты.
Реализуй методы pay и cancel:
Метод pay должен проверять, достаточно ли средств на карте для оплаты. Если достаточно, списать сумму. Если нет — вывести сообщение об ошибке.
Метод cancel должен возвращать ранее списанные средства на карту.
Класс PayPalPayment:
Поля:
email (строка) — электронная почта пользователя PayPal.
balance (число с плавающей точкой) — баланс PayPal счета.
Реализуй методы pay и cancel:
Аналогично кредитной карте, проверяй наличие достаточного баланса для оплаты и отмены платежа.
Создай несколько объектов каждого типа (например, CreditCardPayment и PayPalPayment), и протестируй методы pay и cancel.

Структура задачи:
Интерфейс Payment:

Содержит только описание методов, без их реализации. Эти методы должны быть реализованы в каждом классе, который будет использовать интерфейс.
Класс CreditCardPayment:

Представляет оплату через кредитную карту. Реализует методы оплаты и отмены.
Класс PayPalPayment:

Представляет оплату через PayPal. Реализует аналогичные методы. */

void main() {
  CreditCardPayment creditCardPayment =
      CreditCardPayment(cardNumber: '1234 5678 9101 1121', balance: 1000);
  PayPalPayment payPalPayment =
      PayPalPayment(email: 'user@mail.com', balance: 1000);

  creditCardPayment.pay(100);
  creditCardPayment.cancel();
  payPalPayment.cancel();
  payPalPayment.pay(100);
  payPalPayment.cancel();
}

class Payment {
  void pay(double amount) {}
  void cancel() {}
}

class CreditCardPayment extends Payment {
  String cardNumber;
  double balance;
  double lastPayment = 0;

  CreditCardPayment({required this.cardNumber, required this.balance});

  @override
  void pay(double amount) {
    if (balance >= amount) {
      balance -= amount;
      lastPayment = amount;
      print('Оплата прошла успешно. Ваш баланс: $balance');
    } else {
      print('Ошибка. Недостаточно средств на балансе');
    }
  }

  @override
  void cancel() {
    if (lastPayment > 0) {
      balance += lastPayment;
      print(
          'Операция отменена, средства возвращены на карту $cardNumber. Ваш баланс: $balance');
      lastPayment = 0;
    } else {
      print('Ошибка. Вы еще не совершали платеж');
    }
  }
}

class PayPalPayment extends Payment {
  String email;
  double balance;
  double lastPayment = 0;

  PayPalPayment({required this.email, required this.balance});

  @override
  void pay(double amount) {
    if (balance >= amount) {
      balance -= amount;
      lastPayment = amount;
      print('Оплата прошла успешно. Ваш баланс: $balance');
    } else {
      print('Ошибка. Недостаточно средств на балансе');
    }
  }

  @override
  void cancel() {
    if (lastPayment > 0) {
      balance += lastPayment;
      print(
          'Операция отменена, средства возвращены на PayPal ($email). Ваш баланс: $balance');
      lastPayment = 0;
    } else {
      print('Ошибка. Вы еще не совершали платеж');
    }
  }
}
