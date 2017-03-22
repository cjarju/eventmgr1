$(document).on('turbolinks:load', function() {

    $('.input-group.date').datepicker({
        format: "yyyy-mm-dd",
        todayBtn: "linked",
        todayHighlight: true,
        orientation: "top auto",
        autoclose: true
    });

    /*
     $("#pie-chart-container").highcharts({
     chart: {backgroundColor: "#d3d3d3"},
     title: {text: "Chart", style: {color: "#000"}},
     tooltip: { pointFormat: '{series.name}: <b>{point.y}</b>'}
     });
     */
    date_id = 2; 
    $('#add_date_btn').on('click',function(){
        var html_string = "<div class='form-group'> \
                            <div class='input-group date date-with-rmv' title='Select date'> \
                             <span class='input-group-addon delete-date' title='Remove'> <i class='glyphicon glyphicon-remove'></i> </span> \
                             <input class='form-control' name='event_dates[]' placeholder='event date' required='required' type='text' /> \
                             <span class='input-group-addon'><i class='glyphicon glyphicon-calendar'></i></span> \
                            </div> \
                           </div>";

        $('.event-dates-div').append(html_string);
        $('.input-group.date').datepicker({
            format: "yyyy-mm-dd",
            todayBtn: "linked",
            todayHighlight: true,
            orientation: "top auto",
            autoclose: true
        });
        date_id++;
    });

    $(document).on('click', '.delete-date', function(e){
        $('.input-group.date').datepicker('hide');
        $(this).parent().parent().remove();
    });
    
    /* new item: display dimension fields when related type is selected */
    $("#item_item_type_id").on('change', function(){
        var has_dimensions = $('option:selected',this).attr('data-has-dimensions');
        $divdimen = $("#divdimen");
        if (has_dimensions == 'true') {
            $divdimen.show();
        }
        else{
            $divdimen.hide();
        }
    });

    /* new event: show hide items when type checkbox is changed */
    $(".checkbox").on('change', function(){
        var $item_div_id = $("#"+$(this).val());
        if ($(this).prop("checked")) {
            $item_div_id.show();
        } 
        else {
            $item_div_id.hide();
        }
    });

    /* recaps select report options */

    /* when item types by events is checked disable items by months checkbox */
    $("#itemtypesxevents").on('change', function(){
        var $useMonthChbox  = $("#use_month"),
            $selectMonth    = $("#date_month"),
            $chkboxSrc      = $("#itemtypesxevents"),
            $chkboxDst      = $("#itemsxmonths");

        if ($chkboxSrc.prop("checked")) {
            $chkboxDst.attr('checked',false);
            $chkboxDst.attr('disabled',true);
        }
        else{
            $chkboxDst.attr('disabled',false);
        }
    });
 
    /* when items by months is checked disable item types by events and use month checkboxes */
    $("#itemsxmonths").on('change', function(){
        var $useMonthChbox   = $("#use_month"),
            $selectMonth     = $("#date_month"),
            $chkboxSrc       = $("#itemsxmonths"), 
            $chkboxDst       = $("#itemtypesxevents");

        if ($chkboxSrc.prop("checked")) {
            $chkboxDst.attr('checked',false);
            $chkboxDst.attr('disabled',true);
            $useMonthChbox.attr('checked',false);
            $useMonthChbox.attr('disabled',true);
            $selectMonth.attr('disabled',true);
        }
        else{
            $chkboxDst.attr('disabled',false);
            $useMonthChbox.attr('checked',true);
            $useMonthChbox.attr('disabled',false);
            $selectMonth.attr('disabled',false);
        }
    });
 
    /* when use month is checked disable month select */
    $("#use_month").on('change', function(){
        var $useMonthChbox   = $("#use_month")
            $selectMonth     = $("#date_month")

        if ($useMonthChbox.is(":checked")) {
            $selectMonth.attr('disabled',false);
        }
        else{
            $selectMonth.attr('disabled',true);
        }        
    });
 
});

 
 
 