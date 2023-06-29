// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract nUSDStablecoin {
    string public name = "nUSD Stablecoin";
    string public symbol = "nUSD";
    uint8 public decimals = 18;

    uint256 public totalSupply;

    mapping(address => uint256) public balances;

    AggregatorV3Interface private priceFeed;

    constructor(address _priceFeedAddress) {
        priceFeed = AggregatorV3Interface(_priceFeedAddress);
    }

    function deposit() external payable {
        uint256 ethAmount = msg.value;
        require(ethAmount > 0, "ETH amount must be greater than 0");

        uint256 nusdAmount = ethAmount / 2;
        require(nusdAmount > 0, "nUSD amount must be greater than 0");

        balances[msg.sender] += nusdAmount;
        totalSupply += nusdAmount;
    }

    function redeem() external {
        uint256 nusdAmount = balances[msg.sender];
        require(nusdAmount > 0, "Insufficient nUSD balance");

        uint256 ethAmount = nusdAmount * 2;
        require(address(this).balance >= ethAmount, "Insufficient ETH balance");

        balances[msg.sender] = 0;
        totalSupply -= nusdAmount;

        payable(msg.sender).transfer(ethAmount);
    }

    function getPrice() external view returns (int256) {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return price;
    }
}
