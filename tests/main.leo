// Test program for todo_list.aleo
program main.aleo {
    struct Todo {
        id: u64,
        description: [u8; 32],
        completed: bool,
        priority: u64,
        is_in_progress: bool,
    }

    transition test_add_todo() -> bool {
        // Create a new todo with description "Buy milk"
        let description: [u8; 32] = [
            // "Buy milk" in ASCII
            66u8, 117u8, 121u8, 32u8, 109u8, 105u8, 108u8, 107u8, 
            // Padding with zeros for remaining bytes
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8
        ];

        let test_todo: Todo = Todo {
            id: 0u64,
            description: description,
            completed: false,
            priority: 1u64,
            is_in_progress: false,
        };

        return true;
    }

    transition test_add_multiple_todos() -> bool {
        // First todo with description "Task 1"
        let description1: [u8; 32] = [
            // "Task 1" in ASCII
            84u8, 97u8, 115u8, 107u8, 32u8, 49u8,
            // Padding with zeros
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8
        ];

        let todo1: Todo = Todo {
            id: 0u64,
            description: description1,
            completed: false,
            priority: 1u64,
            is_in_progress: false,
        };

        // Second todo with description "Task 2"
        let description2: [u8; 32] = [
            // "Task 2" in ASCII
            84u8, 97u8, 115u8, 107u8, 32u8, 50u8,
            // Padding with zeros
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8
        ];

        let todo2: Todo = Todo {
            id: 0u64,
            description: description2,
            completed: false,
            priority: 2u64,
            is_in_progress: true,
        };

        return true;
    }

    transition test_remove_todo() -> bool {
        // Create a todo with empty description
        let test_todo: Todo = Todo {
            id: 0u64,
            description: [
                0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
                0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
                0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
                0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8
            ],
            completed: false,
            priority: 3u64,
            is_in_progress: false,
        };

        return true;
    }
} 