import Foundation

struct LetterItem: Identifiable, Equatable {
    let id: String
    let letter: String
    let word: String

    var helperText: String {
        "\(letter) is for \(word)"
    }

    init(letter: String, word: String) {
        self.id = letter
        self.letter = letter
        self.word = word
    }
}

struct NumberItem: Identifiable, Equatable {
    let id: Int
    let value: Int
    let word: String

    init(value: Int, word: String) {
        self.id = value
        self.value = value
        self.word = word
    }
}

enum LearningData {
    static let letters: [LetterItem] = [
        LetterItem(letter: "A", word: "Apple"),
        LetterItem(letter: "B", word: "Ball"),
        LetterItem(letter: "C", word: "Cat"),
        LetterItem(letter: "D", word: "Duck"),
        LetterItem(letter: "E", word: "Egg"),
        LetterItem(letter: "F", word: "Fish"),
        LetterItem(letter: "G", word: "Garden"),
        LetterItem(letter: "H", word: "Hat"),
        LetterItem(letter: "I", word: "Ice"),
        LetterItem(letter: "J", word: "Jam"),
        LetterItem(letter: "K", word: "Kite"),
        LetterItem(letter: "L", word: "Leaf"),
        LetterItem(letter: "M", word: "Moon"),
        LetterItem(letter: "N", word: "Nest"),
        LetterItem(letter: "O", word: "Orange"),
        LetterItem(letter: "P", word: "Pencil"),
        LetterItem(letter: "Q", word: "Queen"),
        LetterItem(letter: "R", word: "Rainbow"),
        LetterItem(letter: "S", word: "Sun"),
        LetterItem(letter: "T", word: "Tree"),
        LetterItem(letter: "U", word: "Umbrella"),
        LetterItem(letter: "V", word: "Van"),
        LetterItem(letter: "W", word: "Water"),
        LetterItem(letter: "X", word: "Xylophone"),
        LetterItem(letter: "Y", word: "Yarn"),
        LetterItem(letter: "Z", word: "Zebra")
    ]

    static let numbers: [NumberItem] = [
        NumberItem(value: 1, word: "One"),
        NumberItem(value: 2, word: "Two"),
        NumberItem(value: 3, word: "Three"),
        NumberItem(value: 4, word: "Four"),
        NumberItem(value: 5, word: "Five"),
        NumberItem(value: 6, word: "Six"),
        NumberItem(value: 7, word: "Seven"),
        NumberItem(value: 8, word: "Eight"),
        NumberItem(value: 9, word: "Nine"),
        NumberItem(value: 10, word: "Ten")
    ]
}
