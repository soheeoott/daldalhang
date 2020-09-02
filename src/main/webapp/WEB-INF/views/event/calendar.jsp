<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ include file="../common/header.jsp" %> --%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>** DalDal **</title>
    
    <link rel="stylesheet" type="text/css" href="resources/css/homeStyle.css">
    <link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">

    <link rel="stylesheet" href="resources/newcalendar/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="resources/newcalendar/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='resources/newcalendar/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='resources/newcalendar/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="resources/newcalendar/css/main.css">
</head>

<body>
<div>

    <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <!-- 관리자만 등록, 수정 시작 -->
        <%if(session.getAttribute("logID") != null && session.getAttribute("logID").equals("DalDal")) {%>

        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">공차</a></li>
                <li><a tabindex="-1" href="#">던킨도너츠</a></li>
                <li><a tabindex="-1" href="#">뚜레쥬르</a></li>
                <li><a tabindex="-1" href="#">메가커피</a></li>
                <li><a tabindex="-1" href="#">빽다방</a></li>
                <li><a tabindex="-1" href="#">스타벅스</a></li>
                <li><a tabindex="-1" href="#">이디야</a></li>
                <li><a tabindex="-1" href="#">쥬시</a></li>
                <li><a tabindex="-1" href="#">설빙</a></li>
                <li><a tabindex="-1" href="#">투썸플레이스</a></li>
                <li><a tabindex="-1" href="#">파리바게뜨</a></li>
                <li><a tabindex="-1" href="#">파스쿠찌</a></li>
                <li><a tabindex="-1" href="#">흑화당</a></li>
                
                <li class="divider"></li>
                <li>
                	<a tabindex="-1" href="#" data-role="close">Close</a>
                </li>
            </ul>
        </div>
        <%} %>
        <!-- 관리자만 등록, 수정 종료 -->

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>

        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        	<span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
						<!-- 
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>
                         -->

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                
                                    <option value="공차">공차</option>
                                    <option value="던킨도너츠">던킨도너츠</option>
                                    <option value="뚜레쥬르">뚜레쥬르</option>
                                    <option value="메가커피">메가커피</option>
                                    <option value="빽다방">빽다방</option>
                                    <option value="스타벅스">스타벅스</option>
                                    <option value="이디야">이디야</option>
                                    <option value="쥬시">쥬시</option>
                                    <option value="설빙">설빙</option>
                                    <option value="투썸플레이스">투썸플레이스</option>
                                    <option value="파리바게뜨">파리바게뜨</option>
                                    <option value="파스쿠찌">파스쿠찌</option>
                                    <option value="흑화당">흑화당</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-url">바로가기</label>
                                <input class="inputModal" type="text" name="edit-url" id="edit-url" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-eventImage">이미지 주소</label>
                                <input class="inputModal" type="text" name="edit-eventImage" id="edit-eventImage" />
                            </div>
                        </div>
                                               
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">내용</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                    
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                
                    <label for="calendar_view">구분</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="공차">공차</option>
                            <option value="던킨도너츠">던킨도너츠</option>
                            <option value="뚜레쥬르">뚜레쥬르</option>
                            <option value="메가커피">메가커피</option>
                            <option value="빽다방">빽다방</option>
                            <option value="스타벅스">스타벅스</option>
                            <option value="이디야">이디야</option>
                            <option value="쥬시">쥬시</option>
                            <option value="설빙">설빙</option>
                            <option value="투썸플레이스">투썸플레이스</option>
                            <option value="파리바게뜨">파리바게뜨</option>
                            <option value="파스쿠찌">파스쿠찌</option>
                            <option value="흑화당">흑화당</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6" style="display:none;">
                    <label for="calendar_view">등록자</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="ADMIN"
                                checked>ADMIN</label>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->

    <script src="resources/newcalendar/vendor/js/jquery.min.js"></script>
    <script src="resources/newcalendar/vendor/js/bootstrap.min.js"></script>
    <script src="resources/newcalendar/vendor/js/moment.min.js"></script>
    <script src="resources/newcalendar/vendor/js/fullcalendar.min.js"></script>
    <script src="resources/newcalendar/vendor/js/ko.js"></script>
    <script src="resources/newcalendar/vendor/js/select2.min.js"></script>
    <script src="resources/newcalendar/vendor/js/bootstrap-datetimepicker.min.js"></script>

	<!--  main.js 에 들어갈 부분 -->
	<script>
	
	
	  
	var draggedEventIsAllDay;
	var activeInactiveWeekends = true;
	
	
	
	function getDisplayEventDate(event) {
	
	  var displayEventDate;
	
	  if (event.allDay == false) {
	    var startTimeEventInfo = moment(event.start).format('');
	    var endTimeEventInfo = moment(event.end).format('');
	    displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
	  } else {
	    displayEventDate = "하루종일";
	  }
	
	  return displayEventDate;
	}
	
	
	
	function filtering(event) {
	  var show_username = true;
	  var show_type = true;
	
	  var username = $('input:checkbox.filter:checked').map(function () {
	    return $(this).val();
	  }).get();
	  var types = $('#type_filter').val();
	
	  show_username = username.indexOf(event.username) >= 0;
	
	  if (types && types.length > 0) {
	    if (types[0] == "all") {
	      show_type = true;
	    } else {
	      show_type = types.indexOf(event.type) >= 0;
	    }
	  }
	
	  return show_username && show_type;
	}
	
	function calDateWhenResize(event) {
	
	  var newDates = {
	    startDate: 'HH:mm',
	    endDate: 'HH:mm'
	  };
	
	  if (event.allDay) {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	  } else {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD');
	  }
	
	  return newDates;
	}
	
	function calDateWhenDragnDrop(event) {
	  // 드랍시 수정된 날짜반영
	  var newDates = {
	    startDate: '',
	    endDate: ''
	  }
	
	  // 날짜 & 시간이 모두 같은 경우
	  if(!event.end) {
	    event.end = event.start;
	  }
	
	  //하루짜리 all day
	  if (event.allDay && event.end === event.start) {
	    console.log('1111')
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = newDates.startDate;
	  }
	
	  //2일이상 all day
	  else if (event.allDay && event.end !== null) {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	  }
	
	  //all day가 아님
	  else if (!event.allDay) {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');//('YYYY-MM-DD HH:mm');
	    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD');//('YYYY-MM-DD HH:mm');
	  }
	
	  return newDates;
	}
	
	
	var calendar = $('#calendar').fullCalendar({
	
	  eventRender: function (event, element, view) {
	
	    //일정에 hover시 요약
	    element.popover({
	      title: $('<div />', {
	        class: 'popoverTitleCalendar',
	        text: event.title
	      }).css({
	        'background': event.backgroundColor,
	        'color': 'black'
	      }),
	      content: $('<div />', {
	          class: 'popoverInfoCalendar'
	        })//.append('<p><strong>등록자:</strong> ' + event.username + '</p>')
	        .append('<p><strong>브랜드</strong> ' + event.type + '</p>')
	        .append('<p><strong></strong> <a target="_blank" href=\"' + event.editurl + '\">이벤트 페이지 바로가기</a></p>')
	        //.append('<p><strong>시간:</strong> ' + getDisplayEventDate(event) + '</p>')
	        .append('<div class="popoverDescCalendar"><strong></strong> ' + event.description + '</div>'),
	        
	      delay: {
	        show: "20",
	        hide: "50"
	      },
	      trigger: 'hover click', //focus 사용
	      placement: 'top',
	      html: true,
	      container: 'body'
	    });
	
	    return filtering(event);
	
	  },
	
	  //주말 숨기기 & 보이기 버튼
	  customButtons: {
	    viewWeekends: {
	      text: '주말',
	      click: function () {
	        activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
	        $('#calendar').fullCalendar('option', {
	          weekends: activeInactiveWeekends
	        });
	      }
	    }
	  },
	
	  header: {
	    left: 'prevYear, today, nextYear',
	    center: 'prev, title, next',
	    right: 'month,agendaWeek'
	    		//,agendaDay,listWeek'
	  },
	  views: {
	    month: {
	      columnFormat: 'dddd'
	    },
	    agendaWeek: {
	      columnFormat: 'M/D ddd',
	      titleFormat: 'YYYY년 M월 D일',
	      eventLimit: false
	     }
	    /* agendaDay: {
	      columnFormat: 'dddd',
	      eventLimit: false
	    },
	    listWeek: {
	      columnFormat: '' 
	    } */
	  },
	
	  /* ****************
	   *  일정 받아옴 
	   * ************** */
	  events: function (start, end, timezone, callback) {
		  
	    $.ajax({
			url : '${pageContext.request.contextPath}/calendar/view?curMon='+ '07',
			type : 'get',
	      	data: {
	        	// 실제 사용시, 날짜를 전달해 일정기간 데이터만 받아오기를 권장
	      	},
	      	success: function (response) {
	      		
	
	      			
	        	var fixedDate = response.map(function (array) {
	        		
	          		if (array.allDay && array.start !== array.end) {
	            	
		          		// 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
		            	array.end = moment(array.end).add(1, 'days');
	          		}
	          	   	return array;
	        	})
	        	
	        callback(fixedDate);
	      }
	    });
	  },
	
	  eventAfterAllRender: function (view) {
	    if (view.name == "month") {
	      $(".fc-content").css('height', 'auto');
	    }
	  },
	
	  //일정 리사이즈
	  eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
	    $('.popover.fade.top').remove();
	
	    /** 리사이즈시 수정된 날짜반영
	     * 하루를 빼야 정상적으로 반영됨. */
	    var newDates = calDateWhenResize(event);
	
	    //리사이즈한 일정 업데이트
	    $.ajax({
	      type: "get",
	      url: "",
	      data: {
	        //id: event._id,
	        //....
	      },
	      success: function (response) {
	        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
	      }
	    });
	
	  },
	
	  eventDragStart: function (event, jsEvent, ui, view) {
	    draggedEventIsAllDay = event.allDay;
	  },
	
	  //일정 드래그앤드롭
	  eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
	    $('.popover.fade.top').remove();
	
	    //주,일 view일때 종일 <-> 시간 변경불가
	    if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
	      if (draggedEventIsAllDay !== event.allDay) {
	        alert('드래그앤드롭으로 종일<->시간 변경은 불가합니다.');
	        location.reload();
	        return false;
	      }
	    }
	
	    // 드랍시 수정된 날짜반영
	    var newDates = calDateWhenDragnDrop(event);
	
	    //드롭한 일정 업데이트
	    $.ajax({
	      type: "get",
	      url: "",
	      data: {
	        //...
	      },
	      success: function (response) {
	        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
	      }
	    });
	
	  },
	
	  select: function (startDate, endDate, jsEvent, view) {
	
	    $(".fc-body").unbind('click');
	    $(".fc-body").on('click', 'td', function (e) {
	
	      $("#contextMenu")
	        .addClass("contextOpened")
	        .css({
	          display: "block",
	          left: e.pageX,
	          top: e.pageY
	        });
	      return false;
	    });
	
	    var today = moment();
	
	    if (view.name == "month") {
	      startDate.set({
	        hours: today.hours(),
	        minute: today.minutes()
	      });
	      startDate = moment(startDate).format('YYYY-MM-DD');//('YYYY-MM-DD HH:mm');
	      endDate = moment(endDate).subtract(1, 'days');
	
	      endDate.set({
	        hours: today.hours() + 1,
	        minute: today.minutes()
	      });
	      endDate = moment(endDate).format('YYYY-MM-DD');//('YYYY-MM-DD HH:mm');
	    } else {
	      startDate = moment(startDate).format('YYYY-MM-DD');//('YYYY-MM-DD HH:mm');
	      endDate = moment(endDate).format('YYYY-MM-DD');//('YYYY-MM-DD HH:mm');
	    }
	
	    //날짜 클릭시 카테고리 선택메뉴
	    var $contextMenu = $("#contextMenu");
	    $contextMenu.on("click", "a", function (e) {
	      e.preventDefault();
	
	      //닫기 버튼이 아닐때
	      if ($(this).data().role !== 'close') {
	        newEvent(startDate, endDate, $(this).html());
	      }
	
	      $contextMenu.removeClass("contextOpened");
	      $contextMenu.hide();
	    });
	
	    $('body').on('click', function () {
	      $contextMenu.removeClass("contextOpened");
	      $contextMenu.hide();
	    });
	
	  },
	
	  //이벤트 클릭시 수정이벤트
	  eventClick: function (event, jsEvent, view) {
	    editEvent(event);
	  },
	
	  locale: 'ko',
	  timezone: "local",
	  nextDayThreshold: "09:00:00",
	  allDaySlot: true,
	  displayEventTime: false,
	  displayEventEnd: true,
	  firstDay: 0, //월요일이 먼저 오게 하려면 1
	  weekNumbers: false,
	  selectable: true,
	  weekNumberCalculation: "ISO",
	  eventLimit: true,
	  views: {
	    month: {
	      eventLimit: 12
	    }
	  },
	  eventLimitClick: 'week', //popover
	  navLinks: true,
	  /*
	  defaultDate: moment('2019-05'), //실제 사용시 삭제
	  */
	  timeFormat: 'HH:mm',
	  defaultTimedEventDuration: '01:00:00',
	  editable: true,
	  minTime: '00:00:00',
	  maxTime: '24:00:00',
	  slotLabelFormat: 'HH:mm',
	  weekends: true,
	  nowIndicator: true,
	  dayPopoverFormat: 'MM/DD dddd',
	  longPressDelay: 0,
	  eventLongPressDelay: 0,
	  selectLongPressDelay: 0
	});
	
	
	</script>
	<!-- main.js 종료 -->


<!--  관리자만 등록, 수정 -->
<%if(session.getAttribute("logID") != null && session.getAttribute("logID").equals("DalDal")) {%>
	
	<!-- addEvents.js 에 들어갈 부분 -->
	<script type="text/javascript">
	
	
	var eventModal = $('#eventModal');

	var modalTitle = $('.modal-title');
	var editAllDay = $('#edit-allDay');
	var editTitle = $('#edit-title');
	var editStart = $('#edit-start');
	var editEnd = $('#edit-end');
	var editType = $('#edit-type');
	var editColor = "#000000";
	var editDesc = $('#edit-desc');
	var editUrl = $('#edit-url');

	var addBtnContainer = $('.modalBtnContainer-addEvent');
	var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


	/* ****************
	 *  새로운 일정 생성
	 * ************** */
	var newEvent = function (start, end, eventType) {

	    $("#contextMenu").hide(); //메뉴 숨김

	    modalTitle.html('새로운 일정');
	    editType.val(eventType).prop('selected', true);
	    editTitle.val('');
	    editStart.val(start);
	    editEnd.val(end);
	    editDesc.val('');
	    editUrl.val('');
	    
	    addBtnContainer.show();
	    modifyBtnContainer.hide();
	    eventModal.modal('show');

	    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
	    var eventId = 1 + Math.floor(Math.random() * 10000);
	    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

	    //새로운 일정 저장버튼 클릭
	    $('#save-event').unbind();
	    $('#save-event').on('click', function () {

	    	var eventData = {
	            _id: eventId,
	            title: editTitle.val(),
	            start: editStart.val(),
	            end: editEnd.val(),
	            description: editDesc.val(),
	            type: editType.val(),
	            username: 'ADMIN',
	            backgroundColor: '#000000',
	            textColor: '#ffffff',
	            allDay: false,
	            editUrl : editUrl.val()
	        };
	    	
	        if (eventData.start > eventData.end) {
	            alert('끝나는 날짜가 앞설 수 없습니다.');
	            return false;
	        }

	        if (eventData.title === '') {
	            alert('일정명은 필수입니다.');
	            return false;
	        }

	        var realEndDay;
			/*
	        if (editAllDay.is(':checked')) {
	            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
	            //render시 날짜표기수정
	            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
	            //DB에 넣을때(선택)
	            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

	            eventData.allDay = true;
	        }
			*/

	        $("#calendar").fullCalendar('renderEvent', eventData, true);
	        eventModal.find('input, textarea').val('');
	        // editAllDay.prop('checked', false);
	        eventModal.modal('hide');

	        //frCode 구성
	        var val_frcode = "A13";
	        
	        // alert(eventData.type);
	        
	        switch (eventData.type) {
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
	        
	        // alert(eventData.title+" "+eventData.description+" "+eventData.start+" "+eventData.end+" "+var_frcode);
	        
	        
	        //새로운 일정 저장
	        $.ajax({
	            type: "get",
	            url: "${pageContext.request.contextPath}/calendar/insert",
	            data: {
	            	caltitle : eventData.title ,
	            	calcontent : eventData.description,
	            	start_date : eventData.start,
	            	end_date : eventData.end,
	            	frcode : var_frcode,
	            	editUrl : eventData.editUrl
	            },
	            success: function (response) {
	            	alert("등록되었습니다.");
	                //DB연동시 중복이벤트 방지를 위한
	                //$('#calendar').fullCalendar('removeEvents');
	                //$('#calendar').fullCalendar('refetchEvents');
	            }
	        });
				        
	    });
	};
	
	
	</script>
	<!-- addEvents.js 종료 -->

	<!-- editEvents.js 에 들어갈 부분 -->
	<script type="text/javascript">
	
	/* ****************
	 *  일정 편집
	 * ************** */
	var editEvent = function (event, element, view) {
		
	    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID

	    $('.popover.fade.top').remove();
	    $(element).popover("hide");

	    /*
	    if (event.allDay === true) {
	        editAllDay.prop('checked', true);
	    } else {
	        editAllDay.prop('checked', false);
	    }
	    */

	    if (event.end === null) {
	        event.end = event.start;
	    }
		
	    /*
	    if (event.allDay === true && event.end !== event.start) {
	        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
	    } else {
	        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
	    }
	    */
	    editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));

	    modalTitle.html('일정 수정');
	    editTitle.val(event.title);
	    editStart.val(event.start.format('YYYY-MM-DD'));
	    editType.val(event.type);
	    editDesc.val(event.description);
	    editUrl.val(event.editurl);
	    //editColor.val(event.backgroundColor).css('color', event.backgroundColor);

	    addBtnContainer.hide();
	    modifyBtnContainer.show();
	    eventModal.modal('show');

	    //삭제 버튼 클릭시
	    $('#deleteEvent').unbind();
	    $('#deleteEvent').on('click', function () {
	    	
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
			
	        /*
	        if (editAllDay.is(':checked')) {
	            statusAllDay = true;
	            startDate = moment(editStart.val()).format('YYYY-MM-DD');
	            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
	            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
	        } else {
	            statusAllDay = false;
	            startDate = editStart.val();
	            endDate = editEnd.val();
	            displayDate = endDate;
	        }
	        */
	        
	        startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;

	        eventModal.modal('hide');

	        // event.allDay = statusAllDay;
	        event.title = editTitle.val();
	        event.start = startDate;
	        event.end = displayDate;
	        event.type = editType.val();
	        // event.backgroundColor = editColor.val();
	        event.description = editDesc.val();
	        event.editurl = editUrl.val();

	        $("#calendar").fullCalendar('updateEvent', event);
			
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
	        
	       /*  alert(event.title+" "+event.description+" "+event.start+" "+event.end+" "+var_frcode+" "+event._id); */	        
	        
	       
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
	            	frcode : var_frcode,
	            	editUrl : event.editurl
	            },
	            success: function (response) {
	                alert('수정되었습니다.')
	            }
	        });


	        
    	});
	};

	</script>
    <!-- editEvents.js 종료 -->
    
<%}%>
<!-- 관리자 등록, 수정 종료 -->    
    
    <script src="resources/newcalendar/js/etcSetting.js"></script>


</div>
</body>

</html>