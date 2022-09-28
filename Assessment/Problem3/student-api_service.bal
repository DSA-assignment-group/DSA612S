import ballerina/http;
import ballerina/io;

listener http:Listener EndPoint = new (1200, config = {host: "localhost"});

service /student_api/v1 on EndPoint {

    function init() {

        StudentTable = table [{  
            studentNumber: 6969696969,
            fullname: "Emma Yellow",
            emailaddress: "emyell@apex.com",
            courses: [{courseCode: "DSA", assessments: [{weight: 0.8, marks: 99.9}]}]}];
    }

    resource function get students() returns Student[]|http:Response {
        return StudentTable.toArray();
    }

    resource function get students/[int studentNumber]() returns Student|http:Response {
        Student? student = StudentTable.get(studentNumber);
        if student != () {
            return student;
        } else {
            http:Response response = new ();
            response.statusCode = 400;
            response.setPayload("Invalid");
            return response;
        }
    }

    resource function put students/[int studentNumber]/course/[string courseCode](@http:Payload Course payload) returns CreatedStudent|http:Response {
        Student? student = StudentTable.get(studentNumber);
        if student == () {
            http:Response response = new ();
            response.statusCode = 400;
            response.setPayload("Invalid");
            return response;
        } else {
            Course[] courses = <Course[]>student.courses;
            Course? studentCourse = courses.filter(
                function(Course course) returns boolean {
                return course.courseCode == courseCode;
            }
            )[0];

            if studentCourse == () {
                http:Response response = new ();
                response.statusCode = 400;
                response.setPayload("Invalid");
                return response;

            } else {
                CourseAssessments[] assessments = <CourseAssessments[]>payload.assessments;
                if assessments.length() > 0 {
                    CourseAssessments[] studentAssessments = <CourseAssessments[]>studentCourse.assessments;
                    studentAssessments.push(...assessments);
                    studentCourse.assessments = studentAssessments;
                    CreatedStudent response = {
                        body: {...student}
                    };
                    return response;
                } else {
                    http:Response response = new ();
                    response.statusCode = 400;
                    response.setPayload("Invalid");
                    return response;
                }
            }
        }

    }
 
    resource function post students(@http:Payload Student payload) returns CreatedInlineResponse201|http:Response {
        int[] conflictingStudentNumbers = from var {studentNumber} in StudentTable
            where studentNumber == payload.studentNumber
            select studentNumber;
        if conflictingStudentNumbers.length() > 0 {
            http:Response response = new ();
            response.statusCode = 408;
            response.setPayload("Error");
            return response;
        } else {
            StudentTable.add(<Student>payload);
            InlineResponse201 inlineresponse = {
                studentid: payload.studentNumber
            };
            CreatedInlineResponse201 response = {
                body: {...inlineresponse}
            };
            return response;
        }
    }

    resource function put students/[int studentNumber](@http:Payload Student payload) returns Student|http:Response {
        Student? student = StudentTable.get(studentNumber);
        if student != () {
            string? fullname = payload.fullname;
            if fullname != () {
                student.fullname = fullname;
            }

            string? emailaddress = payload.emailaddress;
            if emailaddress != () {
                student.emailaddress = emailaddress;
            }
            return student;
        } else {
            http:Response response = new ();
            response.statusCode = 400;
            response.setPayload("Invalid");
            return response;
        }
    }

    resource function delete students/[int studentNumber]() returns http:NoContent|http:Response {
        Student? student = StudentTable.get(studentNumber);
        if student != () {
            Student remove = StudentTable.remove(student.studentNumber);
            io:println(remove);
            return <http:NoContent>{};
        } else {
            http:Response response = new ();
            response.statusCode = 404;
            response.setPayload("Invaild");
            return response;
        }
    }
    
}

public table<Student> key(studentNumber) StudentTable = table[];
public type CreatedInlineResponse201 record {|
    *http:Created;
    InlineResponse201 body;
|};

public type CreatedStudent record {|
    *http:Created;
    Student body;
|};

public type InlineResponse201 record {
    int studentid?;
};

public type Error record {
    string errorType?;
    string message?;
};

public type CourseAssessments record {
    decimal weight?;
    decimal marks?;
};

public type Student record {
    readonly int studentNumber;
    string fullname?;
    string emailaddress?;
    Course[] courses?;
};

public type Course record {
    string courseCode?;
    CourseAssessments[] assessments?;
};
