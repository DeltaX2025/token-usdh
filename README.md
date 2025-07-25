# 代币合约信息与操作指南

## 1. 合约核心信息

| 对象类型 | onechain-mainnet | onechain-testnet | sui-mainnet | sui-testnet |
|------------|-------------|-------------|---------|-------------|
| PackageID | `0x3d1ecd3dc3c8ecf8cb17978b6b5fe0b06704d4ed87cc37176a01510c45e21c92` |  `0x72eba41c73c4c2ce2bcfc6ec1dc0896ba1b5c17bfe7ae7c6c779943f84912b41` | `0xb7e0f3afadf787a173ea7e7b73386072d59ea41d7bcd86de6663aa9d20e31708` | `0x71ccdb46d37bae1ce9fdca3e771c8c9c07dd29992747ec52558e0c34876b6c43` |
| UpgradeCap | `0x47359ea1ceb91321bc33b39a234ec200c77617db713e73b51ed24db62239acfe` |  `0x90d8da5844cd8b7b58c7458ecd86d74dc23706b19f3644c71aa95086c9343668` | `0x24e8ed3b5e904d7ddff0a4ac621e7df4a47553bb03de97e6020ee442ec6eea1e` | `0x31f090fae09c391e59e863b5ea963318a170bb2b463d7fec09f22d9e941ce0e3` |
| TreasuryCap | `0xf8df95d97686ba9c21f00a1c74774433f81e6c63bd1fc8e56158d2444640fc5c` |  `0x5e5d8fd68469cdb2d974f5afaac360124006621720c226437ce67d99652c69dc` | `0x8bed27b4bc02f52b431556eb8675bca9eddee20608be13f941875347765d1b74` | `0x1473016686c135ee958a424ef3749a96d424bd9d770173df1cbc3a76720c66e8` |
| CoinMetadata | `0xe76f8354c0144b8904bfb8855811bc4925fc96badc251207956e52598d3dae3b` | `0xa7542aa699b4feba6e854d6675b399a9ef067c7e2aab578acaef9a679850735f` | `0x459734a9f8e78f5384f733186a6f158a3133892afc4cb027bd2706ed6bf1c2cc` | `0x8764b1df28077f2c05500f13dfe5b86b025a026e7156e687c8018b65ee90318b` |

- **发布合约账户**

`0x23bf8c3d7d2d55f8b78a72e3ee2d53a849c9db976ac5e8142e3ee12be4cf81d6`

- **代币类型（CoinType）**

`{{PackageID}}::usdh::USDH`

## 2. 常用操作指南

### 2.1 发布合约操作sui

```shell

sui keytool import "这里是助记词" ed25519

sui client active-address

# 切换地址
sui client switch --address 0x23bf8c3d7d2d55f8b78a72e3ee2d53a849c9db976ac5e8142e3ee12be4cf81d6

# 切换环境
sui client switch --env mainnet
sui client switch --env testnet
sui client switch --env devnet
sui client switch --env localnet

sui client active-env
sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443

# 发布合约
sui client publish --gas-budget 100000000

# 给账户发币
sui client call \
    --package 0x2 \
    --module coin \
    --function mint_and_transfer \
    --type-args <CoinType> \
    --args <TreasuryCap> <amount> <recipient>
    
```

### 2.2 铸币操作

```shell
# OneChain网络
one_chain client call \
    --package 0x2 \
    --module coin \
    --function mint_and_transfer \
    --type-args <CoinType> \
    --args <TreasuryCap> <amount> <recipient>

# Sui网络
sui client call \
    --package 0x2 \
    --module coin \
    --function mint_and_transfer \
    --type-args <CoinType> \
    --args <TreasuryCap> <amount> <recipient>
```

**示例（Sui 测试网）：**
​
铸造 100 USDH（注意：需转换为最小单位，100 USDH = 100 * 10^9 = 100000000000）​

```shell
sui client call \
    --package 0x2 \
    --module coin \
    --function mint_and_transfer \
    --type-args 0x71ccdb46d37bae1ce9fdca3e771c8c9c07dd29992747ec52558e0c34876b6c43::usdh::USDH \
    --args 0x1473016686c135ee958a424ef3749a96d424bd9d770173df1cbc3a76720c66e8 100000000000 0x23bf8c3d7d2d55f8b78a72e3ee2d53a849c9db976ac5e8142e3ee12be4cf81d6
```

可通过区块浏览器查看详情：`https://suiscan.xyz/testnet/tx/JDW1hSCHPug72RvAyvKbkmx3bCgcaTzMUSQgyA75eXSB`

### 2.2 修改Token元数据

- **修改名字**

```shell
# OneChain网络
one_chain client call \
    --package 0x2 \
    --module coin \
    --function update_name \
    --type-args <CoinType> \
    --args <TreasuryCap> <CoinMetadata> <NewName>

# Sui网络
sui client call \
    --package 0x2 \
    --module coin \
    --function update_name \
    --type-args <CoinType> \
    --args <TreasuryCap> <CoinMetadata> <NewName>
```

- **修改符号**

```shell
# OneChain网络
one_chain client call \
    --package 0x2 \
    --module coin \
    --function update_symbol \
    --type-args <CoinType> \
    --args <TreasuryCap> <CoinMetadata> <NewSymbol>

# Sui网络
sui client call \
    --package 0x2 \
    --module coin \
    --function update_symbol \
    --type-args <CoinType> \
    --args <TreasuryCap> <CoinMetadata> <NewSymbol>
```

- **修改描述**

```shell
# OneChain网络
one_chain client call \
    --package 0x2 \
    --module coin \
    --function update_description \
    --type-args <CoinType> \
    --args <TreasuryCap> <CoinMetadata> <NewDescription>

# Sui网络
sui client call  \
    --package 0x2 \
    --module coin \
    --function update_description \
    --type-args <CoinType> \
    --args <TreasuryCap> <CoinMetadata> <NewDescription>
```

- **修改图标**

```shell
# OneChain网络
one_chain client call \
    --package 0x2 \
    --module coin \
    --function update_icon_url \
    --type-args <CoinType> \
    --args <TreasuryCap> <CoinMetadata> <NewUrl>

# Sui网络
sui client call  \
    --package 0x2 \
    --module coin \
    --function update_icon_url \
    --type-args <CoinType> \
    --args <TreasuryCap> <CoinMetadata> <NewUrl>
```

### 说明
*   所有操作需替换 `<占位符>` 为实际值（如 `TreasuryCap`、接收地址等）
*   金额需使用代币的最小单位（示例中 USDH 的小数位数为 9）
