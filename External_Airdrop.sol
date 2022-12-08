
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;



interface IERC20 {

    function balanceOf(address account) external view returns (uint256);
    function transferFrom(address from,address to, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


contract Airdrop {
   using SafeMath for uint256;  
   IERC20 obj = IERC20(0xb0fd6afe9FE5760a3Fb55aAd92A99AB6A27f7611);
   address[] public arr1 = new address[](5);
   
   
   function AirDrop(address[] memory _arr1,uint amount)public returns(bool){
        arr1 = _arr1;
       for(uint i=0;i<arr1.length;i++){
           require(arr1[i]!=address(0),"you can not send token to a zero address");
        obj.transferFrom(msg.sender,arr1[i],amount);
       }
      return true;
    }
 function checkBalance(address _addr)public view returns(uint){
     return obj.balanceOf(_addr);
 }




}
 