// The 'third_tokenizer' program.
program todo_list.aleo {
    // On-chain storage mappings
    mapping account: address => u64;
    mapping todo_list: u64 => u64;
    mapping todo_count: address => u64;

    record Token {
        // The token owner.
        owner: address,
        // The token amount.
        amount: u64,
    }

    /* Todo List Operations */

    async transition add_todo(public todo: u64) -> Future {
        return add_todo_internal(self.caller, todo);
    }

    async function add_todo_internal(caller: address, todo: u64) {
        // Get current count
        let current_count: u64 = Mapping::get_or_use(todo_count, caller, 0u64);
        // Add new todo
        Mapping::set(todo_list, current_count, todo);
        // Increment count
        Mapping::set(todo_count, caller, current_count + 1u64);
    }

    async transition remove_todo(public todo_id: u64) -> Future {
        return remove_todo_internal(self.caller, todo_id);
    }

    async function remove_todo_internal(caller: address, todo_id: u64) {
        // Remove todo by setting it to 0
        Mapping::set(todo_list, todo_id, 0u64);
    }
}