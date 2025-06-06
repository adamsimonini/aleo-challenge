# dev relations challenge from aleo

## Basic leo commands

```
leo build --network testnet
leo account
leo deploy
leo run <function>
leo execute <program>/<function>
```

## Testing

You can set your .env values to mimic these:
```
NETWORK=testnet
ENDPOINT=https://api.explorer.provable.com/v1
```

Testnet deployment: at109cjj6l6zhkrhvmjf2j9x44umd0azu3f4y3xd9vff29eff9ucggstty40s

Add a todo

```
leo execute add_todo '{description: [99u8,111u8,109u8,112u8,108u8,101u8,116u8,101u8,32u8,97u8,108u8,101u8,111u8,32u8,99u8,104u8,97u8,108u8,108u8,101u8,110u8,103u8,101u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8], completed: false, priority: 1u64, is_in_progress: false}'
```

Remove a todo

```
leo execute remove_todo <count_value>
leo execute remove_todo u064 // removes the first todo
```

### Local Aleo network via snarkOS

```
cd starkOS
./devnet.sh
leo deploy --endpoint https://localhost:3030 --broadcast
leo execute --endpoint https://localhost:3030 --broadcast
```
