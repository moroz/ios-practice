// define an enum for common currencies in my part of the world
enum Currency {
    case eur
    case pln
    case czk
}

let beerPriceIn2022: [Currency: Double] = [
    .czk: 45,
    .pln: 14,
    .eur: 5
]

for (currency, price) in beerPriceIn2022 {
    let printable = String(describing: currency).uppercased()
    print("Price of beer in 2022: \(price) \(printable)")
}
