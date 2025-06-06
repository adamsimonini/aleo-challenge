import todo_list.aleo;
program test_todo_list.aleo;

struct Todo:
    description as [u8; 32u32];
    completed as boolean;
    priority as u64;
    is_in_progress as boolean;

function basic_test:
    assert.eq 0u64 0u64;
