function kiemtra() {
    var pass = document.getElementById("Passworddangki");
    var confirm = document.getElementById("Confirmdangki");
    if (pass.value !== confirm.value) {
        alert("Mật khẩu không giống nhau.");
        return false;
    }
    return true;
}
function isEmpty() {
    var text = document.getElementById("text");
    if (text.value === "")
        return false;
    return true;
}