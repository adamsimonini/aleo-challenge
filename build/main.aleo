program todo_list.aleo;

struct Todo:
    id as u64;
    description as u64;
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

finalize add_todo:
    input r0 as address.public;
    input r1 as Todo.public;
    get.or_use todo_count[r0] 0u64 into r2;
    hash.bhp256 r0 into r3 as field;
    cast r2 into r4 as field;
    add r3 r4 into r5;
    set r1 into todos[r5];
    add r2 1u64 into r6;
    set r6 into todo_count[r0];

function remove_todo:
    input r0 as u64.public;
    async remove_todo self.caller r0 into r1;

finalize remove_todo:
    input r0 as address.public;
    input r1 as u64.public;
    hash.bhp256 r0 into r2 as field;
    cast r1 into r3 as field;
    add r2 r3 into r4;
    cast 0u64 0u64 false 0u64 false into r5 as Todo;
    set r5 into todos[r4];
