$(document).ready(function () {
    $('[name=delivery_id]').on('change', function () {
        if ($(this).is('.NovaPoshta')) {

            $('.npcity').select2({
                theme: "bootstrap-5",
                width: $(this).data('width') ? $(this).data('width') : $(this).hasClass('w-100') ? '100%' : 'style',
                placeholder: $(this).data('placeholder'),
            });

            $('[name=address]').val('');

            $.ajax({
                url: "delivery/NovaPoshta/ajax/get_sender_city.php",
                data: { 'id': $(this).val() },
                dataType: 'json',
                success: function (data) {
                    if (data.success == 'false') {
                        alert('Bad request');
                        return false;
                    }

                    var option_list = '<option>' + citySelectOption + '</option>';

                    for (var i = 0; i < (data.data).length; i++) {
                        var active_city = '';
                        var option_value = data.data[i][selectedLanguage === 'ru' ? 'DescriptionRu' : 'Description'];

                        if (option_value && option_value.trim() !== '') {
                            option_list += "<option ref='" + data.data[i].Ref + "'" + active_city + " value='" + option_value + "'>" + option_value + "</option>";
                        }
                    }

                    $('[name="recipient_city"]').html(option_list);
                    $('.npcity').attr('disabled', false);
                }
            });

            return false;
        }

        return false;
    });

    $('[name=recipient_city]').on('change', function () {
        var option_load = '<option>' + warehouseLoadOption + '</option>';

        $('npstreet').show();
        $('[name=recipient_warehouse]').html(option_load);
        $('.npstreet').attr('disabled', true).select2({
            theme: "bootstrap-5",
            width: $(this).data('width') ? $(this).data('width') : $(this).hasClass('w-100') ? '100%' : 'style',
            placeholder: $(this).data('placeholder'),
        });;

        $.ajax({
            url: "delivery/NovaPoshta/ajax/get_warehouse.php",
            data: { city: $('option[value="' + $('[name=recipient_city]').val() + '"]').attr('ref'), id: $(this).data('id') },
            dataType: 'json',
            success: function (data) {
                if (data.success == 'false') {
                    alert('Bad request');
                    return false;
                }

                var option_list = '<option>' + warehouseSelectOption + '</option>';

                for (var i = 0; i < data.data.length; i++) {
                    var location = data.data[i];

                    if (location.TotalMaxWeightAllowed >= parseInt($('.order-weight').attr('weight')) || location.TotalMaxWeightAllowed == null) {
                        if (location.TypeOfWarehouse === '841339c7-591a-42e2-8233-7a0a00f0ed6f' || location.TypeOfWarehouse === '9a68df70-0267-42a8-bb5c-37f427e36ee4') {
                            var option_value = selectedLanguage === 'ru' ? location.DescriptionRu : location.Description;
                            option_list += '<option value="' + option_value + '">' + option_value + '</option>';
                        }
                    }
                }

                $('[name=recipient_warehouse]').html(option_list);
                $('.npstreet').attr('disabled', false);
            }
        });

        return false;
    });

    $('[name=delivery_id]').change(function () {
        if ($(this).is('.NovaPoshta')) {
            $('.block-adress').show();
        } else {
            $('.block-adress').hide();
        }
    });

    $('select.npstreet').change(function () {
        var citytogo = $('select.npcity').val();
        var adrtogo = $('select.npstreet option:selected').text();
        $('[name=address]').val(citytogo + ', ' + adrtogo);
    });
});