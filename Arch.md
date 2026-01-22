мне нужно чтобы весь этот текст оказался в pdf: 

Готово 👍 Правило удалено, больше его не учитываю.

Ниже — **практичная архитектура для SwiftUI-проекта**, которую используют в продакшене (подходит от pet-проекта до mid+/senior уровня).

---

## Рекомендуемая архитектура: **MVVM + Coordinator (Navigation) + DI**

### Почему именно она

* нативно ложится на SwiftUI
* хорошо тестируется
* масштабируется
* не перегружена (в отличие от VIPER / Clean в чистом виде)

---

## 1️⃣ Общая структура проекта

```
App
├── App.swift
├── AppEnvironment.swift   // DI container
├── AppCoordinator.swift  // корневая навигация
│
├── Core
│   ├── Networking
│   ├── Persistence
│   ├── Keychain
│   ├── Extensions
│   └── Utils
│
├── Domain
│   ├── Models
│   ├── UseCases
│   └── Repositories (protocols)
│
├── Data
│   ├── DTO
│   ├── Mappers
│   └── Repositories (impl)
│
├── Features
│   ├── Auth
│   │   ├── AuthView.swift
│   │   ├── AuthViewModel.swift
│   │   ├── AuthCoordinator.swift
│   │   └── AuthModels.swift
│   │
│   ├── Profile
│   └── Settings
│
└── Resources
    ├── Assets
    └── Localizable
```

---

## 2️⃣ MVVM в SwiftUI (правильный вариант)

### View

* **только UI**
* никаких запросов, логики, форматирования

```swift
struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel

    var body: some View {
        VStack {
            Text(viewModel.username)
            Button("Logout") {
                viewModel.logout()
            }
        }
    }
}
```

### ViewModel

* `@MainActor`
* бизнес-логика
* общается с UseCase

```swift
@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var username: String = ""

    private let getProfile: GetProfileUseCase
    private let logoutUseCase: LogoutUseCase

    init(
        getProfile: GetProfileUseCase,
        logoutUseCase: LogoutUseCase
    ) {
        self.getProfile = getProfile
        self.logoutUseCase = logoutUseCase
    }

    func onAppear() async {
        let profile = try? await getProfile.execute()
        username = profile?.name ?? ""
    }

    func logout() {
        logoutUseCase.execute()
    }
}
```

---

## 3️⃣ Domain слой (сердце логики)

### UseCase

```swift
protocol GetProfileUseCase {
    func execute() async throws -> Profile
}
```

```swift
final class GetProfileUseCaseImpl: GetProfileUseCase {
    private let repository: ProfileRepository

    init(repository: ProfileRepository) {
        self.repository = repository
    }

    func execute() async throws -> Profile {
        try await repository.getProfile()
    }
}
```

### Repository (protocol)

```swift
protocol ProfileRepository {
    func getProfile() async throws -> Profile
}
```

---

## 4️⃣ Data слой (API / DB)

```swift
final class ProfileRepositoryImpl: ProfileRepository {
    private let api: ProfileAPI

    func getProfile() async throws -> Profile {
        let dto = try await api.fetchProfile()
        return Profile(dto: dto)
    }
}
```

---

## 5️⃣ Навигация: Coordinator / Router

❌ Не храним навигацию во ViewModel
✅ Навигация — отдельный слой

```swift
@MainActor
final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func openProfile() {
        path.append(Route.profile)
    }
}
```

```swift
enum Route: Hashable {
    case profile
    case settings
}
```

```swift
NavigationStack(path: $coordinator.path) {
    HomeView()
        .navigationDestination(for: Route.self) { route in
            switch route {
            case .profile:
                ProfileView(...)
            case .settings:
                SettingsView(...)
            }
        }
}
```

---

## 6️⃣ Dependency Injection (без магии)

```swift
final class AppEnvironment {
    lazy var profileRepository: ProfileRepository =
        ProfileRepositoryImpl(api: profileAPI)

    lazy var getProfileUseCase: GetProfileUseCase =
        GetProfileUseCaseImpl(repository: profileRepository)
}
```

Передаём зависимости **явно**, не через singleton.

---

## 7️⃣ Работа с состояниями экрана

```swift
enum ViewState<T> {
    case idle
    case loading
    case loaded(T)
    case error(String)
}
```

```swift
@Published var state: ViewState<Profile> = .idle
```

---

## 8️⃣ Что **НЕ** стоит делать в SwiftUI

❌ ViewModel как God-object
❌ NavigationLink внутри бизнес-логики
❌ API вызовы из View
❌ Singleton’ы для всего
❌ @EnvironmentObject без явной причины

---

## 9️⃣ Когда усложнять (Clean / VIP)

* 5+ команд
* сложные бизнес-правила
* много offline / sync логики

Во всех остальных случаях **MVVM + Coordinator = идеальный баланс**.

---

Если хочешь, дальше можем:

* разобрать **архитектуру для iOS interview**
* сделать **шаблон проекта**
* сравнить с **TCA**
* разобрать **реальный кейс (login / feed / pagination)**