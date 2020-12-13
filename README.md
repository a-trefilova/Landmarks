# lovelyPlaces
Этот проект был выполнен в качестве тестового задания. 
Суть задания: 
Создать приложение, отображающее список локаций, загруженных из json-файла с возможностью просмотра информации о каждом конкретном месте 
с отображением его позиции на карте. Также, список можно фильтровать по избранным местам.

Общие требования: 
- язык разработки Swift 
- соответствие макетам 
- менеджер зависимости Carthage
- верстка через код с использованием SnapKit 
- архитектура проекта - YARCH (модифицированный VIPER: https://github.com/alfa-laboratory/YARCH) 

  
Первый экран:
Список с локациями, отображать системную иконку “star.fill“, 
если место - избранное (isFavorite - флаг в модели). 
По переключению свитча фильтровать список на только избранных:

![](https://github.com/a-trefilova/lovelyPlaces/blob/main/Screenshots/firstScreen.png)
![](https://github.com/a-trefilova/lovelyPlaces/blob/main/Screenshots/secondScreen.png)



Второй экран:
Детальное отображение места с картой, отображающей геопозицию из модели. По кнопке назад можно вернуть к списку.

![](https://github.com/a-trefilova/lovelyPlaces/blob/main/Screenshots/thirdScreen.png)
![](https://github.com/a-trefilova/lovelyPlaces/blob/main/Screenshots/fourthScreen.png)
