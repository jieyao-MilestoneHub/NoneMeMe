// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * @title NoneMeMe (Upgradeable)
 * @dev 
 * An ERC20 token embodying "nothing really matters,"
 * yet preserving the idea of "dreams" in the void.
 *
 * Features:
 *  - Upgradeable via OpenZeppelin Upgrades Proxy.
 *  - Stores a dream that can be revealed or changed.
 */
contract NoneMeMe is Initializable, ERC20Upgradeable {
    // Symbolizes "your dream" in this emptiness
    string private _dream;

    // Event fired when we set a new dream
    event DreamsArise(string oldDream, string newDream);

    /**
     * @dev Must use 'initialize' for upgradeable contracts.
     * @param initialSupply The initial token supply (without 10^decimals()).
     * @param initialDream Your initial dream in the nothingness.
     */
    function initialize(uint256 initialSupply, string memory initialDream) public initializer {
        // Initialize ERC20
        __ERC20_init("NoneMeMe", "NONE");
        // Mint initial supply to the deployer
        _mint(msg.sender, initialSupply * (10 ** decimals()));
        // Set the dream
        _dream = initialDream;
    }

    /**
     * @dev View the current dream.
     */
    function revealDream() external view returns (string memory) {
        return _dream;
    }

    /**
     * @dev Update the dream and emit an event.
     */
    function setDream(string memory newDream) external {
        string memory oldDream = _dream;
        _dream = newDream;
        emit DreamsArise(oldDream, newDream);
    }

    /**
     * @dev A statement that says nothing matters, but still encourages dreaming.
     */
    function nothingMattersButDream() external pure returns (string memory) {
        return "In this cosmic void, your dream still shines as a beacon of hope.";
    }
}
