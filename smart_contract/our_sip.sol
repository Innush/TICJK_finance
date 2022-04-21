// SPDX-License-Identifier: MIT
pragma solidity >=0.7.2;

//import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract SIP {
    
    uint256 public sppID = 0;
    uint256 public minPeriod = 3600;
    mapping(uint256 => currentTokenStats) tokenStats;
    mapping(uint256 => sppSubscribers) public sppSubscriptionStats;
    mapping(address => mapping(address => uint256)) public tokens;


    event SubscribeToSpp(uint256 indexed sppID,address indexed customerAddress,uint256 value,uint256 period,address indexed tokenGet/*,address tokenGive*/);
    
    function tokenBalanceOf(address token, address user) public view returns (uint256 balance) {
        return tokens[token][user];
    }


    // function _deductFee(address customerAddress, address token, uint256 amount) internal {
    //     tokens[token][customerAddress] = tokens[token][customerAddress].sub(amount);
    //     tokens[token][feeAccount] = tokens[token][feeAccount].add(amount);
    // }


    function subscribeToSpp(uint256 value, uint256 period, address tokenGet) external returns (uint256 sID) {
        address customerAddress = msg.sender;
        require(period >= minPeriod, "MIN_FREQUENCY");
        require(period % 3600 == 0, "INTEGRAL_MULTIPLE_OF_HOUR_NEEDED");  //mod()
        require(tokenBalanceOf(tokenGet,customerAddress) >= value, "INSUFFICENT_BALANCE");
        //_deductFee(customerAddress, WETH, initFee);
        sppID += 1;

            sppSubscriptionStats[sppID] = sppSubscribers({
                exists: true,
                customerAddress: customerAddress,
                value: value,
                period: period,
                lastPaidAt: (block.timestamp - period)  //sub()
            });
            tokenStats[sppID] = currentTokenStats({
                TokenToGet: tokenGet,
                //TokenToGive: tokenGive,
                amountGotten: 0,
                amountGiven: 0
            });
            //sppSubList[customerAddress].arr.push(sppID);
            emit SubscribeToSpp(sppID,customerAddress,value,period,tokenGet/*,tokenGive*/);
            return sppID;
    }
    
    struct sppSubscribers {
        bool exists;
        address customerAddress;
        uint256 value; 
        uint256 period;
        uint256 lastPaidAt;
    }

    struct currentTokenStats {
        address TokenToGet;
        uint256 amountGotten;
        //address TokenToGive;
        uint256 amountGiven;
    }






}
