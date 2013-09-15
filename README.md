Welcome to To-Do Shredder, a simple app to keep track of what activities you need to get done during the day.
The idea is to start every day with nothing left from the past day and keep track of your productivity.

Gems used:
Rspec
bcrypt
simple-form

REST API
- Tasks can be added via XML. 
The following are examples of GET, POST, PUT and DELETE operations for tasks:

GET: Obtain XML object for a certain element via a Jquery method:
$.ajax({
	url: "http://localhost:3000/tasks/3.xml",
	dataType: "xml",
	type: "GET",
	processData: false,
	contentType: "text/xml"
});

POST: Insert a new element 
var xmlObject = "<task><name>Nueva Nota via XML</name><notes>Done</notes></task>";

$.ajax({
	url: "http://localhost:3000/tasks.xml",
	dataType: "xml",
	type: "POST",
	processData: false,
	contentType: "text/xml",
	data: xmlObject
});

PUT: Update an existing element.
var xmlObject = "<task><name>Updated via XML</name><notes>Done</notes></task>";
$.ajax({
	url: "http://localhost:3000/tasks/3.xml",
	dataType: "xml",
	type: "PUT",
	processData: false,
	contentType: "text/xml",
	data: xmlObject
});

DELETE:
$.ajax({
        type: "DELETE",
        url: "http://localhost:3000/tasks/7.xml",
        contentType: "application/json; charset=utf-8",
        dataType: "xml",
        success: function(data){console.log(data);console.log("success");},
        failure: function(errMsg) {
            	console.log(errMsg);
		console.log("failure");
        }
  });