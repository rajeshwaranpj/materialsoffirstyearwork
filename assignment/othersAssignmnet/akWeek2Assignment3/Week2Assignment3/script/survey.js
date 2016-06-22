function validate()
{
    var a = document.getElementById("internal").value;
    var b = document.getElementById("type").value;
    var c = document.getElementById("date").value;
    var d = document.getElementById("language").value;
    var e = document.getElementById("survey").value;
    var f = document.getElementById("description").value;

    if (b == "" || c == "" || d == "" || e == "" || f == "" || a == "") {
        alert("Fill In Required Fields");
    }

    else
        alert("Submitted");
}