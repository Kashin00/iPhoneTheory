import Foundation
/*:
# Замыкания

 На этом разделе ты узнаешь:
- что такое замыкания  (`сlosure`)
- что такое замыкающие выражения
- что такое захват значения
- что такое сбегающие замыкания

Внимательно изучи:
- [Замыкания](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
- [Захват значений](https://www.swiftbysundell.com/articles/swifts-closure-capturing-mechanics/)
 
Закрепи пройденный материал:

#### Задание 1
 
 - Реализуй функцию _applyKTimes_, которая принимает в качестве параметров целое число _k_ и замыкание.
 - Функция должна вызывать замыкание _k_ раз.
 - В замыкании выведи в консоль любую строку.
 - Note: 👆 _Замыкание должно быть без параметров и ничего не возвращать._
 */
/*:
 - Example: 😉\
 _Function Call:_\
 applyKTimes(3) {\
 print("We ❤️ Swift")\
 }\
 _Output:_\
 We ❤️ Swift\
 We ❤️ Swift\
 We ❤️ Swift
 */
// Добавь код сюда:
func applyKTimes(_ k: Int, complition: () -> ()) {
    
    var counter = k
    while counter > 0 {
        complition()
        counter -= 1
    }
}

/*:
---
#### Задание 2
 - Обьяви переменную _numbers_, представляющую собой массив, который соостоит из целых чисел. Проицинициализируй его любыми значениями.
 */
// Добавь код сюда:
var numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]

/*:
 - Создай новый массив _multiples_, состоящий из всех кратных 3 чисел исходного массива.
 - Выведи полученный массив в консоль. Если полученный массив пустой, выведи в консоль - _No data_.
 - Note: 👆 _Для реализации задачи используй метод `filter`._
 */
/*:
 - Example: 😉\
 _Input:_\
 var numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]\
 _Output:_\
 multiples = [3, 6, 9, 3, 12]
 */
/*:
 - Example: 😉\
 _Input:_\
 var numbers = [1, 2, 10]\
 _Output:_\
 No data
 */
// Добавь код сюда:
var multiplies = numbers.filter{ $0 % 3 == 0 }
if multiplies.isEmpty {
    print("No Dada")
} else {
    print(multiplies)
}
/*:
 - Найди наибольшее число из исходного массива _numbers_ и выведи его в консоль.
 - Note: 👆 _Для реализации задачи используй метод `reduce`._
 */
/*:
 - Example: 😉\
 _Input:_\
 numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]\
 _Output:_\
 Max: 12
 */
// Добавь код сюда:
var maxValue = numbers.reduce(0, { max($0, $1) })
print(maxValue)
/*:
---
#### Задание 3
 -  Реализуй функию _forEach_, которая в качестве параметров принимает массив целых чисел и замыкание.
 - Функция должна вызвать замыкание для каждого элемента массива.
 - Example: 😉\
 _Function Input:_\
 forEach([1, 2, 3, 4]) {\
 print($0 + 1)\
 }\
 _Output:_\
 2\
 3\
 4\
 5
 */

// Добавь код сюда:
func forEach(array: [Int], complition: (Int) -> Int) -> [Int] {
    var result = [Int]()
    
    array.forEach {
        
        result.append(complition($0))
    }
    return result
}

let changedArray = forEach(array: [1,2,3,4]) { $0 + 1 }
print(changedArray)
/*:
---
### Продвинутый уровень:
#### Задание 4:
 - Напиши функцию, которая в качестве параметра принимает массив целых положительных чисел, а возвращает сумму пропущенных чисел в переданном диапазоне.
 - Выведи в консоль результат работы функции.
*/
/*:
- Note: 👆 _Минимальное и максимальное значение массива - это границы числового диапазона, которые нужно использовать при поиске отсутсвующих чисел_
*/
/*:
- Example: 😉\
_Function Call:_\
sumOfMissingNumbers([1, 3, 5, 7, 10])\
_Output:_\
Sum of missing numbers = 29
*/
// Добавь код сюда:

/*:
---
#### Задание 5:
 - Создай 2D массив,  состояющий из чисел 1 и 0.
 - Инвертируй все элементы массива ( замени 1 на 0 и наоборот).
 - Полученный результат выведи в консоль.
*/
/*:
- Example: 😉\
_Function Call:_\
reverseImage([\
 [1, 0, 0], \
 [0, 1, 0], \
 [0, 0, 1], \
 ])\
_Output:_\
 [ \
   [0, 1, 1], \
   [1, 0, 1], \
   [1, 1, 0] \
 ] 
*/
// Добавь код сюда:

/*:
---
## Задание 6:
 - Приведи пример функции, в которой замыкание передано в качестве параметра
 - В теле фукнции выведи строку в консоль "This is function"
 - В замыкании выведи в когсоль строку "This is closure"
*/
// Добавь код сюда:
func printer(complition: () -> ()) {
    print("This is function")
    complition()
}

printer {
    print("This is closure")
}

/*:
---
#### Задание 7:
 - Упрости приведенный код
*/
// Добавь код сюда:

var animals = ["fish", "cat", "chicken", "dog"]
let sortedAnimals = animals.sort { (one: String, two: String) -> Bool in
  return one < two
}

let fixSort = animals.sort {$0 < $1}
print(sortedAnimals)
//: [Назад: Функции](@previous)  |  Страница 7  |  [Вперед: Кортежи, перечисления и псевдонимы](@next)
