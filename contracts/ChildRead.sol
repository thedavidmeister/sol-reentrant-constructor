// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "hardhat/console.sol";
import { ParentRead } from "./ParentRead.sol";

contract ChildRead {
    constructor() public {
        console.log("ParentRead contract: %s", msg.sender);
        ParentRead(msg.sender).readData();
    }
}