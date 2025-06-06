import todo_list.aleo;
program test_todo_list.aleo;

struct Todo:
    id as u64;
    description as [u8; 32u32];
    completed as boolean;
    priority as u64;
    is_in_progress as boolean;

function test_simple_addition:
    assert.eq 5u32 5u32;
