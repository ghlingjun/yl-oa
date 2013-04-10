// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
function split(val) {
    return val.split( /;\s*/ );
}
function extractLast(term) {
    return split(term).pop();
}

$(document).ready(function(){
    $('.autocomplete_input_multip_text').autocomplete({
        source: function (request, response){
            $.ajax({
                url: "/users.js",
                dataType: "json",
                data: {term: extractLast(request.term)},
                success: function(data){
                    response(data);
                }
            })
        },
        focus: function(){
            return false;
        },
        select: function(event, ui){
            var terms = split(this.value);
            terms.pop();
            terms.push(ui.item.value);
            terms.push("");
            this.value = terms.join(";");
            return false;
        }
    });
    $('.autocomplete_input_single_text').autocomplete({
        source: function (request, response){
            $.ajax({
                url: "/users.js",
                dataType: "json",
                data: {term: extractLast(request.term)},
                success: function(data){
                    response(data);
                }
            })
        },
        focus: function(){
            return false;
        }
    });
    $(function() {
        $( ".timepicker" ).datetimepicker({
            timeFormat: 'hh:mm',
            dateFormat: 'yy-MM-dd'
        });
    });

});


$(window).ready(
  function(){
    $('p.notice ').delay(6000).slideUp('slow');

    $('table tr td .details_info').click(function(){
        $(this).parent().parent().next().toggle();
    });

    if($('#application_receiver_state option:selected').val() == "rejected"){
        $('#application_receiver_state').attr("disabled", "disabled");
        $('#application_receiver_reason_field textarea').attr("disabled", "disabled");
    }else if($('#application_receiver_state option:selected').val() == "pending"){
        $('#application_receiver_submit').hide();
    }else if($('#application_receiver_state option:selected').val() == "approved"){
        $('#application_receiver_state').attr("disabled", "disabled");
        $('#application_receiver_reason_field').hide();
    }
    $('#application_receiver_state').change(function(){
        $("select option:selected").each(function(){
            if($(this).val() == "approved"){
                $('#application_receiver_reason_field textarea').val("");
                $('#application_receiver_reason_field textarea').hide();
                $('#application_receiver_submit').show();
            }else if($(this).val() == "rejected"){
                $('#application_receiver_reason_field textarea').show();
                $('#application_receiver_submit').show();
            }else if($(this).val() == "pending"){
                $('#application_receiver_submit').hide();
            }
        })
    });
    $('.disable').each(function(){
        $(this).attr("disabled", "disabled")
    });

    $('#business_travel_destination').hide();
    $("input:[name=leave_application[use]]:radio").change(
        function(){
            var $select_var =  $("input:[name=leave_application[use]]:radio:checked").val();
            if($select_var == "出差"){
                $('#business_travel_destination').show();
            }else{
                $('#business_travel_destination').hide();
            }
        }
    );
  }
);

