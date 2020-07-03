pragma solidity ^0.4.26;

contract TestContract{
    struct User{
        string name;
        string email;
        string mobile;
        bytes32 password;
    }   
    
    struct bill{
        string type_bill;
        uint amount;
        string bill_image;
        string product_image;
    }
    
    address owner;
    
    uint i=0;
    
    mapping(string=>bytes32) e_p;
    mapping(address=>bill[]) a_b;
    User []u;
    function registerUser(string _name,string _email, string _mobile, string _password) public{
        User memory user=User(_name,_email,_mobile, keccak256(abi.encodePacked(_password))); //keccak256, sha3, sha256
        u.push(user);
        e_p[user.email]=user.password;
        
    }
    
    function getUserDetails() public view returns(string,string,string,bytes32) {
                return (u[0].name,u[0].email,u[0].mobile,u[0].password);
    }
    
    function login(string _email,string _password)constant public returns(bool){
        if(e_p[_email]==keccak256(abi.encodePacked(_password)))
            return true;
        else
            return false;
    }
    
    function addBill(string _type, uint _amount, string _bimage, string pimage) public{
        bill memory Bill = bill(_type,_amount,_bimage,pimage);
        a_b[owner].push(Bill);
        i++;
    }
                                               
    function getbill() public view returns(string, uint, string, string){
        return (a_b[owner][i-1].type_bill,a_b[owner][i-1].amount,a_b[owner][i-1].bill_image,a_b[owner][i-1].product_image);
    }
}
