$(document).ready(function () {
    var $cityInput = $("#ex-city");
    var $streetInput = $("#ex-street");
    var $houseInput = $("#ex-house");
    var $apartmentInput = $("#ex-apartment");
    var $deliveryAddressInput = $("[name=address]");

    $cityInput.on("blur", updateDeliveryAddress);
    $streetInput.on("blur", updateDeliveryAddress);
    $houseInput.on("blur", updateDeliveryAddress);
    $apartmentInput.on("blur", updateDeliveryAddress);

    var deliveryAddress = "";

    function updateDeliveryAddress() {
        deliveryAddress = "";

        var city = $cityInput.val();
        var street = $streetInput.val();
        var house = $houseInput.val();
        var apartment = $apartmentInput.val();

        if (city) {
            deliveryAddress += city;
        }

        if (street) {
            if (deliveryAddress) {
                deliveryAddress += ", ";
            }
            deliveryAddress += street;
        }

        if (house) {
            if (deliveryAddress) {
                deliveryAddress += ", ";
            }
            deliveryAddress += house;
        }

        if (apartment) {
            if (deliveryAddress) {
                deliveryAddress += ", ";
            }
            deliveryAddress += apartment;
        }

        $deliveryAddressInput.val(deliveryAddress);
    }

    $('input[name="delivery_id"]').change(function () {
        var parentCard = $(this).closest('.card');
        var otherCards = $('.card').not(parentCard);

        if ($(this).is(':checked')) {
            parentCard.find('.card-body input').removeAttr('disabled');
        } else {
            parentCard.find('.card-body input').attr('disabled', 'disabled');
        }

        otherCards.find('.card-body input').attr('disabled', 'disabled');
    });

});
