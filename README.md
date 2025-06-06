# aleo-challenge

dev relations challenge from aleo

```
leo build --network testnet

leo account

leo deploy

leo run mint_public aleo1udaweyza6evxmhtpdn3ml7tjjl6gk9jxpwcgqnmg4v9kdjjsf5zsugqm4r 10

leo run <function>

leo execute <program>/<function>
```

### Local Aleo network via snarkOS

```
cd starkOS
./devnet.sh
leo deploy --endpoint https://localhost:3030 --broadcast
leo execute --endpoint https://localhost:3030 --broadcast
```
