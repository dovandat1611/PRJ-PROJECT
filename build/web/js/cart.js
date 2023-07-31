function Carted() {
    alert("You have successfully made a purchase!\n Back to Menu");
}

function checkNumber(){
    var x = document.getElementById('quantity').value;
    if(isNaN(x) || x <= 0 ){
        x = 1;
    }
} 