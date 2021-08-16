// SPDX-License-Identifier: MIT  

pragma solidity >=0.7.0 <0.9.0;

interface IERC20Token {
  function transfer(address, uint256) external returns (bool);
  function approve(address, uint256) external returns (bool);
  function transferFrom(address, address, uint256) external returns (bool);
  function totalSupply() external view returns (uint256);
  function balanceOf(address) external view returns (uint256);
  function allowance(address, address) external view returns (uint256);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract CarDealer{

    struct Car{
        address payable owner;
        string carName;
        string carDescription;
        string carImage; //car image
        uint price;
        bool isUsed; //is car used
        bool isRent;
        bool isSale;
        bool isBought;
        bool isRented;
    }
    
    
    // shows the number of cars
    uint internal carLength = 0;
    
    mapping (uint => Car) internal cars;
    address internal cUsdTokenAddress = 0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1;
    
    // verify if the person owns a car
    modifier isOwner(uint _id) {
        require(msg.sender == cars[_id].owner,"Accessible only to the owner");
        _;
    }
    // verify if the car is for sale
    modifier forSale (uint _id) {
        require(cars[_id].isSale == true,"Not for Sale");
        _;
    }
    // verify if the car is for rent
    modifier forRent (uint _id) {
        require(cars[_id].isRent == true,"Not for Rent");
        _;
    }
    
    // add a car
    function setCar(
        string memory _carName,
        string memory _carDescription,
        string memory _carimage,
        bool _isUsed,
        bool _isRent,
        bool _isSale,
        uint _price
    )public {
        cars[carLength] = Car(
              payable(msg.sender),
              _carName,
              _carDescription,
              _carimage,
              _price,
              _isUsed,
              _isRent,
              _isSale,
              false,
              false
        );
        carLength++;
    }
    
    // this function reads a particular car data
    function getCar (uint _index) public view returns (
        address payable,
        string memory,
        string memory,
        string memory,
        uint,
        bool,
        bool,
        bool,
        bool,
        bool
    ) {
        Car storage car = cars[_index];
        return(
          car.owner,
          car.carName,
          car.carDescription,
          car.carImage,
          car.price,
          car.isUsed,
          car.isRent,
          car.isSale,
          car.isBought,
          car.isRented
        );
    }
    
    // function to buy a car
    function buyCar(uint _index) public  payable forSale(_index) {
     
        require(
          IERC20Token(cUsdTokenAddress).transferFrom(
            msg.sender,
            cars[_index].owner,
            cars[_index].price
          ),
          "This transaction could not be performed"
        );
        
        // change owner
        cars[_index].owner = payable(msg.sender);
        // change the sale and rent status
        cars[_index].isSale = false;
        cars[_index].isRent = false;
        cars[_index].isBought = true;
        
    }
     function rentingCar(uint _index) public  payable forRent(_index) {
     
        require(
          IERC20Token(cUsdTokenAddress).transferFrom(
            msg.sender,
            cars[_index].owner,
            cars[_index].price
          ),
          "This transaction could not be performed"
        );
        
        // change owner
        cars[_index].owner = payable(msg.sender);
        // change the sale and rent status
        cars[_index].isSale = false;
        cars[_index].isRent = false;
        cars[_index].isRented = true; 
        
    }
    
    // function for user to sell his own car
    function sellCar(uint _index) public isOwner(_index){
        cars[_index].isSale = true;
        cars[_index].isRent = false;
        cars[_index].isBought = false;
    }
    
    // function for user to auction his car
    function rentCar(uint _index) public isOwner(_index){
        cars[_index].isRent = true;
        cars[_index].isSale = false;
        cars[_index].isRented = false;
    }
    // function to get the length of the car array
    function getCarLength() public view returns (uint) {
        return (carLength);
    }
    
    
}