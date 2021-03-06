#language: ru

@tree

Функционал: проверка расчета суммы документа Заказ

Как Менеджер по продажам я хочу
изменить количество и цену документа Заказ 
чтобы проверить расчет суммы документа

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка расчета суммы документа Заказ
* Закрытие открытых окон
	И я закрываю все окна клиентского приложения
* Открытие документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ * от *'
* Начало редактирования строки ТЧ Товары
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
* Редактирование поля Цена
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '50,00'
	И в таблице "Товары" я завершаю редактирование строки
* Редактирование поля Количество
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '120'
	И в таблице "Товары" я завершаю редактирование строки
* Контроль суммы строки
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" поле с именем "ТоварыСумма" имеет значение "6 000,00"
* Закрытие документа без сохранения
	И Я закрываю окно 'Заказ * от * *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'