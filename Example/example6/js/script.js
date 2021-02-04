var company = new Object();
company.name = "Facebook";
// company.ceo.firstName = "Mark";
// var a;
// a.hello = "Hello";
// console.log(a)
company.ceo = new Object();
company.ceo.firstName = "Mark";

console.log(company);
console.log("Company CEO name is: " + company.ceo.firstName);
console.log(company["name"]);

