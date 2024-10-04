/* Задача 3: Создание класса "Book"
Описание задачи:

Создай класс Book, который будет представлять книгу.
В классе должны быть три поля:
title (строка) — название книги.
author (строка) — имя автора книги.
pages (целое число) — количество страниц в книге.
Добавь конструктор, который принимает параметры для всех трёх полей и инициализирует их.
Создай метод, который выводит информацию о книге в формате: "Название: <title>, Автор: <author>, Страниц: <pages>".
Добавь метод, который будет обновлять количество страниц (pages), если книга издается в новом издании с другой пагинацией.
Цель: Закрепить создание классов с несколькими полями, добавление методов для работы с объектами и реализацию методов, которые изменяют внутреннее состояние объекта. */

void main() {
  Book nineteenEightyFour = Book (title: '1984', author: 'Джордж Оруэлл', pages: 385);
  nineteenEightyFour.bookInfo();
  nineteenEightyFour.changePages(666);
  nineteenEightyFour.bookInfo();
}

class Book {
  String title;
  String author;
  int pages;

  Book({required this.title, required this.author, required this.pages});

  bookInfo() {
    print("Название: $title, Автор: $author, Страниц: $pages");
  }

  changePages(int newPages){
    pages = newPages;
  }
}