``
//import ballerina/grpc;
import ballerina/log;
import ballerina/io;
//import ballerina/http;

function displayOptions(){
    io:println("Select a number from the options:");
    io:println("1. Create_User");
    io:println("2. Create_Course");
    io:println("3. create_Assessment");
    io:println("4. Assign_Course_to_an_Assessor");
    io:println("5. Register_for_the_Course");
    io:println("6. Submit_Assignment");
    io:println("7. Request_Assignment");
    io:println("8. Submit_Marks");
    io:println("9. Exit");
    string choice = io:readln("Enter option: ");

    if (choice == "1"){
        create_users();
    }
    else if (choice == "2"){
        create_courses();
    }
    else if (choice == "3"){
        create_assessments();
    }
    else if (choice == "4"){
        assign_courses();
    }
    else if(choice == "5"){
        register();
    }
    else if(choice == "6"){
        submit_assignments();
    }
    else if(choice == "7"){
        request_assignments();
    }
    else if(choice == "8"){
        submit_marks();
    }
    else if(choice == "9"){
        exit();
    }
    else {
        io:println("Error: Invalid Input");
        displayOptions();
    }
}
function create_users () {
    
    io:println("");
    log:printInfo("                  Creating User               ");
    io:println("");
    
    map<json> newUser= {
        userNumber: "",
        name: ""
    };

    string user_number = io:readln("Enter user ID: ");
    newUser["userNumber"] = user_number;

    string user_name = io:readln("Enter user name: ");
    newUser["name"] = user_name;

    io:println("User created is: ", newUser.toJsonString());
    displayOptions();  
}

function create_courses () {
    
    io:println("");
    log:printInfo("                Creating a Course               ");
    io:println("");
    
    map<json> newCourse= {
        courseCode: "",
        courseName: ""
    };

    string course_code = io:readln("Enter the course code: ");
    newCourse["courseCode"] = course_code;

    string course_name = io:readln("Enter the course name: ");
    newCourse["courseName"] = course_name;

    io:println("Course created is: ", newCourse.toJsonString());
    displayOptions();  
}
function create_assessments () {
    
    io:println("");
    log:printInfo("             Creating assessments                ");
    io:println("");
    

    map<json> newAssessment= {
        numberOfAssignment: "",
	    description: "",
	    weight: ""
    };

    string assignments = io:readln("Enter the assignment number of this Course: ");
    newAssessment["numberOfAssignment"] = assignments;

    string assignment_id = io:readln("Enter the assignment name: ");
    newAssessment["description"] = assignment_id;

    string weight = io:readln("Enter the assignment weight: ");
    newAssessment["assignmenttotalMarks"] = weight;

    io:println("Assessment created is: ", newAssessment.toJsonString());
    displayOptions();  
}

function assign_courses () {
    
    io:println("");
    log:printInfo("        Assigning Course to an Assessor   ");
    io:println("");
    
    map<json> newAssessor= {
        courseCode: "",
        courseAssessor: "",
        userNumber: "",
        name: ""
    };

    string course_code = io:readln("Enter the course code: ");
    newAssessor["courseCode"] = course_code;

    string courseAssessor = io:readln("Enter the position of an Assessor assigned to this Course: ");
    newAssessor ["assessor"] = courseAssessor;

    
    string userNumber = io:readln("Enter Course Assessor User Number: ");
    newAssessor["staffNumber"] = userNumber;

    string name = io:readln("Enter Course Assessor Name: ");
    newAssessor["assessorName"] = name;

    io:println("This Course is assigned to: ", newAssessor.toJsonString());
    displayOptions();
}

function register () {
    
    io:println("");
    log:printInfo("          Register your Course            ");
    io:println("");
    
    map<json> newRegister= {
        userNumber: "",
        courseCode: ""
    };

    string student_number = io:readln("Enter your Student number: ");
    newRegister["userNumber"] = student_number;

    string course_code = io:readln("Enter the Course code you want to register: ");
    newRegister["courseCode"] = course_code;

    io:println("The course registerd is : ", newRegister.toJsonString());
    displayOptions();  
}

function submit_assignments () {
    
    log:printInfo("           Submit Assignment          ");
    
    map<json> newSubmitAssignment= {
        userNumber: "",
        description: "",
        course_code: ""
    };

    var student_number = io:readln("Enter your Student number: ");
    newSubmitAssignment["userNumber"] = student_number;

    string assignment_name = io:readln("Enter assignment name: ");
    newSubmitAssignment["description"] = assignment_name;

    string course_code = io:readln("Enter Course code: ");
    newSubmitAssignment["courseCode"] = course_code;

    io:println("Submitted assignment is: ", newSubmitAssignment.toJsonString());
    displayOptions();  
}

function request_assignments () {
    
    io:println("");
    log:printInfo("            Request An Assignment                  ");
    io:println("");
    
    map<json> newRequestAssignment= {
        description: "",
        course_code: ""
    };

    string description = io:readln("Enter assignment name: ");
    newRequestAssignment["assignment_name"] = description;

    string course_code = io:readln("Enter assignment course code: ");
    newRequestAssignment["courseName"] = course_code;

    io:println("Requested assignment is: ", newRequestAssignment.toJsonString());
    displayOptions();  
}

function submit_marks () {
    
    io:println("");
    log:printInfo("                Submit Assignment Marks                        ");
    io:println("");
    
    map<json> newSubmitMark= {
        userNumber: "",
        assignmentMark: "",
        description: "",
        courseCode: ""
    };

    string student_number = io:readln("Enter Student number: ");
    newSubmitMark["userNumber"] = student_number;

    string assignment_mark = io:readln("Enter assignment mark: ");
    newSubmitMark["assignmentMark"] = assignment_mark;

    string assignment_name = io:readln("Enter assignment name: ");
    newSubmitMark["description"] = assignment_name;

    string course_code = io:readln("Enter Course code: ");
    newSubmitMark["courseCode"] = course_code;

    io:println("Submitted is: ", newSubmitMark.toJsonString());
    displayOptions();  
}

function exit () {

    io:println("");
    io:println("              Are you sure you want to exit            ");
}

public function main (string... args) {

    //Assessment_Management_SystemClient ep = check new ("http://localhost:9090");

    io:println("      ASSESSMENT MANAGEMENT SYSTEM USER INTERFACE              ");
    displayOptions();
}
