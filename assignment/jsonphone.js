var load;
function load() {
    var person = document.getElementById("name").value;
    var str = String(person).toUpperCase();
    $.ajax({
        
        type:"GET",
        url: 'scripts/phone.json',
        datatype: 'json',
        success: function (data) {
            debugger;
            this.load = $.parseJSON(data);
            var myout = "";
            for (iter = 0; iter < this.load.person.length; iter++) {
                if (this.load.person[iter].Name==str){
                myout+= "\nName: "+this.load.person[iter].Name+" Number: "+this.load.person[iter].Number;
            }
            }
            document.getElementById("out").innerHTML = myout;
        }
    }).fail(function (data, status) {
        alert(data.statusText);
    });
}
function push() {
    var str;
    var name = String(document.getElementById("name").value).toUpperCase();
    var number = parseInt(document.getElementById("number").value);
    debugger;
    str="{ \"person\"/:[{ \"Name\" :\""+name+"\",\"Number\":"+number+" }] }";
    str = JSON.parse(str);
    $.ajax({
        type: "POST",
        url: 'scripts/phone.json',
        dataType: 'json',
        data: str,
        success: function (data, status) {
            alert(data.status);
    }
    }).fail(function (data, status) {
        alert(data.statusText);
    });
}