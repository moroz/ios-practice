enum Currency {
    case eur
    case pln
    case czk
    case sek
    case uah
}

let currencyMappings: [String: Currency?] = [
    "Germany": .eur,
    "Poland": .pln,
    "Czechia": .czk,
    "Slovakia": .eur,
    "Sweden": .sek,
    "Zimbabwe": nil,
    "Ukraine": .uah
]

let currencyNames: [Currency: String] = [
    .sek: "Swedish krona",
    .eur: "Euro",
    .czk: "Czech koruna",
    .pln: "Polish zloty"
]

for (country, maybeCurrency) in currencyMappings {
    if let currency = maybeCurrency {
        let symbol = String(describing: currency).uppercased()
        let name = currencyNames[currency]
        let displayName = name != nil ? "\(name!) (\(symbol))" : symbol
        print("In \(country), the currency is \(displayName)")
    } else {
        print("I don't know the currency in \(country)")
    }
}
