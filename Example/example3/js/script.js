
//should be undefined

/* comment
123
 */

 var x;
console.log(x);

if (x == undefined){
    console.log("x is undefined");
}

x = 5;
if (x== undefined){
    console.log("x is undefined");
} else {
    console.log("x has been defined");
}
var social_media = {
    fb : "huy loh",
    google : "nguyen huy",
    github : "huy",
    "huy": "nguyen",
    10: "Abc"
};
uname = "huy";
console.log(social_media);
console.log(social_media.fb);
console.log(social_media.google); // truy cap object theo kieu dau cham .
console.log(social_media[10]); //truy cap theo kieu dau ngoac don []
console.log(uname);
console.log(social_media.abc) // neu thuoc tinh k ton tai thi tra ve undefined
fish = {
    length:20,
    width:7,
    age:3

};

console.log(fish);