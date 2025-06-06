import todo_list.aleo;

program test_todo_list.aleo {
    @test
    transition basic_test() {
        assert_eq(0u64, 0u64);
    }
}