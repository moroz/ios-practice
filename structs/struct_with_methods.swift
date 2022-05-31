struct Counter {
    private(set) var value: Int = 0

    mutating func inc() {
        self.value += 1
    }

    mutating func dec() {
        self.value -= 1
    }
}

var myCounter = Counter()
myCounter.inc()
print(myCounter.value)
myCounter.inc()
print(myCounter.value)
myCounter.dec()
print(myCounter.value)

// myCounter.value = 100
// struct_with_methods.swift:21:11: error: cannot assign to property: 'value' setter is inaccessible
// myCounter.value = 100
// ~~~~~~~~~~^~~~~

