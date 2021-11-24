pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// @author Henry Ollarves
// @title Contra Coin ERC20 Token
contract ContraCoin is ERC20 {
    address private owner;
    uint256 private INITIAL_SUPPLY = 21000000;
    mapping(address => uint256) pendingWithdrawals;
    

    constructor() ERC20("ContraCoin", "CC") {
        _mint(msg.sender, INITIAL_SUPPLY);
        owner = msg.sender;
    }

    // @dev Setting decimals to 0 so Contra Coin has no decimals
    function decimals() public view virtual override returns (uint8) {
      return 0;
    }

    // Sends the amount of Ether sent in Contra Coin
    // @dev Hardcoding the conversion exchange to 1:1 for simplicity
    function buyToken(uint256 _amount) external payable {
      require(_amount == ((msg.value / 1 ether)), "Incorrect amount of Eth.");
      transferFrom(owner, msg.sender, _amount);
    }

    // Sends the amount of Contra Coin sent in Ether.
    function sellToken(uint256 _amount) public {
        pendingWithdrawals[msg.sender] = _amount;
        transfer(owner, _amount);
        withdrawEth();
    }

    // Sends the pending funds for withdrawal to the caller's eth address
    function withdrawEth() private {
      uint256 amount = pendingWithdrawals[msg.sender];
      // Pending refund zerod before to prevent re-entrancy attacks
      pendingWithdrawals[msg.sender] = 0;
      payable(msg.sender).transfer(amount * 1 ether);
    }
}
