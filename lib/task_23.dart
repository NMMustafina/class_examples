/* Задача: Класс "Игровой персонаж" и его взаимодействие с предметами
Описание задачи:

Создай класс GameCharacter (Игровой персонаж), который будет представлять игрового персонажа.

Поля класса:
name (строка) — имя персонажа.
inventory (список объектов класса Item) — инвентарь персонажа, где будут храниться предметы.
Методы класса:
pickItem(Item item) — метод для того, чтобы персонаж мог взять предмет и добавить его в инвентарь.
useItem(String itemName) — метод для использования предмета из инвентаря. Если предмет не найден, выводить сообщение об ошибке.
dropItem(String itemName) — метод для выбрасывания предмета из инвентаря. Если предмет не найден, выводить сообщение об ошибке.
Создай класс Item (Предмет), который будет представлять предметы, которые персонаж может брать и использовать.

Поля класса:
name (строка) — имя предмета.
description (строка) — описание предмета.
Методы класса:
use() — метод для использования предмета, выводящий на экран сообщение о том, что предмет был использован.
Взаимодействие с предметами:

Персонаж может взаимодействовать с разными предметами, добавляя их в свой инвентарь, используя или выбрасывая их.
Создай несколько предметов:

Например, можно создать предметы:
Зелье здоровья — предмет, который персонаж может выпить, чтобы восстановить здоровье.
Меч — предмет, который персонаж может использовать для атаки.
Ключ — предмет, который персонаж может использовать для открытия двери.
Методы для работы с инвентарем:

Инвентарь представляет собой список предметов, которые персонаж собирает в ходе игры.
Персонаж может добавить предмет в инвентарь с помощью метода pickItem().
Персонаж может использовать предмет, если он есть в инвентаре, с помощью метода useItem().
Персонаж может выбросить предмет из инвентаря с помощью метода dropItem().
Обработка ошибок:

Если персонаж пытается использовать или выбросить предмет, которого нет в инвентаре, программа должна сообщать об этом с помощью сообщений. */

void main() {
  Item healthPotion = Item(
      name: 'Зелье здоровья',
      description:
          'Зелье здоровья  можно выпить, тогда оно восполнит вам 6 единиц здоровья');
  Item sword = Item(
      name: 'Меч',
      description:
          'Оружие ближнего боя, используемое в основном для убийства мобов и игроков');
  Item key = Item(
      name: 'Ключ',
      description:
          'Предмет, который персонаж может использовать для открытия двери');

  GameCharacter archer = GameCharacter(name: 'Арчер');

  archer.pickItem(healthPotion);
  archer.pickItem(healthPotion);
  archer.pickItem(sword);
  archer.pickItem(key);
  archer.useItem('Зелье здоровья');
  archer.useItem('Зелье здоровья');
  archer.useItem('Зелье здоровья');
  archer.dropItem('Меч');
  archer.showInventory();
}

class GameCharacter {
  String name;
  List<Item> inventory = [];
  GameCharacter({required this.name});

  void pickItem(Item item) {
    if (inventory.contains(item)) {
      item.quantity += 1;
      print('${item.name} есть в инвентаре. Количество: ${item.quantity}');
    } else {
      inventory.add(item);
      item.quantity += 1;
      print('${item.name} добавлен в инвентарь. Количество: ${item.quantity}');
    }
  }

  void useItem(String itemName) {
    bool itemFound = false;
    for (var item in inventory) {
      if (item.name == itemName) {
        itemFound = true;
        if (item.quantity > 0) {
          item.quantity -= 1;
          print('${item.name} был использован. Количество: ${item.quantity}');
          if (item.quantity == 0) {
            inventory.remove(item);
            print('${item.name} удален из инвентаря');
          }
        } else {
          print('${item.name} нет в инвентаре');
        }
        break; // Если предмет найден, прерываем цикл
      }
    }
    if (!itemFound) {
      print('Предмет $itemName не найден в инвентаре');
    }
  }

  void dropItem(String itemName) {
    Item? itemToRemove;
    for (var item in inventory) {
      if (item.name == itemName) {
        itemToRemove = item;
      }
    }
    if (inventory.contains(itemToRemove)) {
      inventory.remove(itemToRemove);
      print('$itemName удален из инвентаря');
    } else {
      print('Предмет $itemName не найден в инвентаре');
    }
  }

  void showInventory() {
    if (inventory.isEmpty) {
      print('Инвентарь пуст');
    } else {
      print('В инвентаре находятся:');
      for (var item in inventory) {
        print(
            'Имя: ${item.name}, Описание: ${item.description}, Количество: ${item.quantity}');
      }
    }
  }
}

class Item {
  String name;
  String description;
  int quantity;

  Item({required this.name, required this.description, this.quantity = 0});
}
