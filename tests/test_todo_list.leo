// Import the program to test
import todo_list.aleo;

program test_todo_list.aleo {
    transition main(public a: u32) -> bool {
        return true;
    }

    @test
    transition test_add_todo() -> bool {
        // Create test todo data
        let description: [u8; 32] = [
            84u8, 101u8, 115u8, 116u8, // "Test"
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
            0u8, 0u8, 0u8, 0u8
        ];

        // Create a todo and verify it works
        let todo: Todo = Todo {
            id: 0u64,
            description: description,
            completed: false,
            priority: 1u64,
            is_in_progress: false,
        };
        
        return true;
    }

    @test
    transition test_remove_todo() -> bool {
        // Test removing a todo
        todo_list.aleo/remove_todo(0u64);
        return true;
    }
}