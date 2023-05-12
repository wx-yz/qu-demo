import ballerina/http;
import ballerinax/salesforce;
import ballerina/log;

function transform(AccountInfo accountInfo) returns NewAccount => {
    AccountName: accountInfo.Name.toUpperAscii(),
    AccountId: accountInfo.Id
};

type AccountInfo record {
    string Id;
    string Name;
};

type NewAccount record {
    string AccountName;
    string AccountId;
};

configurable string sfClientId = ?;
configurable string sfClientSecret = ?;
configurable string sfRefreshToken = ?;
configurable string sfRefreshUrl = ?;

salesforce:ConnectionConfig sfConfig = {
    baseUrl: "https://abcd-2c1-dev-ed.my.salesforce.com",
    auth: {
        clientId: sfClientId,
        clientSecret: sfClientSecret,
        refreshToken: sfRefreshToken,
        refreshUrl: sfRefreshUrl
    }
};

salesforce:Client salesforceEp = check new (sfConfig);

service / on new http:Listener(9090) {

    # Use salesforce connector in ballerina 
    # + return - Transformed NewAccount record
    resource function get info() returns NewAccount|error {
        json res = check salesforceEp->getAccountById("0013t00002e4USmAAM");
        log:printInfo("Payload from Salesforce: " + res.toString());
        AccountInfo ainfo = check res.cloneWithType(AccountInfo);
        NewAccount nacc = transform(ainfo);
        return nacc;
    }
}
