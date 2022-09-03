//
//  JavaScriptCoreTest.swift
//  
//
//  Created by Rodney Aiglstorfer on 9/3/22.
//

import XCTest
import JavaScriptCore

class JavaScriptCoreTest: XCTestCase {

    let ctx = JSContext()!

    func testSimpleExpression() throws {
        let result = ctx.evaluateScript("1 + 2 + 3")
        XCTAssertEqual(result?.toInt32(), 6)
    }
    
    func testMultiLineFunction() throws {
        ctx.evaluateScript(#"""
            function triple(number) {
            return number * 3;
            }
        """#)
        XCTAssertEqual(ctx.evaluateScript("triple(5)")?.toInt32(),15)
    }
    
    func testHandleExceptions() throws {
        ctx.exceptionHandler = { context, exception in
            XCTAssertNotNil(exception)
        }
        ctx.evaluateScript("**INVALID**")
    }
    
    // Getting JavaScript Context Values from Swift
    func testGetContextValuesFromSwift() throws {
        ctx.evaluateScript(#"""
            function triple(number) {
                return number * 3;
            }
            var threeTimesFive = triple(5)
        """#)
        XCTAssertEqual(ctx.objectForKeyedSubscript("threeTimesFive")?.toInt32(), 15)
    }
    
    // Passing Functions between Swift and JavaScript
    func testInvokeJSFuncFromSwift() throws {
        ctx.evaluateScript(#"""
            function triple(number) {
                return number * 3;
            }
        """#)

        let triple = ctx.objectForKeyedSubscript("triple")
        XCTAssertEqual(triple?.call(withArguments: [9])?.toInt32(), 27)
    }
    
    // Accessing a Swift function from inside a JavaScript context
    func testInvokeSwiftFuncFromJS() throws {
        // A similar limitation exists when you attempt to go the
        // opposite direction, from Swift to JavaScript: JavaScriptCore
        // is limited to passing Objective-C blocks to JavaScript contexts.
        // In Swift, you can use the `@convention(block)` to create a
        // compatible closure.
        let quadruple: @convention(block) (Int) -> Int = { input in
            return input * 4
        }

        ctx.setObject(quadruple,
                          forKeyedSubscript: "quadruple" as NSString)
        
        XCTAssertEqual(ctx.evaluateScript("quadruple(3)")?.toInt32(), 12)

        XCTAssertEqual(ctx.objectForKeyedSubscript("quadruple")?.call(withArguments: [3])?.toInt32(), 12)
    }
    
    // Passing Swift Objects between Swift and JavaScript
    func testPassSwiftObjects() throws {
        
            
            // Registering the Class in the JavaScript Context
            ctx.setObject(Person.self,
                              forKeyedSubscript: "Person" as NSString)
            
            // Instantiating Swift Classes from JavaScript
            ctx.evaluateScript(#"""
            function loadPeople(json) {
                return JSON.parse(json).map((attributes) => {
                    let person = Person.createWithFirstNameLastName(
                    attributes.first,
                    attributes.last
                )

                person.birthYear = attributes.year;

                return person;
                });
            }
            """#)
            
            let json = """
            [
                { "first": "Grace", "last": "Hopper", "year": 1906 },
                { "first": "Ada", "last": "Lovelace", "year": 1815 },
                { "first": "Margaret", "last": "Hamilton", "year": 1936 }
            ]
            """

            let loadPeople = ctx.objectForKeyedSubscript("loadPeople")!
            let people = loadPeople.call(withArguments: [json])!.toArray()
            XCTAssertEqual(people?.count, 3)
        }
    }




// Protocol must be declared with `@objc`
@objc protocol PersonJSExports: JSExport {
    var firstName: String { get set }
    var lastName: String { get set }
    var birthYear: NSNumber? { get set }

    var fullName: String { get }

    // Imported as `Person.createWithFirstNameLastName(_:_:)`
    static func createWith(firstName: String, lastName: String) -> Person
}

// Class must inherit from `NSObject`
@objc public class Person : NSObject, PersonJSExports {
    // Properties must be declared with `dynamic`
    dynamic var firstName: String
    dynamic var lastName: String
    dynamic var birthYear: NSNumber?

    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    class func createWith(firstName: String, lastName: String) -> Person {
        return Person(firstName: firstName, lastName: lastName)
    }
}
