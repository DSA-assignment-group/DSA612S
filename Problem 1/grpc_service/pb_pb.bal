import ballerina/grpc;
import ballerina/protobuf.types.wrappers;

public isolated client class Assessment_Management_SystemClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR_PB, getDescriptorMapPb());
    }

    isolated remote function create_assignment(Assignments|ContextAssignments req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        Assignments message;
        if req is ContextAssignments {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("assignment1P1.Assessment_Management_System/create_assignment", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function create_assignmentContext(Assignments|ContextAssignments req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        Assignments message;
        if req is ContextAssignments {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("assignment1P1.Assessment_Management_System/create_assignment", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function assign_courses(CourseInfo|ContextCourseInfo req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        CourseInfo message;
        if req is ContextCourseInfo {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("assignment1P1.Assessment_Management_System/assign_courses", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function assign_coursesContext(CourseInfo|ContextCourseInfo req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        CourseInfo message;
        if req is ContextCourseInfo {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("assignment1P1.Assessment_Management_System/assign_courses", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function submit_marks(AssignmentInfo|ContextAssignmentInfo req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        AssignmentInfo message;
        if req is ContextAssignmentInfo {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("assignment1P1.Assessment_Management_System/submit_marks", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function submit_marksContext(AssignmentInfo|ContextAssignmentInfo req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        AssignmentInfo message;
        if req is ContextAssignmentInfo {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("assignment1P1.Assessment_Management_System/submit_marks", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function create_users() returns Create_usersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("assignment1P1.Assessment_Management_System/create_users");
        return new Create_usersStreamingClient(sClient);
    }

    isolated remote function create_courses() returns Create_coursesStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("assignment1P1.Assessment_Management_System/create_courses");
        return new Create_coursesStreamingClient(sClient);
    }

    isolated remote function register() returns RegisterStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("assignment1P1.Assessment_Management_System/register");
        return new RegisterStreamingClient(sClient);
    }

    isolated remote function submit_assignments() returns Submit_assignmentsStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("assignment1P1.Assessment_Management_System/submit_assignments");
        return new Submit_assignmentsStreamingClient(sClient);
    }

    isolated remote function request_assignments() returns Request_assignmentsStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("assignment1P1.Assessment_Management_System/request_assignments");
        return new Request_assignmentsStreamingClient(sClient);
    }
}

public client class Create_usersStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUserInfo(UserInfo message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUserInfo(ContextUserInfo message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class Create_coursesStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendCourseInfo(CourseInfo message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextCourseInfo(ContextCourseInfo message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class RegisterStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendCourseInfo(CourseInfo message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextCourseInfo(ContextCourseInfo message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class Submit_assignmentsStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendAssignmentInfo(AssignmentInfo message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextAssignmentInfo(ContextAssignmentInfo message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class Request_assignmentsStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendAssignmentInfo(AssignmentInfo message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextAssignmentInfo(ContextAssignmentInfo message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class Assessment_Management_SystemStringCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendString(string response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextString(wrappers:ContextString response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextUserInfoStream record {|
    stream<UserInfo, error?> content;
    map<string|string[]> headers;
|};

public type ContextCourseInfoStream record {|
    stream<CourseInfo, error?> content;
    map<string|string[]> headers;
|};

public type ContextAssignmentInfo record {|
    AssignmentInfo content;
    map<string|string[]> headers;
|};

public type ContextAssignments record {|
    Assignments content;
    map<string|string[]> headers;
|};

public type ContextUserInfo record {|
    UserInfo content;
    map<string|string[]> headers;
|};

public type ContextCourseInfo record {|
    CourseInfo content;
    map<string|string[]> headers;
|};

public type AssignmentInfo record {|
    string iD = "";
    string description = "";
    string course_code = "";
    string assignment_mark = "";
|};

public type Assignments record {|
    string numberOfAssignment = "";
    string description = "";
    string weight = "";
|};

public type UserInfo record {|
    string iD = "";
    string name = "";
|};

public type CourseInfo record {|
    string course_code = "";
    string course_name = "";
    UserInfo course_assessor = {};
|};

const string ROOT_DESCRIPTOR_PB = "0A0870622E70726F746F120D61737369676E6D656E743150311A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F222E0A0855736572496E666F120E0A0269441801200128095202694412120A046E616D6518022001280952046E616D652290010A0A436F75727365496E666F121F0A0B636F757273655F636F6465180120012809520A636F75727365436F6465121F0A0B636F757273655F6E616D65180220012809520A636F757273654E616D6512400A0F636F757273655F6173736573736F7218032001280B32172E61737369676E6D656E743150312E55736572496E666F520E636F757273654173736573736F7222770A0B41737369676E6D656E7473122E0A126E756D6265724F6641737369676E6D656E7418012001280952126E756D6265724F6641737369676E6D656E7412200A0B6465736372697074696F6E180220012809520B6465736372697074696F6E12160A067765696768741803200128095206776569676874228C010A0E41737369676E6D656E74496E666F120E0A0269441801200128095202694412200A0B6465736372697074696F6E180220012809520B6465736372697074696F6E121F0A0B636F757273655F636F6465180320012809520A636F75727365436F646512270A0F61737369676E6D656E745F6D61726B180420012809520E61737369676E6D656E744D61726B328D050A1C4173736573736D656E745F4D616E6167656D656E745F53797374656D12470A0C6372656174655F757365727312172E61737369676E6D656E743150312E55736572496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801124B0A0E6372656174655F636F757273657312192E61737369676E6D656E743150312E436F75727365496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801124D0A116372656174655F61737369676E6D656E74121A2E61737369676E6D656E743150312E41737369676E6D656E74731A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512490A0E61737369676E5F636F757273657312192E61737369676E6D656E743150312E436F75727365496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512450A08726567697374657212192E61737369676E6D656E743150312E436F75727365496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565280112530A127375626D69745F61737369676E6D656E7473121D2E61737369676E6D656E743150312E41737369676E6D656E74496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565280112540A13726571756573745F61737369676E6D656E7473121D2E61737369676E6D656E743150312E41737369676E6D656E74496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801124B0A0C7375626D69745F6D61726B73121D2E61737369676E6D656E743150312E41737369676E6D656E74496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33";

public isolated function getDescriptorMapPb() returns map<string> {
    return {"google/protobuf/wrappers.proto": "0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33", "pb.proto": "0A0870622E70726F746F120D61737369676E6D656E743150311A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F222E0A0855736572496E666F120E0A0269441801200128095202694412120A046E616D6518022001280952046E616D652290010A0A436F75727365496E666F121F0A0B636F757273655F636F6465180120012809520A636F75727365436F6465121F0A0B636F757273655F6E616D65180220012809520A636F757273654E616D6512400A0F636F757273655F6173736573736F7218032001280B32172E61737369676E6D656E743150312E55736572496E666F520E636F757273654173736573736F7222770A0B41737369676E6D656E7473122E0A126E756D6265724F6641737369676E6D656E7418012001280952126E756D6265724F6641737369676E6D656E7412200A0B6465736372697074696F6E180220012809520B6465736372697074696F6E12160A067765696768741803200128095206776569676874228C010A0E41737369676E6D656E74496E666F120E0A0269441801200128095202694412200A0B6465736372697074696F6E180220012809520B6465736372697074696F6E121F0A0B636F757273655F636F6465180320012809520A636F75727365436F646512270A0F61737369676E6D656E745F6D61726B180420012809520E61737369676E6D656E744D61726B328D050A1C4173736573736D656E745F4D616E6167656D656E745F53797374656D12470A0C6372656174655F757365727312172E61737369676E6D656E743150312E55736572496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801124B0A0E6372656174655F636F757273657312192E61737369676E6D656E743150312E436F75727365496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801124D0A116372656174655F61737369676E6D656E74121A2E61737369676E6D656E743150312E41737369676E6D656E74731A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512490A0E61737369676E5F636F757273657312192E61737369676E6D656E743150312E436F75727365496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512450A08726567697374657212192E61737369676E6D656E743150312E436F75727365496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565280112530A127375626D69745F61737369676E6D656E7473121D2E61737369676E6D656E743150312E41737369676E6D656E74496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565280112540A13726571756573745F61737369676E6D656E7473121D2E61737369676E6D656E743150312E41737369676E6D656E74496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801124B0A0C7375626D69745F6D61726B73121D2E61737369676E6D656E743150312E41737369676E6D656E74496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33"};
}

