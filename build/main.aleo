program todo_list.aleo;

struct Todo:
    description as [u8; 32u32];
    completed as boolean;
    priority as u64;
    is_in_progress as boolean;

mapping todo_count:
    key as address.public;
    value as u64.public;

mapping todos:
    key as field.public;
    value as Todo.public;

function add_todo:
    input r0 as Todo.public;
    async add_todo self.caller r0 into r1;
    output r0 as Todo.private;
    output r1 as todo_list.aleo/add_todo.future;

finalize add_todo:
    input r0 as address.public;
    input r1 as Todo.public;
    get.or_use todo_count[r0] 0u64 into r2;
    cast r0 into r3 as field;
    cast r2 into r4 as field;
    cast r3 r4 into r5 as [field; 2u32];
    hash.bhp256 r5 into r6 as field;
    set r1 into todos[r6];
    add r2 1u64 into r7;
    set r7 into todo_count[r0];

function remove_todo:
    input r0 as u64.public;
    async remove_todo self.caller r0 into r1;
    output r0 as u64.private;
    output r1 as todo_list.aleo/remove_todo.future;

finalize remove_todo:
    input r0 as address.public;
    input r1 as u64.public;
    cast r0 into r2 as field;
    cast r1 into r3 as field;
    cast r2 r3 into r4 as [field; 2u32];
    hash.bhp256 r4 into r5 as field;
    remove todos[r5];
