// The 'test_third_tokenizer' test program.
import third_tokenizer.aleo;
program test_third_tokenizer.aleo {
    @test
    script test_it() {
        let result: u32 = third_tokenizer.aleo/main(1u32, 2u32);
        assert_eq(result, 3u32);
    }

    @test
    @should_fail
    transition do_nothing() {
        let result: u32 = third_tokenizer.aleo/main(2u32, 3u32);
        assert_eq(result, 3u32);
    }
}
