// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IBeanStalk {
    function depositBeans(uint256) external;

    function emergencyCommit(uint32 bip) external;

    function deposit(address token, uint256 amount) external;

    function vote(uint32 bip) external;

    function bip(
        uint32 bipId
    )
        external
        view
        returns (
            address,
            uint32,
            uint32,
            bool,
            int256,
            uint128,
            uint256,
            uint256
        );
}
