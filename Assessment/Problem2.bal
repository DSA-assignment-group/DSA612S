import ballerina/graphql; 

isolated service /graphql on new graphql:Listener(9090) {

    function init() {
        statsTable = table [
                {date: "2021-09-12", region: "Khomas", deaths: 39, confirmed_cases: 465, recoveries: 67, tested: 1200},
                {date: "2021-09-12", region: "Hardap", deaths: 4, confirmed_cases: 46, recoveries: 40, tested: 120},
                {date: "2021-09-12", region: "Karas", deaths: 4, confirmed_cases: 37, recoveries: 25, tested: 120},
                {date: "2021-09-12", region: "Oshana", deaths: 3, confirmed_cases: 20, recoveries: 15, tested: 120},
                {date: "2021-09-12", region: "Omaheke", deaths: 5, confirmed_cases: 35, recoveries: 30, tested: 120},
                {date: "2021-09-12", region: "Erongo", deaths: 35, confirmed_cases: 50, recoveries: 44, tested: 120}
            ];
    }

    remote function updateStatistic(string region, string? date, int? deaths, int? confirmed_cases, int? recoveries, int? tested) returns Statistic|Error? {
        Statistic? statistic = statsTable.get(region);
        Error e = {errorType: "400", message:"Not Found"};

        if statistic != (){
            if date != () {
                statistic.date = date;
            }
            if deaths != () {
                statistic.deaths = deaths;
            }
            if confirmed_cases != () {
                statistic.confirmed_cases = confirmed_cases;
            }
            if recoveries != () {
                statistic.recoveries = recoveries;
            }
            if tested != () {
                statistic.tested = tested;
            }
            return statistic;
        } else {
            return e;
        }
    }

    resource function get statistic() returns Statistic[] {
       return statsTable.toArray();
    }

}

public type Statistic record {|
    string date;
    readonly string region;
    int deaths;
    int confirmed_cases;
    int recoveries;
    int tested;
|};

public type Error record {|
    string errorType;
    string message;
|};
 
public table<Statistic> key(region) statsTable = table[]; 
