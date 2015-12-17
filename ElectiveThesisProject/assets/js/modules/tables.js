$(document).ready(function () { 

    // Save personel information
    $("#save-new-uom-form").click(function (event) {
        console.log('Tapped!');
        
        $.ajax({
            type: "POST",
            
            url: baseUrl() + '/addNewUnit',

            data: $("#create-new-uom-form").serialize(),

            dataType: 'json',

            error: function (jqXHR, textStatus, errorThrown) {
                // If the request fails, throw a notification.
                alert(textStatus + ': ' + jqXHR.status + ' ' + errorThrown);

            },

            success: function (msg) {
                if (msg.notification === "Validation error") {
                    $("#err-unitofmeasure").text(msg.error.unitofmeasure );
            } else {
                    clearFormFields("#create-new-uom-form");
                    console.log('Wiinner!');
                    $('#myModal').modal('hide');
                  
                  }
            }
        });
    });
});