﻿#language: ru

@tree
@БыстрыеПровеки

Функционал: проверка формы элемента справочника организации

Как Тестировщик я хочу
проверить доступность вкладки налоги и валюты
чтобы проверить, что пользователь не ошибется при вводе данных

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка доступности вкладки Налоги и валюты в справочнике Организации
* Открытие элемента справочника Организации	
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Организация (создание)'
* Снятие флага Наша компания и проверка видимости вкладок Валюта и Вид налога	
	И я снимаю флаг с именем 'OurCompany'
	И элемент формы "Валюты" существует и невидим на форме
	И элемент формы "Вид налога" существует и невидим на форме
* Установка флага Наша компания и проверка видимости вкладок Валюта и Вид налога	
	И я устанавливаю флаг с именем 'OurCompany'
	И элемент формы "Валюты" присутствует на форме
	И элемент формы "Вид налога" присутствует на форме

Сценарий: Проверка функциональной опции Использовать организации в Заказе клиента
	И Я устанавливаю в константу "UseCompanies" значение "False"
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	И элемент формы "Организация" отсутствует на форме
	И Я устанавливаю в константу "UseCompanies" значение "True"

Сценарий: проверка заполнения справочника Организации
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Организация (создание)'
	И в поле с именем 'Description_ru' я ввожу текст 'Тестовый контрагент'
	И из выпадающего списка с именем "Type" я выбираю точное значение 'Организация'
	И я нажимаю на кнопку с именем 'FormWrite'	
	И элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
	И элемент формы с именем "Type" стал равен 'Организация'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна 'Тестовый контрагент (Организация)' в течение 20 секунд
	Тогда открылось окно 'Организации'
	И в таблице "List" я перехожу к строке:
		| 'Наименование'        |
		| 'Тестовый контрагент' |
	И я закрываю все окна клиентского приложения

Сценарий: проверка расположения элементов формы Организация
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	@screenshot
	Тогда открылось окно 'Организация (создание)'	