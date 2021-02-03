var string = "Hello";
string += " World";
// string = string + " World";
console.log(string + " !");

// Regular math operators: +, -, *, /
console.log((5 + 4) / 3);
console.log(undefined / 5);
function test(a){
    console.log(a / 5);
}
console.log("invoke test() with no arguments");
test();
console.log("invoke test() with an argument");
test(10);