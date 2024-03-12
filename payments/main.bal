import ballerina/http;
import ballerina/log;

type User record {
    int id;
    string name;
    int accountNumber;
};
var users = [
    {id: 1, name: "John", accountNumber: 1234},
    {id: 2, name: "Doe", accountNumber: 5678}
];

type Account record {
    int userID;
    int accountID;
    string accountType;
    int balance;
};
var accountDetails = [
    {userID: 1, accountID: 1111, accountType: "Savings", balance: 1000},
    {userID: 2, accountID: 2222, accountType: "Current", balance: 2000}
];

type Payment record {
    int userID;
    int accountID;
    string action;
    int amount;
};


service / on new http:Listener(9090) {

    public function init() {

    }
    resource function get users() returns User[] {        
        log:printInfo("Returning users: " + users.toString());
        return users;
    }

    resource function get accountDetails(int id) returns Account {
        var account = from Account a in accountDetails where a.userID == id select a;
        log:printInfo("Returning user: " + account.toString());
        return account[0];
    }

    resource function post payments(Payment pay) returns string {
        log:printInfo("Payment received: " + pay.toString());
        log:printInfo("Getting account details of user: " + pay.userID.toString());

        // update account balance
        foreach var acc in accountDetails {
            if (acc.userID == pay.userID && acc.accountID == pay.accountID) {
                if (pay.action == "withdraw") {
                    acc.balance = acc.balance - pay.amount;
                } else if (pay.action == "deposit") {
                    acc.balance = acc.balance + pay.amount;
                }
            }
        }
        log:printInfo("New account details: " + accountDetails.toString());
        return "Payment processed successfully!";
    }
}
