import models.aleo;

program todo_list.aleo {

    mapping todo_count: address => u64;
    mapping todos: field => Todo;

    struct Todo {
        id: u64,
        description: [u8; 32],
        completed: bool,
        priority: u64,
        is_in_progress: bool,
    }

    async transition add_todo(public todo: Todo) {
        let future: Future = add_todo_internal(self.caller, todo);
    }

    async function add_todo_internal(caller: address, todo: Todo) {
        let count: u64 = Mapping::get_or_use(todo_count, caller, 0u64);
        
        // Create unique id by hashing caller and count as fields
        let caller_field: field = caller as field;
        let count_field: field = count as field;
        let unique_id: field = BHP256::hash_to_field([caller_field, count_field]);

        Mapping::set(todos, unique_id, todo);
        Mapping::set(todo_count, caller, count + 1u64);
    }

    async transition remove_todo(public todo_id: u64) {
        let future: Future = remove_todo_internal(self.caller, todo_id);
    }

    async function remove_todo_internal(caller: address, todo_id: u64) {
        let caller_field: field = caller as field;
        let todo_id_field: field = todo_id as field;
        let unique_id: field = BHP256::hash_to_field([caller_field, todo_id_field]);

        Mapping::remove(todos, unique_id);
    }
}
