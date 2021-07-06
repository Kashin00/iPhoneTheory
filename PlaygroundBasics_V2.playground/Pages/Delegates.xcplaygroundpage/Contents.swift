import Foundation
/*:
 # Делегаты

 Делегирование - это шаблон, который позволяет классу или структуре передавать (или делегировать) некоторую ответственность экземпляру другого типа. Этот шаблон реализуется определением протокола, который инкапсулирует делегируемые полномочия, таким образом, что соответствующий протоколу тип (делегат) гарантировано получит функциональность, которая была ему делегирована. Делегирование может быть использовано для ответа на конкретное действие или для получения данных из внешнего источника без необходимости знания типа источника.
 */
/*:
 Более подробно ты можешь прочитать [тут.](https://docs.google.com/document/d/1ZRHiPgmIqsOQIihG8Ad0WPgyajWR2zKux-EKt0pYQwQ/edit?usp=sharing)
 */

/*:
 ---
 ## Задание 1
 
 Ты завел будильник и после того как он зазвонит, тебе надо его выключить. Напиши программный код. Схематически это выглядит так:\
  ![Delegate.Task1](Playground.Delegate.Task1.png)
 */

// Добавь код сюда:
class User {
    
    func wakeUp() {
        
        let alarm = AlarmClock()
        alarm.delegate = self
        alarm.turnOn()
    }
}

protocol AlarmDelegate: AnyObject {
    
    func alarmDidRang()
}

extension User: AlarmDelegate {
    
    func alarmDidRang() {
        print("User: So, I have to get up")
    }
}

class AlarmClock {
    
    weak var delegate: AlarmDelegate?
    
    func turnOn() {
        
        print("Alarm Clock: The alarm is on")
        delegate?.alarmDidRang()
    }
}

let user = User()
user.wakeUp()
/*:
---
## Задание 2

Ты решил сделать ремонт у себя в комнате и  нанял строителя. После того как строитель выполнит подготовительные работы, он должен позвонить тебе с определенным вопросом. Получив от тебя ответ на вопрос, строитель продолжит свою работу. Через некоторое время он позвонит тебе еще раз и сообщит, что закончил ремонт. Опиши эту ситуацию программно. Схематически это выглядит так:\
![Delegate.Task2](Playground.Delegate.Task2.png)
*/
// Добавь код сюда:
class Me {
    
    func repairs() {
        
        let builder = Builder()
        builder.delegate = self
        builder.startPreparationWork()
        builder.finishPreparationWork()
    }
}


protocol BuilderDelegate: AnyObject {
    
    func builderDidPaintWall()
    func builderDidFinishedRepairs()
    
}

extension Me: BuilderDelegate {
    func builderDidPaintWall() {
        print("Me: I prefer white color")
    }
    
    func builderDidFinishedRepairs() {
        print("Me: Thanks")
    }
    
    
}

class Builder {
    
    weak var delegate: BuilderDelegate?
    
    func startPreparationWork() {
        
        print("Builder: Preparatory work started")
        print("Builder: Preparatory work are finished")
        print("Builder: What color did you choose?")
        delegate?.builderDidPaintWall()
    }
    
    func finishPreparationWork() {
        
        print("Builder: Repair is over")
        delegate?.builderDidFinishedRepairs()
    }
    
}

let me = Me()
me.repairs()
//: [Назад: Протоколы](@previous)  |  Страница 12]  [Вперед:  Универсальные шаблоны](@next)
