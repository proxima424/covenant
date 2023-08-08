// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ReentrancyGuard} from "@openzeppelin/security/ReentrancyGuard.sol";

/// @title Covenant ZK-Game
/// @author proxima424 <https://github.com/proxima424>
/// @author Asif Khan
/// @author Ragib

contract Covenant is ReentrancyGuard {
    /*//////////////////////////////////////////////////////////////
                        STATE VARIABLES/CONSTANTS
    //////////////////////////////////////////////////////////////*/
    address public immutable owner;

    uint256 immutable CYCLE_DURATION;
    uint256 immutable VOTE_THRESHOLD;

    // To be set via initialize function
    uint256 public startTime;
    uint256 public endTime;

    uint256 public totalVotes;
    uint256 public redVotes;
    uint256 public blueVotes;

    uint256 public totalDeposit;
    uint256 public redDeposit;
    uint256 public blueDeposit;

    // 0 == Has not voted
    // 1 == Has voted for Red
    // 2 == Has voted for Blue
    mapping(address => uint256) hasVoted;

    /*//////////////////////////////////////////////////////////////
                             MODIFIERS
    //////////////////////////////////////////////////////////////*/
    modifier checkOwner() {
        _checkOwner();
        _;
    }

    function _checkOwner() private {
        require(msg.sender == owner);
    }

    /*//////////////////////////////////////////////////////////////
                             CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    /// @param
    constructor(address _owner, uint256 cycleDuration, uint256 voteThreshold) {
        owner = _owner;
        CYCLE_DURATION = cycleDuration;
        VOTE_THRESHOLD = voteThreshold;
    }

    function initialize() nonReentrant checkOwner {
        startTime = now;
        endTime = now + CYCLE_DURATION;
    }

    function vote() nonReentrant {}
}
