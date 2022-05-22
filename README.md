# TinkoffInvestSDK

Библиотека для взаимодействия с торговой платформой Тинькофф Инвестиции. Единый исходный код на Swift 5 позволяет использовать библиотеку на любых девайсах Apple - iPhone, iPad, Mac и пр. 

- работа со счетами и заявками в песочнице
- создание и отмена заявки на бирже
- получение рыночных данных
- получение информации по своему портфелю
- проверка алгоритмов торговли на исторических данных
- и другие возможности API Тинькофф Инвестиций

[Документация API Тинькофф Инвестиций](https://tinkoff.github.io/investAPI/)

[API Тинькофф Инвестиций](https://github.com/Tinkoff/investAPI/)

## Начало
Подключите библиотеку в ваш проект с помощью Swift Package Manager. 
- Откройте меню ```File -> Add Packages```
- Добавьте ссылку ```https://github.com/s41ty/TinkoffInvestSDK```
- Нажмите ```Add Package```

Для использования библиотеки необходимо указать токен и имя приложения (произвольное).

[Получить токен в настройках личного кабинета Тинькофф Инвестиции](https://www.tinkoff.ru/invest/settings/).
```swift
import TinkoffInvestSDK
// ...
// ...
let config = TinkoffInvestConfig(token: "your_token", appName: "s41ty")
let sdk = TinkoffInvestSDK(config: config)
```

## Работа с песочницей
#### Создание счёта в песочнице
```swift
sdk.sandboxService.openSandboxAccount()
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading openSandboxAccount")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)  
```
#### Получение списка счетов в песочнице
```swift
sdk.sandboxService.getSandboxAccounts()
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading getSandboxAccounts")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)   
```
#### Пополнение счёта в песочнице
```swift
var value = Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue()
value.currency = "RUB"
value.units = 100000
sdk.sandboxService.sandboxPayIn(accountID: accountId, ammount: value)
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading sandboxPayIn")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)   
```
#### Получение портфолио счёта в песочнице
```swift
sdk.operationsService.getSandboxPortfolio(accountID: accountId)
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading getSandboxPortfolio")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)  
```
#### Размещение заявки в песочнице
```swift
let figi = "BBG333333333"
let quantity: Int64 = 10
let price: Decimal = 4.2
let direction: Tinkoff_Public_Invest_Api_Contract_V1_OrderDirection = .buy
sdk.sandboxService.postSandboxOrder(accountID: accountId, figi: figi, quantity: quantity, price: price.asQuotation, direction: direction, orderType: .limit)
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading postSandboxOrder")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)     
```

## Получение рыночных данных
#### Запрос исторических свечей по инструменту
```swift
let figi = "BBG333333333"
let fromDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
let toDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
sdk.marketDataService.getCandels(figi: figi, from: fromDate.asProtobuf, to: toDate.asProtobuf, interval: .candleInterval1Min)
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading getCandels")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)    
```

## Работа с основными счетами
#### Получение списка счетов
```swift
sdk.usersService.getAccounts()
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading getAccounts")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)    
```
#### Получение портфолио счёта
```swift
sdk.operationsService.getPortfolio(accountID: accountId)
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading getPortfolio")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)    
```
#### Размещение заявки
```swift
let figi = "BBG333333333"
let quantity: Int64 = 10
let price: Decimal = 4.2
let direction: Tinkoff_Public_Invest_Api_Contract_V1_OrderDirection = .buy
sdk.sandboxService.postOrder(accountID: accountId, figi: figi, quantity: quantity, price: price.asQuotation, direction: direction, orderType: .limit)
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading postOrder")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)            
```

## Работа с инструментами
#### Акции
```swift
sdk.instrumentsService.shares()
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading shares")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)            
```
#### Облигации
```swift
sdk.instrumentsService.bonds()
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading bonds")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)  
```
#### Валюты
```swift
sdk.instrumentsService.currencies()
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading currencies")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)  
``` 
#### EFT
```swift
sdk.instrumentsService.etfs()
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading etfs")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)   
```
#### Информация по инструменту
```swift
let figi = "BBG333333333"
sdk.instrumentsService.getInstrumentBy(figi: figi)
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading getInstrumentBy")
        }        
    } receiveValue: { response in
        print(response)
    }
    .store(in: &cancellableSet)    
```
## Объединение запросов
```swift
Publishers.Zip(sdk.usersService.getAccounts(), sdk.sandboxService.getSandboxAccounts())
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("\(error.localizedDescription)")
        case .finished:
            print("did finish loading getAccounts and getSandboxAccounts")
        }        
    } receiveValue: { r, s in
        print(r, s)
    }
    .store(in: &cancellableSet)    
```

## Демо приложение
[I am Rich](https://github.com/s41ty/IamRICH)

## Используемые зависимости
[gRPC Swift](https://github.com/grpc/grpc-swift)

[CombineGRPC](https://github.com/vyshane/grpc-swift-combine)

## Требования для сборки проекта 
- macOS Monterey
- XCode 13

## Совместимость
Платформа | Минимальная версия
--- | ---
macOS | 10.15
iOS & iPadOS | 15