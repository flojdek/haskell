enum Currency {
    PLN = 1,
    GBP = 2
}

struct Product {
    1: string      name,
    2: double      price,
    3: Currency    currency,
    4: set<string> tags
}
