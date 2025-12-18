# SwiftUI Examen - Auto Showroom App

**Tijdsduur:** 3 uur  
**Totaal aantal schermen:** 5 schermen

## Opdrachtbeschrijving

Maak een SwiftUI app voor een auto showroom waarbij gebruikers verschillende auto's kunnen bekijken en beheren.

## Functionele Vereisten

### 1. TabView Structuur

- Implementeer een `TabView` met 3 tabs:
  - **Home**: Overzicht van alle auto's
  - **Favorieten**: Lijst van favoriete auto's
  - **Instellingen**: App instellingen

### 2. Navigatie

- **NavigationStack met path**: Gebruik `NavigationStack` met een path-based navigatie voor het navigeren tussen auto's en detail schermen
- **Boolean navigatie**: Implementeer een navigatie naar een filter scherm met een Boolean state

### 3. Data Model en JSON

Maak volgende models aan:

```swift
struct Car: Identifiable, Codable {
    let id: Int
    let brand: String
    let model: String
    let year: Int
    let price: Double
    let color: String
    let fuelType: String
    let imageURL: String
}
```

JSON data (maak een `cars.json` bestand aan):

```json
{
  "cars": [
    {
      "id": 1,
      "brand": "BMW",
      "model": "M3",
      "year": 2023,
      "price": 75000,
      "color": "Blauw",
      "fuelType": "Benzine",
      "imageURL": "bmw-m3"
    },
    {
      "id": 2,
      "brand": "Audi",
      "model": "RS6",
      "year": 2024,
      "price": 120000,
      "color": "Zwart",
      "fuelType": "Benzine",
      "imageURL": "audi-rs6"
    },
    {
      "id": 3,
      "brand": "Tesla",
      "model": "Model S",
      "year": 2023,
      "price": 95000,
      "color": "Wit",
      "fuelType": "Elektrisch",
      "imageURL": "tesla-models"
    },
    {
      "id": 4,
      "brand": "Mercedes",
      "model": "AMG GT",
      "year": 2024,
      "price": 150000,
      "color": "Zilver",
      "fuelType": "Benzine",
      "imageURL": "mercedes-amg"
    },
    {
      "id": 5,
      "brand": "Porsche",
      "model": "911 Turbo",
      "year": 2023,
      "price": 180000,
      "color": "Rood",
      "fuelType": "Benzine",
      "imageURL": "porsche-911"
    },
    {
      "id": 6,
      "brand": "Volkswagen",
      "model": "ID.4",
      "year": 2023,
      "price": 45000,
      "color": "Grijs",
      "fuelType": "Elektrisch",
      "imageURL": "vw-id4"
    }
  ]
}
```

### 4. Async Data Loading

Implementeer een `DataManager` class met async functie:

```swift
@Observable
class DataManager {
    var cars: [Car] = []
    var isLoading = false

     func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            // load cars
            //sort()
            print("✅ Data loaded successfully.")

        } catch {
            print("❌ Failed to load uurrooster:", error)
            movies = Movies()
        }
    }
}

import Foundation
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
           fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

struct CarsResponse: Codable {
    let cars: [Car]
}
```

### 5. Schermopbouw

#### Scherm 1: HomeView (TabView - Home Tab)

- Toon een `Grid` met `GridRow` met alle auto's (2 kolommen)
- Gebruik de `DataManager` om data te laden via `.task`
- Toon merk, model en prijs per auto
- Klik op een auto om naar detail te navigeren (NavigationStack met path)

#### Scherm 2: CarDetailView

- Toon alle details van de geselecteerde auto
- Gebruik `@State` voor een toggle om auto als favoriet te markeren
- Toon een "Filter tonen" button die naar het filter scherm navigeert (Boolean navigatie)

#### Scherm 3: FilterView (Boolean navigatie)

- Filter auto's op brandstoftype (Benzine, Elektrisch, Alle)
- Gebruik `@Binding` om het geselecteerde filter terug te geven
- Sheet/NavigationLink met Boolean presentatie

#### Scherm 4: FavoritesView (TabView - Favorieten Tab)

- Toon favoriete auto's in een `List`
- Gebruik `@Environment` om gedeelde data te benaderen
- Mogelijkheid om favorieten te verwijderen

#### Scherm 5: SettingsView (TabView - Instellingen Tab)

- Picker voor sorteer voorkeur (Prijs, Merk, Jaar)

## Evaluatiecriteria

1. **Correcte implementatie TabView** (10 punten)
2. **NavigationStack met path** (15 punten)
3. **Boolean navigatie** (10 punten)
4. **Async data loading** (15 punten)
5. **Grid en GridRow gebruik** (10 punten)
6. **Correct gebruik @State en @Binding** (15 punten)
7. **@Environment implementatie** (10 punten)
8. **Code kwaliteit en structuur** (10 punten)
9. **UI/UX en design** (5 punten)

**Totaal: 100 punten**

## Tips

- Begin met het opzetten van de basis structuur (TabView + Navigation)
- Implementeer eerst de data loading
- Test regelmatig je code
- Gebruik preview providers voor snelle UI development
- Houd je code clean en gestructureerd

**Veel succes!**
