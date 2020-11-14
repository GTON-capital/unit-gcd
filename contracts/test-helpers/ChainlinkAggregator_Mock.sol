// SPDX-License-Identifier: bsl-1.1

/*
  Copyright 2020 Unit Protocol: Artem Zakharov (az@unit.xyz).
*/
pragma solidity ^0.7.1;

contract ChainlinkAggregator_Mock {
    uint public latestAnswer = 250e8;
    uint public latestTimestamp = block.timestamp;

    address admin = msg.sender;

    event AnswerUpdated(int256 indexed current, uint256 indexed roundId, uint256 timestamp);

    function setPrice(uint price) external {
        require(msg.sender == admin, "Unit Protocol: UNAUTHORIZED");
        latestAnswer = price;
        latestTimestamp = block.timestamp;
        emit AnswerUpdated(int(price), block.timestamp, block.timestamp);
    }
}