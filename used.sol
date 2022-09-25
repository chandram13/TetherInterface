// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// USDT
interface USDT_V2Factory {
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}

interface USDT_V2Pair {
    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        );
}

contract USDTDemonstration {
    address private factory = 0x6c9E3E437b0F06C5366fAE4ea4e6cd6fB1803BdF;
    address private dai = unknown;
    address private weth = unknown;

    function getTokenReserves() external view returns (uint, uint) {
        address pair = USDT_V2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1, ) = USDT_V2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }
}
