module usdh::usdh {
    use std::ascii::string;
    use std::option;
    use sui::url;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context;

    struct USDH has drop {}

    const DECIMALS: u8 = 9;
    const SYMBOL: vector<u8> = b"USDH";
    const NAME: vector<u8> = b"USDH Token";
    const DESCRIPTION: vector<u8> = b"USDH Token";
    const ICON_URL: vector<u8> = b"https://img.bgstatic.com/multiLang/coinPriceLogo/ae0e28b6052889bc2a46c4acd0ab44f51711213630630.png";

    fun init(otw: USDH, ctx: &mut tx_context::TxContext) {
        let (treasury_cap, meta_data) = coin::create_currency(
            otw,
            DECIMALS,
            SYMBOL,
            NAME,
            DESCRIPTION,
            option::some( url::new_unsafe(string(ICON_URL)) ),
            ctx,
        );

        let sender = tx_context::sender(ctx);        
        transfer::public_transfer(treasury_cap, sender);
        transfer::public_transfer(meta_data, sender);
    }
}

