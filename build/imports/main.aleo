program main.aleo;

struct Todo:
    id as u64;
    description as [u8; 32u32];
    completed as boolean;
    priority as u64;
    is_in_progress as boolean;

function test_add_todo:
    output true as boolean.private;

function test_add_multiple_todos:
    output true as boolean.private;

function test_remove_todo:
    output true as boolean.private;
