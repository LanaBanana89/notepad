# Консольная версия "Блокнота" 
## с использованием базы данных sqlite

## Системные характеристики
Программа разработана на ОС Linux с помощью языка ruby (версия 2.3.3)

## Описание
Данная программа предназначена для записи различного типа заметок:
- заметка
- задача
- ссылка

## Запуск программы
1. Необходимо скачать либо клонировать репозиторий с блокнотом
2. Перейти в терминале в папку с файлами программы
3. Затем запустить в терминале с помощью интерпретатора ruby файл new_post.rb
```
~/notepad ruby new_post.rb
```
### Важно: предворительно обязательно необходимо установить базу данных sqlite3 и гем sqlite3,
выполнив в терминале следующие команды:
```~/notepad
sudo apt-get install  sqlite3
gem install sqlite3
```

## Скриншоты