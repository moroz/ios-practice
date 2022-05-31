struct StructCounter {
    private(set) var value: Int = 0

    mutating func inc() {
        self.value += 1
    }

    mutating func dec() {
        self.value -= 1
    }
}

class ClassCounter {
    private(set) var value: Int = 0

    func inc() {
        self.value += 1
    }

    func dec() {
        self.value -= 1
    }
}

print("With a struct:")
var s1 = StructCounter()
s1.inc()

var s2 = s1
s2.inc()

print(s1.value)
print(s2.value)

print("With a class:")
var c1 = ClassCounter()
c1.inc()
print(c1.value)

var c2 = c1
c2.inc()

print(c1.value)
print(c2.value)
