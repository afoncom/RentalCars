Разбор архитектуры CarsharingAfonApp

Для чего нужны след примитивы:

1. Module - это сущность которая собирает экран из деталей которая в нем есть. (Modul-знает кто от кого зависит и все соеденяет)
В нашем приложении он выполняет след - Modul.build() собирает: ViewModel - создает, Presenter - создает, View создает и все соеденяет вместе.
После возвращает готовый экран


2. Coordinator - это сущность, которая управляет навигацией.
1. Нажимаем на машину -> Presenter.showDetails()
2. Presenter вызывает Coordinator.openCarDetails()
3. Coordinator добавляет Route.carDetails(car) в path
4. App видит изменение → показывает экран деталей через navigationDestination


3. Presenter - это основа экрана (View только показывает, Presenter решает ЧТО показыать и ЧТО делать)
View - пользователь нажал кнопку -> Presenter - выполняет логику -> Presente - передает ViewModel(е) что обновить,
Presenter - передает Coordinator(у) куда переходить, Presenter - передет Agregator(у) что сделать


4. App - корень приложения. (Создает все сервисы(CarManagers, Agregator), создает Coordinator (навигация), запуск первого экрана)
1. Создаёт CarManager'ы с машинами
2. Создаёт Agregator из CarManager'ов
3. Создаёт Coordinator для навигации
4. Создаёт NavigationStack с Coordinator
5. Запускает AllCarsModule - первый экран
6. Слушает изменения Coordinator -> показывает новые экраны


ViewModel - посредник между View и Presenter. Место где хранятся данные
Presenter обновляет ViewModel -> @Published срабатывает -> View перерисовывается автоматически 
1. Presenter говорит: "обнови список"
2. ViewModel меняет @Published var allCars
3. SwiftUI видит изменение
4. View перерисовывается с новыми данными

View -  UI  то что видит пользователь!(Показывает данные, ловит клики и касания, передает события Presenter(у))(Только UI — нет логики, только отображение, @ObservedObject — слушает ViewModel)
1. View показывает список из viewModel.allCars
2. Пользователь нажимает → View вызывает presenter.showDetails()
3. Presenter обновляет viewModel.allCars
4. View видит изменение → перерисовывается

