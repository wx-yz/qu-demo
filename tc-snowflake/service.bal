import ballerina/http;
import ballerina/io;
import ballerina/sql;
import ballerinax/snowflake;
import ballerinax/snowflake.driver as _;

configurable string account_identifier = ?;
configurable string user = ?;
configurable string password = ?;
snowflake:Options options = {
    requestGeneratedKeys: snowflake:NONE
};
snowflake:Client snowflakeClient = check new (account_identifier, user, password, options);

type Customer record {
    int id;
    string name;
    string address;
    string phone;
    decimal account_balance;
    string comment;
};

type User record {
    string Name;
    string Phone;
    decimal Balance;
};

function transform(Customer cust) returns User => {
    Name: cust.id.toString() + "-" + cust.name,
    Phone: cust.phone,
    Balance: cust.account_balance.round()
};


service / on new http:Listener(9090) {
    resource function get customers() returns User[]|error {
        sql:ParameterizedQuery sqlQuery = `SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER LIMIT 10`;
        stream<record {}, error?> resultStream = snowflakeClient->query(sqlQuery);
        User[] result = [];
        check from record {} customer in resultStream
            do {
                Customer cust = {
                    id: <int>customer["C_CUSTKEY"],
                    name: <string>customer["C_NAME"],
                    address: <string>customer["C_ADDRESS"],
                    phone: <string>customer["C_PHONE"],
                    account_balance: <decimal>customer["C_ACCTBAL"],
                    comment: <string>customer["C_COMMENT"]
                };
            
                result.push(transform(cust));
                io:println("Full details of customer: ", cust);
            };
        return result;
    }
}