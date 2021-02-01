// var x = "Hello JavaScript!";
var message = "in global";
console.log("global: message = " + message);

var a = function(){
    var message = "inside a";
    console.log("a: message = " + message);
    b();
    c();
    function c () {
        console.log("c: message = " + message)
    }
}

function b () {
    console.log("b: message = " + message);
}

var d = () => {console.log("d hello"); console.log("d world");} //arrow func

a();
d();