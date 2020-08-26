/* ****************
 *  일정 편집
 * ************** */


var editEvent = function (event, element, view) {

    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID

    $('.popover.fade.top').remove();
    $(element).popover("hide");

   /* if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }*/

    if (event.end === null) {
        event.end = event.start;
    }

    /*if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }*/
    editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    
    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
   // editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

    	//alert("Delete button Click..");
    	$('#deleteEvent').unbind();
	    $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
	    eventModal.modal('hide');

	    //삭제시
	    $.ajax({
	        type: "get",
	        url: "${pageContext.request.contextPath}/calendar/delete",
            data: {
            	calseq : event._id
            },
	        success: function (response) {
	            alert('삭제되었습니다.');
	        }
	    });
	});
    	
  //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {
    	
    	//alert("update button Click..");
    	
        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

       /* if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }*/
        
        startDate = editStart.val();
        endDate = editEnd.val();
        displayDate = endDate;

        eventModal.modal('hide');

        //event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        //event.backgroundColor = editColor.val();
        event.description = editDesc.val();

      //frCode 구성
        var val_frcode = "A13";
        
        //alert(event.type);
        
        switch (event.type) {
				case '공차':
				var_frcode = "A01";
				break;
				case '던킨도너츠':
				var_frcode = "A02";
				break;
				case '뚜레쥬르':
				var_frcode = "A03";
				break;
				case '메가커피':
				var_frcode = "A04";
				break;
				case '빽다방':
				var_frcode = "A05";
				break;
				case '스타벅스':
				var_frcode = "A06";
				break;
				case '이디야':
				var_frcode = "A07";
				break;
				case '쥬씨':
				var_frcode = "A08";
				break;
				case '설빙':
				var_frcode = "A09";
				break;
				case '투썸플레이스':
				var_frcode = "A10";
				break;
				case '파리바게뜨':
				var_frcode = "A11";
				break;
				case '파스쿠찌':
				var_frcode = "A12";
				break;
				case '흑화당':
				var_frcode = "A13";
				break;
			default:
				var_frcode = "A01";
		}
        
        //alert(event.title+" "+event.description+" "+event.start+" "+event.end+" "+var_frcode+" "+event._id);	        
        
        //일정 업데이트
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/calendar/update",
            data: {
            	calseq : event._id,
            	caltitle : event.title ,
            	calcontent : event.description,
            	start_date : event.start,
            	end_date : event.end,
            	frcode : var_frcode
            },
            success: function (response) {
                alert('수정되었습니다.')
            }
        });

    });
};
/*
// 삭제버튼
$('#deleteEvent').on('click', function () {
    
    $('#deleteEvent').unbind();
    $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
    eventModal.modal('hide');

    //삭제시
    $.ajax({
        type: "get",
        url: "",
        data: {
            //...
        },
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });

});*/