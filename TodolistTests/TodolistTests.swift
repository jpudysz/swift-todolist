import XCTest
@testable import Todolist

final class TodolistTests: XCTestCase {
    var todolist: Todolist!

    override func setUpWithError() throws {
        todolist = Todolist(useMock: true)
    }

    override func tearDownWithError() throws {
        todolist = nil
    }

    func testFilteringByPriority() throws {
        let tasksWithHighPriority = todolist.todos.filter {
            $0.priority == .high
        }
        
        XCTAssertEqual(todolist.limitTo(query: "", priority: .high), tasksWithHighPriority)
        
        let tasksWithMediumPriority = todolist.todos.filter {
            $0.priority == .medium
        }
        
        XCTAssertEqual(todolist.limitTo(query: "", priority: .medium), tasksWithMediumPriority)
        XCTAssertEqual(todolist.limitTo(query: "", priority: .unknown), todolist.todos)
    }
    
    func testFilteringByQuery() throws {
        let tasksWithQuery = todolist.todos.filter {
            $0.text.lowercased().contains("Cle".lowercased())
        }
        
        XCTAssertEqual(todolist.limitTo(query: "Cle", priority: .unknown), tasksWithQuery)
        
        let tasksWithQuery2 = todolist.todos.filter {
            $0.text.lowercased().contains("a".lowercased())
        }
        
        XCTAssertEqual(todolist.limitTo(query: "a", priority: .unknown), tasksWithQuery2)
    }
    
    func testFilteringByQueryAndPriority() throws {
        let specificTask = todolist.todos.filter {
            $0.text.lowercased().contains("Cle".lowercased()) && $0.priority == .medium
        }
        
        XCTAssertEqual(todolist.limitTo(query: "Cle", priority: .medium), specificTask)
    }
    
    func testDeletingItem() throws {
        XCTAssertEqual(todolist.todos.count, 4)
        
        let firstTodo = todolist.todos.first
        todolist.deleteItem(at: .init(integer: 0))
        
        XCTAssertEqual(todolist.todos.count, 3)
        XCTAssertNotEqual(todolist.todos.first, firstTodo)
    }
    
    func testToggleTodo() throws {
        XCTAssertEqual(todolist.todos.first?.isCompleted, false)
        
        let firstTodo = todolist.todos.first
        
        todolist.toggleTodo(for: 0)
        
        XCTAssertEqual(todolist.todos.first?.isCompleted, true)
        
        todolist.toggleTodo(for: 0)
        
        XCTAssertEqual(todolist.todos.first?.isCompleted, false)
    }
}
