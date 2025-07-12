# 代币合约信息与操作指南

## 1. 合约核心信息

| 对象类型 | onechain-mainnet | onechain-testnet | sui-mainnet | sui-testnet |
|------------|-------------|-------------|-------------|-------------|
| PackageID | `0x3d1ecd3dc3c8ecf8cb17978b6b5fe0b06704d4ed87cc37176a01510c45e21c92` |  `0x68e3caaf439b8d8326162257948e8d141b0a669f2da2a560c1ca267e4298c3a3` | `/` | `0x71ccdb46d37bae1ce9fdca3e771c8c9c07dd29992747ec52558e0c34876b6c43` |
| UpgradeCap | `0x47359ea1ceb91321bc33b39a234ec200c77617db713e73b51ed24db62239acfe` |  `0xd5950932fdbaeac20169c34c9ba9d9cb24f013e0f1d13819f1fd9a84e1b52e6c` | `/` | `0x31f090fae09c391e59e863b5ea963318a170bb2b463d7fec09f22d9e941ce0e3` |
| TreasuryCap | `0xf8df95d97686ba9c21f00a1c74774433f81e6c63bd1fc8e56158d2444640fc5c` |  `0x8ec2f2ebd57fac64185f284659ac7134afa4af612925d92563a0ef232fccea24` | `/` | `0x1473016686c135ee958a424ef3749a96d424bd9d770173df1cbc3a76720c66e8` |
| CoinMetadata | `0xe76f8354c0144b8904bfb8855811bc4925fc96badc251207956e52598d3dae3b` | `0x21d20e274ab23d866e05b9b6146391d57b9f9d70ca1569f1218cee7f8ac7fb1a` | `/` | `0x8764b1df28077f2c05500f13dfe5b86b025a026e7156e687c8018b65ee90318b` |

- **发布合约账户**

`0x23bf8c3d7d2d55f8b78a72e3ee2d53a849c9db976ac5e8142e3ee12be4cf81d6`

- **代币类型（CoinType）**

`{{PackageID}}::usdh::USDH`

## 2. 常用操作指南

### 2.1 铸币操作

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