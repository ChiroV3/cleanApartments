$(document).ready(function ()
{
    $('.locationButton').on('click', function () {
        var value = $(this).val();
        $("#apartmentNameLabel").html(value);

        var apartmentContainer = $("#apartmentContainer");
        apartmentContainer.html('');
        $.get("Apartment/ApartmentList",
            {
                id: $(this).attr('id')
            }, function (data) {
                apartmentContainer.html(data);
            })  
    });



});

function openApartmentDetails(e) {
    var id = $(e).data('apartment');
    $("#apartmentNameLabel").html('');

    var apartmentContainer = $("#apartmentContainer");
    apartmentContainer.html('');
    $.get("Apartment/ApartmentDetails",
        {
            apartmentId: id
        }, function (data) {
            apartmentContainer.html(data);
        })
}

function cleanApartmentAgain(e) {
    var id = $(e).data('apartment');
    $.get("Apartment/CleanApartmentAgain",
        {
            apartmentId: id
        }, function (response) {
            window.location.href = response.redirectToUrl;
        });
}