/* Задача 16: Инкапсуляция — класс "Account"
Описание задачи:

Создай класс Account, который будет представлять учетную запись пользователя.
В классе должны быть следующие приватные поля:
_username (строка) — имя пользователя.
_password (строка) — пароль пользователя.
_balance (число с плавающей точкой) — баланс пользователя.
Добавь публичные методы:
Конструктор: принимает имя пользователя и пароль. Баланс должен инициализироваться значением 0.
deposit(double amount) — метод для пополнения баланса. Если сумма меньше или равна 0, выводить сообщение об ошибке.
withdraw(double amount) — метод для снятия денег с баланса. Если запрашиваемая сумма больше, чем текущий баланс, выводить сообщение об ошибке.
checkBalance() — метод для проверки текущего баланса, который возвращает значение баланса.
updatePassword(String oldPassword, String newPassword) — метод для изменения пароля, который принимает старый и новый пароли. Если старый пароль не совпадает с текущим, выводить сообщение об ошибке.
Цель: Закрепить концепцию инкапсуляции, спрятав внутренние данные пользователя от внешнего доступа. Обеспечить доступ к данным через методы, которые контролируют логику работы с этими данными.

Структура задачи:
Приватные поля:

Имя пользователя, пароль и баланс должны быть скрыты от прямого доступа. Используй символ _, чтобы обозначить их как приватные.
Методы для работы с данными:

Добавь публичные методы, которые позволяют взаимодействовать с балансом и паролем.
Валидация данных:

Реализуй логику валидации данных, например, нельзя снять больше денег, чем есть на балансе, или пароль должен быть изменен только при правильном старом пароле. */

void main() {
  Account userAccount = Account(username: 'Alex', password: '123456');

  userAccount.deposit(200);
  userAccount.withdraw(50);
  userAccount.checkBalance();

  userAccount.updatePassword('123456', 'newPassword');
  userAccount.updatePassword('wrongPassword', 'newPassword');
}

class Account {
  String _username;
  String _password;
  double _balance = 0;

  Account({required String username, required String password})
      : _username = username,
        _password = password;

  void deposit(double amount) {
    if (amount <= 0) {
      print('Ошибка. Сумма пополнения не должна быть отрицательной');
      return;
    }
    _balance += amount;
  }

  void withdraw(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
    } else {
      print('Ошибка. Недостаточно средств на балансе');
    }
  }

  void checkBalance() {
    print("Баланс: $_balance");
  }

  void updatePassword(String oldPassword, String newPassword) {
    if (oldPassword == _password) {
      _password = newPassword;
      print('Пароль был успешно изменен');
    } else {
      print('Ошибка. Старый пароль не совпадает с текущим');
    }
  }
}
