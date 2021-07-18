// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import { ChildRead } from "./ChildRead.sol";

contract ParentRead {
    bool public data;

    constructor() public {
        new ChildRead();
    }

    function readData() public view returns(bool) {
        return data;
    }
}