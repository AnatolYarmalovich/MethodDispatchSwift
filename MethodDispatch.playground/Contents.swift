import UIKit

//MARK: Static/Direct Dispatch (0-2ns)

/*
Advantages:
 - the fastest type of dispatching
Disadvantages:
 - polymorphism not available
 - inheritance not available
 */

//Example of using:

protocol SomeProtocol {}

extension SomeProtocol {
    func someProtocolMethod() {
        print("Method executing")
    }
}

//Just for final class!!!
final class SomeClass {
    func classMethod() {
        print("Class method executing")
    }
}

struct SomeStruct {
    func structMethod() {
        print("Value type method executing")
    }
}

//MARK: Table dispatch (dynamic dispatching) - (~ 3 ns)

///Witness table dispatch
/*
 Advantages:
 - polymorphism available

 Disadvantages:
  - slower then static dispatch
  - inheritance not available

 COMMENT:
 We didn't know address of method on compile time (extracting address in runtime from table)
 Also don't remember that for every protocol table make own copy

 */

protocol WitnessTableProtocol {
    func witnessTableMethod()
}

class WitnessTableClass: WitnessTableProtocol {
    func witnessTableMethod() {
        print("witnessTableMethod executing")
    }
}

let witnessInstance: WitnessTableProtocol = WitnessTableClass()
witnessInstance.witnessTableMethod()

///Virtual table dispatch
/*
 Advantages:
 - polymorphism available
 - inheritance available
 Disadvantages:
  - slower then static dispatch

 COMMENT:
 Don't remember, here's every new table make a copy, where new methods are added
 */

class ParentVirtualTableClass {
    func firstParentVirtualTableMethod() {
        print("firstParentVirtualTableMethod executing")
    }

    func secondParentVirtualTableMethod() {
        print("secondParentVirtualTableMethod executing")
    }
}

class ChildVirtualTableClass: ParentVirtualTableClass {

    override func firstParentVirtualTableMethod() {
        print("firstChildVirtualTableClassMethod executing")
    }

    func secondChildVirtualTableClassMethod() {
        print("secondChildVirtualTableClassMethod executing")
    }
}

//MARK: Message dispatch slowest dispatching (but just for first time).

///Message dispatch
/*
 Advantages:
 - KVO/KVC
 - Method swizzling, isa swizzling
 Disadvantages:
  - slowest dispatch type

 COMMENT:
 Don't remember, here's every new table make a copy, where new methods are added
 */
