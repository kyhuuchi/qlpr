function GetCurrentDate() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd
    }

    if (mm < 10) {
        mm = '0' + mm
    }

    today = dd + '/' + mm + '/' + yyyy;
    return today;
}

function ParseDateToTimeLineFormat(dateStr) {
    var dateT = ''
    var res = dateStr.split("/");
    
    if (res.length == 3) {
        dateT = res[2] + '-' + res[1] + '-' + res[0];
    }
    
    return dateT;
}


/**
 * Date to timestamp
 * @param  string template
 * @param  string date
 * @return string
 * @example         datetotime("d-m-Y", "26-02-2012") return 1330207200000
 */
function datetotime(template, date) {
    date = date.split(template[1]);
    template = template.split(template[1]);
    date = date[template.indexOf('m')]
        + "/" + date[template.indexOf('d')]
        + "/" + date[template.indexOf('Y')];

    return (new Date(date).getTime());
}

function InputWithNumber(controltextbox) {
    $(controltextbox).keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            // Allow: Ctrl/cmd+A
            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
            // Allow: Ctrl/cmd+C
            (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
            // Allow: Ctrl/cmd+X
            (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
            // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });

}

function myValidateFunction(control, isNumber) {
    var x, text;

    // Get the value of the input field with id="numb"
    x = control.val();

    // If x is Not a Number or less than one or greater than 10
    if (isNumber) {
        if (x == '' || isNaN(x) || x <= 0) {
            text = "Input not valid";
        }
        else {
            text = "Input OK";
            return true;
        }
    }
    else {
        if (x == null || x == '' || x.length <= 0) {
            text = "Input not valid";
        }
        else
        {
            text = "Input OK";
            return true;
        }
    }
   
    return false;
}


function FormatCurrency(ctrl) {
    //Check if arrow keys are pressed - we want to allow navigation around textbox using arrow keys
    if (event.keyCode == 37 || event.keyCode == 38 || event.keyCode == 39 || event.keyCode == 40) {
        return;
    }

    var val = ctrl.value;

    val = val.replace(/,/g, "")
    ctrl.value = "";
    val += '';
    x = val.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';

    var rgx = /(\d+)(\d{3})/;

    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }

    ctrl.value = x1 + x2;
}

function FormatMoney(val) {
    val = val.replace(/,/g, "")    
    val += '';
    x = val.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';

    var rgx = /(\d+)(\d{3})/;

    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }

    return (x1 + x2);
}

function CheckNumeric() {
    return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46;
}


String.prototype.replaceAll = function (search, replacement) {
    var target = this;
    return target.replace(new RegExp(search, 'g'), replacement);
};