import todo_list.aleo;

program test_todo_list.aleo {
    @test
    transition test_add_todo() {
        let todo: todo_list.aleo/Todo = Todo {
            id: 0u64,
            description: [84u8, 101u8, 115u8, 116u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8],
            completed: false,
            priority: 1u64,
            is_in_progress: false
        };
        let (result, future) = todo_list.aleo/add_todo(todo);
        future.await();
        assert_eq(result.id, 0u64);
    }
}