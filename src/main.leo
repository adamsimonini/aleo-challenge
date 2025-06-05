program todo_list.aleo {

    mapping todo_count: address => u64;
    mapping todos: field => Todo;

    struct Todo {
        id: u64,
        description: u64,
        completed: bool,
        priority: u64,
        is_in_progress: bool,
    }

    async transition add_todo(public todo: Todo) {
        let future: Future = add_todo_internal(self.caller, todo);
    }

    async function add_todo_internal(caller: address, todo: Todo) {
        let count: u64 = Mapping::get_or_use(todo_count, caller, 0u64);
        
        // Correct: hash both caller and count as tuple to get unique id
        let unique_id: field = BHP256::hash_to_field(caller) + count as field;

        Mapping::set(todos, unique_id, todo);
        Mapping::set(todo_count, caller, count + 1u64);
    }

    async transition remove_todo(public todo_id: u64) {
        let future: Future = remove_todo_internal(self.caller, todo_id);
    }

    async function remove_todo_internal(caller: address, todo_id: u64) {
        let unique_id: field = BHP256::hash_to_field(caller) + todo_id as field;
        let empty_todo: Todo = Todo {
            id: 0u64,
            description: 0u64,
            completed: false,
            priority: 0u64,
            is_in_progress: false,
        };
        Mapping::set(todos, unique_id, empty_todo);
    }
}
