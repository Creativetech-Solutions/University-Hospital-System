function searchOrderFn(table){
    // datatable on search customize url to point to API
    table.on( 'search.dt', function () {
        // console.log( 'Currently applied global search: '+table.search() );
        ajax_url = table.ajax.url();
        table.ajax.url(ajax_url+'&search='+table.search());
        // table.draw();
    });
    // datatble on column ordering 
    table.on( 'order.dt', function () {
        // This will show: "Ordering on column 1 (asc)", for example
        ajax_url = table.ajax.url();
        var order = table.order();
        column_name = table.settings().init().columns[order[0][0]].data;
        if(order[0][1] == 'desc')
            column_name = '-'+column_name;

        table.ajax.url(ajax_url+'&ordering='+column_name);
    })
    // datatble on page change 
    table.on( 'page.dt', function () {
        var info = table.page.info();
        table.ajax.url(ajax_url+'&page='+info)
        // $('#pageInfo').html( 'Showing page: '+info.page+' of '+info.pages );
    });
}


function checkRequiredFields(formEl){
    $('#error').empty();
    $(formEl).find('label').css('color','#2b3d51cc');
    var error = false;
    formEl.find('input[required], textarea[required], select[required]').each(function(i, el){
        if($(el).val() == ''){
            var el_name = $(el).attr('name');
            var label = $('label[for="id_'+el_name+'"]').css('color','red');
            error = true;
        }
    })
    if(error){
        $('#error').html('Some fields are required');
        return false;
    }

    return true;

}

//$('#date-format').bootstrapMaterialDatePicker({ format : 'dddd DD MMMM YYYY - HH:mm' });
// $('#date-format').bootstrapMaterialDatePicker({ format : 'YYYY-MM-DD HH:mm' });
$('#date-format').daterangepicker({
    "singleDatePicker": true,
    "timePicker": true,
    "timePickerIncrement": 30,
    locale: {
        format: 'YYYY-MM-DD HH:mm:ss'
    }
});
// $('.timeinput').bootstrapMaterialDatePicker({ date: false, format:'HH:mm' });
$('.timeinput').daterangepicker({
    "singleDatePicker": true,
    timePicker: true,
    timePicker24Hour: true,
    timePickerIncrement: 30,
    locale: {
        format: 'H:m'
    }
}).on('show.daterangepicker', function (ev, picker) {
    picker.container.find(".calendar-table").hide();
});