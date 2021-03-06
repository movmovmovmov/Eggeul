<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>






<!-- container -->
<div class="container get-header">
    <!-- Heading Row -->
    <div class="row align-items-center my-5">

        <div class="uploadResult">

        </div>

        <!-- /.col-lg-8 -->
        <div class="col-lg-5" style="margin-left: 30px;">
            <form id="operForm" action="group/modify" method="get">
                <input type="hidden" id="sn" name="sn" value="<c:out value="${group.sn}"/>">
                <input type="hidden" id="pageNum" name="pageNum" value="<c:out value="${cri.pageNum}"/>">
                <input type="hidden" id="amount" name="amount" value="<c:out value="${cri.amount}"/>">
                <input type="hidden" name="category" value="<c:out value="${cri.category}"/>">
                <input type="hidden" name="sigungu" value="<c:out value="${cri.sigungu}"/>">
                <input type="hidden" name="groupName" value="<c:out value="${cri.groupName}"/>">
                <input type="hidden" name="order" value="<c:out value="${cri.order}"/>">
            </form>
            <span style="color:gray;font-size:20px;"><c:out value="${group.category}"/></span>
            <h3 class="font-weight-light"><b><c:out value="${group.name}"/></b></h3>
            <div class="ratingPlace" id="stars${group.sn}" data-rating='<c:out value="${group.rating}"/>' data-ratingcount="<c:out value="${group.ratingCount}"/>"></div>
            <div class="flex-container" style="display: flex;">
                <c:forEach items="${group.tags}" var="tag">
                    <div style="background-color: #f1f1f1;margin: 2px;padding: 2px;font-size: 15px;border-radius: 0.5rem;width: 80px;height: 25px; text-align:center;">
                        <c:out value="${tag}"/>
                    </div>
                </c:forEach>
            </div>
            <div class="info">
            <p><i class="fas fa-map-marker-alt"></i> &nbsp;<c:out value="${group.sido}"/> <c:out value="${group.sigungu}"/></p>
            <p><i class="fas fa-users"></i> ?????? <c:out value="${group.attendCount}"/>???</p>
            <p><i class="fas fa-user"></i> &nbsp;????????? <c:out value="${group.userName}"/></p>
            </div>

            <sec:authorize access="isAuthenticated()">
                <a class="btn btn-primary" href="#" id="attendBtn">?????? ??????</a>
                <c:if test="${pinfo.username ne group.userId}">
                    <a class="btn btn-danger" href="#" id="withdrawBtn">?????? ??????</a>
                </c:if>
                <c:if test="${pinfo.username eq group.userId}">
                    <button data-oper="modify" class="btn btn-secondary">?????? ??????/??????</button>
                </c:if>
            </sec:authorize>

<!-- ?????? ??? ??????
            <sec:authorize access="isAuthenticated()">
                <a class="btn btn-outline-primary" href="#" id="heartOff"><i class="far fa-heart"></i></a>
                <a class="btn btn-primary" href="#" id="heartOn"><i class="far fa-heart"></i></a>
            </sec:authorize>
-->

        </div>
        <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->
    </div>
<!-- container -->

<div class="gray-background">


<%--    <div id="nav-background" style="width: 100%;height: 100px; background-color: black;"></div>--%>
<!-- nav -->
<div class="topnav" style="position: sticky;top: 0;transition: background-color 0.5s;">
    <a href="#groupInfo" class="active">??????</a>
    <a href="#study">??????</a>
    <a href="#board">?????????</a>
<!--
    <a href="#groupRating">??????</a>
-->
</div>
<!-- /nav -->

    <!-- container -->
    <div class="container">

        <div class="main-contents get-body">
        <!-- ?????? ????????? -->
        <div id="groupAttend">
            <h4>????????????</h4>
            <ul class="attend">
                <li data-sn="12">
                    <div>
                        <div class="header">
                            <img src="../../../resources/img/img_avatar2.png" alt="Avatar" class="avatar">
                            <span>??????</span>
                            <span>?????????</span>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <br>

        <hr class="centerHr" id="groupInfo">
        <div id="info" >
            <h4>????????????</h4>
            <pre style="font-family: 'Noto Sans KR'"><c:out value="${group.grpInfo}"/></pre>
        </div>
        <br>




        <!-- ?????? ????????? ??????-->
        <hr class="centerHr" id="study">
        <div>
            <h4>
<%--            <c:set var="done" value="false"/>--%>

<%--            <c:forEach var = "attendant" items="${attendList}">--%>
<%--                <c:if test="${not done}">--%>
<%--                    <c:if test="${attendant.userId == pinfo.username}">--%>
<%--                        <a href='/study/register?pageNum=${cri.pageNum}&amount=${cri.amount}&grpSn=${group.sn}'--%>
<%--                           class='btn btn-primary' id="studyBtn">?????? ?????????</a>--%>
<%--                        <c:set var="done" value="true"/>--%>
<%--                    </c:if>--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>
                <a href='/study/register?pageNum=${cri.pageNum}&amount=${cri.amount}&grpSn=${group.sn}'
                   class='btn btn-primary' id="studyBtn">?????? ?????????</a>
            </h4>
        </div>

            <%-- pinfo.username ne group.userId  or pinfo.username eq group.userId--%>
<%--            <hr class="centerHr" id="study">--%>
<%--            <div>--%>
<%--                <h4>--%>
<%--                    <sec:authorize access="isAuthenticated()">--%>
<%--                        <c:if test="${pinfo.username ne group.userId}">--%>
<%--                            <a href='/study/register?pageNum=${cri.pageNum}&amount=${cri.amount}&grpSn=${group.sn}'--%>
<%--                               class='btn btn-primary' id="studyBtn">?????? ?????????</a>--%>
<%--                        </c:if>--%>
<%--                    </sec:authorize>--%>
<%--                    ${pinfo}</br>--%>
<%--                    ${group.userId}</br>--%>

<%--                </h4>--%>
<%--            </div>--%>



        <!-- ????????? ?????? ????????? -->
        <h4 style="clear:left;">????????? ??????</h4>
        <div class="studyList row">
        </div>

        <!-- ????????? ?????? ????????? ?????? -->
        <div class="studyPageFooter panel-footer">
        </div>

        <!-- ?????? ?????? ????????? -->
        <h4>?????? ??????</h4>
        <div class="pastStudyList row">
        </div>

        <!-- ?????? ?????? ????????? ?????? -->
        <div class="pastStudyPageFooter panel-footer">
        </div>

        <!-- ????????? -->
        <hr class="centerHr" id="board">
        <div>
        <%@include file="groupBoard.jsp"%>
        </div>



        <!-- ?????? ??????
        <hr class="centerHr" id="groupRating">
        <div>
            <h4>??????<sec:authorize access="isAuthenticated()">
                <a class="btn btn-primary" id="addRatingBtn">?????? ??????</a>
            </sec:authorize></h4>
<%--            <h4>??????--%>
<%--                <sec:authorize access="isAuthenticated()">--%>
<%--                    <c:set var="done" value="false"/>--%>

<%--                    <c:forEach var = "attendant" items="${attendList}">--%>
<%--                        <c:if test="${not done}">--%>
<%--                             <c:if test="${pinfo.username eq group.userId}">--%>
<%--                                <a class="btn btn-primary" id="addRatingBtn">?????? ??????</a>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
<%--                    </c:forEach>--%>
<%--                </sec:authorize>--%>
<%--            </h4>--%>

            <div class="group-rating">
                <ul class="rating">
                    <li data-sn="12">
                        <div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
-->
        <!-- ?????? ?????????
        <div class="paging-footer panel-footer">

        </div>
-->


        <!-- Call to Action Well -->
        <!--
        <div class="card text-white bg-secondary my-5 py-4 text-center">
            <div class="card-body">
                <p class="text-white m-0">This call to action card is a great place to showcase some important information or display a clever tagline!</p>
            </div>
        </div>

        </div>
        -->
        <!-- main-contents -->
    </div>
    <!-- container -->
</div>

<!-- ?????? ??????/?????? ?????? ??????
<div class="modal fade" id="groupModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">-->
        <!-- Modal content
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">??????</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="userId">?????????</label>
                    <input type="text" class="form-control" name="userId" id="userId">
                </div>
                <div class="form-group">
                    <label for="rating">????????????(0~5???)</label>
                    <input type="number" class="form-control" name="rating" id="rating" min="0" max="5" step="1">
                </div>
                <div class="form-group">
                    <label for="review">??????</label>
                    <input type="text" class="form-control" name="review" id="review">
                </div>
                <div class="form-group" id="stdSnForm">
                    <label for="stdSn">????????? ??????</label> -->
<%--                    <input type="number" class="form-control" name="stdSn" id="stdSn">--%>
<!--                    <select id="stdSn">
                    </select>
                </div>
                <div class="form-group" id="modifyStdSnForm">
                    <label for="modifyStdSn">????????? ??????</label>
                    <input class="form-control" name="modifyStdSn" id="modifyStdSn">
                </div>
                <label for="grpSn" hidden>????????????</label>
                <input type="number" class="form-control" name="grpSn" id="grpSn" hidden>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-warning" id="modalModBtn">??????</button>
                <button type="button" class="btn btn-danger" id="modalRemoveBtn">??????</button>
                <button type="button" class="btn btn-primary" id="modalRegisterBtn">??????</button>
                <button type="button" class="btn btn-secondary" id="modalCloseBtn" data-dismiss="modal">??????</button>
            </div>
        </div>
    </div>
</div>-->
<!-- /modal -->


<!-- ?????? ?????? ?????? ?????? -->
<div class="modal fade" id="studyModal" tabindex="-1" role="dialog" aria-labelledby="studyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="studyModalLabel">??????</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="studyModalBody modal-body">??????????????? ?????????????????????.</div>
            <div class = "modal-footer">
<%--                <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>--%>
                <button type="button" class="btn btn-primary" data-dismiss="modal">??????</button>
            </div>
        </div>
    </div>
</div>

<!-- GroupAttend Module -->
<script type="text/javascript" src="/resources/js/groupAttend.js"></script>
<!-- StudyList Module -->
<script type="text/javascript" src="/resources/js/studyList.js"></script>
<script type="text/javascript" src="/resources/js/study.js"></script>
<!-- GroupRating Module -->
<script type="text/javascript" src="/resources/js/groupRating.js"></script>
<!-- GroupWish Module -->
<script type="text/javascript" src="/resources/js/groupWish.js"></script>




<!-- ?????? ????????? -->
<script type="text/javascript">
    $(document).ready(function() {

        <!-- ?????? ?????? ??? ?????? ???-->
        let result = '<c:out value="${result}"/>';

        console.log("result>>>" + result);

        checkModal(result);

        history.replaceState({}, null, null);


        function checkModal(result) {
            if(result === '' || history.state) {
                return;
            }

            if("success" === result) {
                $(".studyModal").html("????????? ??????????????? ?????????????????????.");
            }
            if("fail" === result) {
                $(".studyModal").html("????????? ???????????? ??? ????????????.");
            }
            if("error" === result) {
                $(".studyModal").html("?????? ????????? ?????????????????????.");
            }

            $("#studyModal").modal("show");
        }
    });
</script>

<script>
    $(document).ready(function() {
        let grpSnValue = '<c:out value="${group.sn}"/>';

        // ???????????? ????????? ?????????
        showStudyList(1);

        // ???????????? ????????? ?????????
        showPastStudyList(1);

        function showPastStudyList(page) {
            studyListService.getPastList({grpSn:grpSnValue, page: page || 1}, function(count, list) {

                console.log("past study count : " + count);

                let str = "";

                if(list == null || list.length == 0) {
                    $('.pastStudyList').html("");
                    return;
                }

                for(let i = 0, len = list.length || 0; i < len; i++) {

                    str += "<div class='col-md-4 mb-5'>";
                    str += "<div class='card h-100' onclick=location.href='/study/get?userId=${pinfo.username}&pageNum=${cri.pageNum}&amount=${cri.amount}&sn=" + list[i].sn + "';>";
                    str += "<div class='card-body'>";

                    str += "<h2 class='card-title'>" + list[i].name + "</h2>";


                    if(list[i].onOff === 'STOF01') str += "<p class='card-text'><i class='fas fa-video'></i> ????????? ??????</p>";
                    if(list[i].onOff === 'STOF02') str += "<p class='card-text'><i class='fas fa-map-marker-alt'></i> ???????????? ??????</p>";

                    <c:if test="list[i].expense == null">str += "<p class='card-text'></p>"; </c:if>
                    <c:if test="list[i].expense != null">str += "<p class='card-text'><i class='fas fa-won-sign'></i> " + list[i].expense + "</p>"; </c:if>

                    if(list[i].attendants >= list[i].capacity) str += "<p class='card-text'>?????? ??????</p>";
                    else str += "<p class='card-text'><i class='fas fa-users'></i> ???????????? " + list[i].attendants + "??? / ???????????? " +  list[i].capacity + "???</p>";
                    <%--str += "<a href='/study/get?userId=${pinfo.username}&pageNum=${cri.pageNum}&amount=${cri.amount}&sn=" + list[i].sn + "' class='move btn btn-primary btn-sm'>?????????</a>";--%>
                    str += "</div>";
                    str += "<div class='card-footer'>";

                    if(list[i].endDate.substring(0, 10) !== list[i].startDate.substring(0, 10)) str += "<p class='card-text blue-text'><i class='fas fa-calendar-alt'></i> " + list[i].startDate.substring(0,10) + "~" + list[i].endDate.substring(0,10) + "</p>";
                    else str += "<p class='card-text blue-text'><i class='fas fa-calendar-alt'></i> " + list[i].startDate.substring(0,10) + "</p>"
                    str += "<p class='card-text blue-text'><i class='fas fa-clock'></i>&nbsp;" + list[i].startTime.substring(0,5) + "~" + list[i].endTime.substring(0,5) + "</p>";

                    str += "</div>";
                    str += "</div>";
                    str += "</div>";
                }

                $('.pastStudyList').html(str);

                showStudyPage(count, $('.pastStudyPageFooter'));
            })
        }


        function showStudyList(page) {
            studyListService.getList({grpSn:grpSnValue, page: page || 1}, function(count, list) {

                console.log("study count : " + count);

                let str = "";

                if(list == null || list.length == 0) {
                    $('.studyList').html("");
                    return;
                }

                for(let i = 0, len = list.length || 0; i < len; i++) {

                    str += "<div class='col-md-4 mb-5'>";
                    str += "<div class='card h-100' onclick=location.href='/study/get?userId=${pinfo.username}&pageNum=${cri.pageNum}&amount=${cri.amount}&sn=" + list[i].sn + "';>";
                    str += "<div class='card-body'>";

                    str += "<h2 class='card-title'>" + list[i].name + "</h2>";


                    if(list[i].onOff === 'STOF01') str += "<p class='card-text'><i class='fas fa-video'></i> ????????? ??????</p>";
                    if(list[i].onOff === 'STOF02') str += "<p class='card-text'><i class='fas fa-map-marker-alt'></i> ???????????? ??????</p>";

                    <c:if test="list[i].expense == null">str += "<p class='card-text'></p>"; </c:if>
                    <c:if test="list[i].expense != null">str += "<p class='card-text'><i class='fas fa-won-sign'></i> " + list[i].expense + "</p>"; </c:if>

                    if(list[i].attendants >= list[i].capacity) str += "<p class='card-text'>?????? ??????</p>";
                    else str += "<p class='card-text'><i class='fas fa-users'></i> ???????????? " + list[i].attendants + "??? / ???????????? " +  list[i].capacity + "???</p>";
                    <%--str += "<a href='/study/get?userId=${pinfo.username}&pageNum=${cri.pageNum}&amount=${cri.amount}&sn=" + list[i].sn + "' class='move btn btn-primary btn-sm'>?????????</a>";--%>
                    str += "</div>";
                    str += "<div class='card-footer'>";

                    if(list[i].endDate.substring(0, 10) !== list[i].startDate.substring(0, 10)) str += "<p class='card-text blue-text'><i class='fas fa-calendar-alt'></i> " + list[i].startDate.substring(0,10) + "~" + list[i].endDate.substring(0,10) + "</p>";
                    else str += "<p class='card-text blue-text'><i class='fas fa-calendar-alt'></i> " + list[i].startDate.substring(0,10) + "</p>"
                    str += "<p class='card-text blue-text'><i class='fas fa-clock'></i>&nbsp;" + list[i].startTime.substring(0,5) + "~" + list[i].endTime.substring(0,5) + "</p>";

                    str += "</div>";
                    str += "</div>";
                    str += "</div>";
                }

                $('.studyList').html(str);

                showStudyPage(count, $('.studyPageFooter'));
            })
        }

        <!-- ?????? ????????? ?????? -->
        let studyPageNum = 1;
        // let studyPageFooter = $('.studyPageFooter');

        function showStudyPage(studyCount, pageFooter) {

            let endNum = Math.ceil(studyPageNum / 10.0) * 10;
            let startNum = endNum - 9;

            let prev = startNum != 1;
            let next = false;

            if (endNum * 3 >= studyCount) {
                endNum = Math.ceil(studyCount / 3.0);
            }

            if(endNum * 10 < studyCount) {
                next = true;
            }

            console.log("studyCount = " + studyCount);
            console.log("startNum = " + startNum);
            console.log("endNum = " + endNum);
            console.log("prev = " + prev);
            console.log("next = " + next);

            let str = "<ul class ='pagination pagination-sm'>";

            if(prev) {
                str += "<li id='study-item' class = 'page-item'><a id='study-link' class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
            }

            for(let i = startNum; i <= endNum; i++) {
                console.log("i=" + i);
                let active = studyPageNum == i ? "active" : "";

                str += "<li id='study-item' class = 'page-item " + active +" '><a id ='study-link' class='page-link' href='" + i + "'>" + i + "</a></li>";
            }

            if(next) {
                str += "<li id = 'study-item' class = 'page-item'><a id = 'study-link' class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
            }

            str += "</ul></div>";

            console.log(str);

            pageFooter.html(str);
        }

        $('.studyPageFooter').on("click", "li[id='study-item'] a[id='study-link']", function(e) {
            e.preventDefault();

            console.log("study page click");

            let targetPageNum = $(this).attr("href");

            console.log("targetPageNum: " + targetPageNum);

            studyPageNum = targetPageNum;

            showStudyList(studyPageNum);

        })

        $('.pastStudyPageFooter').on("click", "li[id='study-item'] a[id='study-link']", function(e) {
            e.preventDefault();

            console.log("study page click");

            let targetPageNum = $(this).attr("href");

            console.log("targetPageNum: " + targetPageNum);

            studyPageNum = targetPageNum;

            showPastStudyList(studyPageNum);

        })

        // studyPageFooter.on("click", "li a", function(e) {
        //     e.preventDefault();
        //
        //     console.log("study page click");
        //
        //     let targetPageNum = $(this).attr("href");
        //
        //     console.log("targetPageNum: " + targetPageNum);
        //
        //     studyPageNum = targetPageNum;
        //
        //     showStudyList(studyPageNum);
        // })
    })
</script>
<script type="text/javascript">
    $(document).ready(function() {

        <!-- ?????? ?????? ??? ?????? ???-->
        let result = '<c:out value="${result}"/>';

        console.log("?????? ?????? result = " + result);

        checkModal(result);

        history.replaceState({}, null, null);


        function checkModal(result) {

            if(result === '' || history.state) {
                return;
            }

            if("success" === result) {
                $(".studyModalBody").html("????????? ??????????????? ?????????????????????.");
            }
            if("error" === result) {
                $(".studyModalBody").html("?????? ????????? ?????????????????????.");
            }

            $("#studyModal").modal("show");
        }
    });
</script>






<!-- ?????? ?????? ?????? -->
<script>
    $(document).ready(function() {

        let grpSnValue = '<c:out value="${group.sn}"/>';
        let ratingUL = $('.rating');

        showList(1);

        function showList(page) {
            groupRatingService.getList({grpSn:grpSnValue, page: page||1}, function(ratingCnt, list) {

                console.log("ratingCnt : " + ratingCnt);
                console.log("list : " + list);
                console.log(list);

                if(page === -1) {
                    pageNum = 1;
                    showList(1);
                    return;
                }

                let str = "";
                if(list == null) {
                    ratingUL.html("");
                    return;
                }
                for(let i=0, len=list.length || 0; i<len; i++) {
                    str += "<li data-sn='"+list[i].sn+"'>";
                    str += "<div class='group-rating-content'><div class='header'><strong>"+list[i].userName+"</strong>";
                    str += "<small> "+list[i].regDate+"</small></div>";
                    str += "<p class='ratingPlace2' id='stars"+list[i].sn+"' data-rating='"+list[i].rating+"'></p>";
                    console.log(list[i]);
                    str += "<p>" + list[i].review + "</p></div></li>";
                }

                ratingUL.html(str);

                //???????????? ?????????
                let list2 = $('.ratingPlace2');
                for (let i = 0; i < list2.length; i++) {
                    console.log($(list2[i]));
                    $(list2[i]).html(star($(list2[i]).data("rating")) + '<b>' + $(list2[i]).data("rating") + ' </b>');
                }

                showRatingPage(ratingCnt);
            })
        }

        let modal = $("#groupModal");
        let modalInputUserId = modal.find("input[name='userId']");
        let modalInputRating = modal.find("input[name='rating']");
        let modalInputReview = modal.find("input[name='review']");
        // let modalInputStdSn = modal.find("input[name='stdSn']");
        let modalInputStdSn = $('#stdSn');
        let modalInputGrpSn = modal.find("input[name='grpSn']");

        let modalModBtn = $('#modalModBtn');
        let modalRemoveBtn = $('#modalRemoveBtn');
        let modalRegisterBtn = $('#modalRegisterBtn');

        let userId = null;
        <sec:authorize access="isAuthenticated()">
            userId = "${pinfo.username}";
        </sec:authorize>

        let csrfHeaderName = "${_csrf.headerName}";
        let csrfTokenValue = "${_csrf.token}";

        // ajax spring security header
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        });

        $('#addRatingBtn').on("click", function(e) {
            modal.find("input").val("");
            modal.find("input[name='userId']").val(userId);
            modal.find("input[name='userId']").attr("readonly", true);
            modal.find("input[name='stdSn']").attr("readonly", false);
            modal.find("button[id != 'modalCloseBtn']").hide();

            $('#stdSnForm').removeAttr("hidden");
            $('#modifyStdSnForm').attr("hidden", "true");

            modalRegisterBtn.show();

            // ???????????? ????????? ?????? ???????????? ?????? ????????? ?????? ????????? ????????????
            studyService.getNoRatingStudies({grpSn : ${group.sn}, userId : "${pinfo.username}"}, function(result){

                // ?????? ?????? ?????????
                $('#stdSn').children('option').remove();

                for(let i = 0; i < result.length; i++) {

                    // ?????? ????????? option??? ?????? ??? ?????? data??? sn??? ?????????.
                    $('#stdSn').append('<option value="' + result[i].sn + '">' + result[i].name + '</option>');
                    
                }
            })

            $('#groupModal').modal("show");

        })

        modalRegisterBtn.on("click", function(e) {

            if(!ratingValidation()){
                console.dir(e);
                e.preventDefault();
                return;
            }

            let groupRating = {
                grpSn: grpSnValue,
                stdSn: modalInputStdSn.val(),
                userId: modalInputUserId.val(),
                rating: modalInputRating.val(),
                review: modalInputReview.val()
            }

            groupRatingService.add(groupRating, function(result) {
                alert(result);
                modal.find("input").val("");
                $("#groupModal").modal("hide");

                showList(-1);
            })
        })

        // ?????? ?????????
        $(".rating").on("click", "li", function(e) {

            let sn = $(this).data("sn");

            console.log(">>>>>" + sn);

            groupRatingService.get(sn, function(groupRating) {
                modalInputReview.val(groupRating.review);
                modalInputRating.val(groupRating.rating);
                // modalInputStdSn.val(groupRating.stdSn);

                studyService.get(groupRating.stdSn, function(result){
                    console.log("?????? ?????? ???????????? ?????? name= " + result.name);
                    console.log("?????? ?????? ???????????? ?????? sn = " + result.sn);

                    $('#stdSnForm').attr("hidden", true);
                    $('#modifyStdSnForm').removeAttr("hidden");
                    $('#modifyStdSn').val(result.name);
                    $('#modifyStdSn').data('sn', result.sn);
                    $('#modifyStdSn').attr("readonly", true);
                })

                modalInputUserId.val(groupRating.userId);
                modalInputUserId.attr("readonly", true);
                modalInputGrpSn.val(groupRating.grpSn);
                modal.data("sn", groupRating.sn);

                modal.find("button[id !='modalCloseBtn']").hide();
                modalModBtn.show();
                modalRemoveBtn.show();

                $("#groupModal").modal("show");
            })
        })

        modalModBtn.on("click", function(e) {

            let originalUserId = modalInputUserId.val();

            let groupRating = {sn:modal.data("sn"), userId: originalUserId, rating: modalInputRating.val(),
                                review: modalInputReview.val(), stdSn: $('#modifyStdSn').data('sn'), grpSn: modalInputGrpSn.val()};

            if(!userId) {
                alert("????????? ??? ????????? ???????????????.");
                modal.modal("hide");
                return;
            }

            console.log("original User id : " + originalUserId);

            if(userId != originalUserId) {
                alert("????????? ????????? ????????? ????????? ???????????????.");
                modal.modal("hide");
                return;
            }

            if(!ratingValidation()){
                return;
            }

            groupRatingService.update(groupRating, function(result) {
                alert(result);
                modal.modal("hide");
                showList(pageNum);
            })
        })

        modalRemoveBtn.on("click", function(result) {

            let sn = modal.data("sn");

            console.log("sn:" + sn);
            console.log("userId" + userId);

            if(!userId) {
                alert("????????? ??? ????????? ???????????????.");
                modal.modal("hide");
                return;
            }

            let originalUserId = modalInputUserId.val();

            console.log("Original userId: " + originalUserId);

            if(userId != originalUserId) {
                alert("????????? ????????? ????????? ????????? ???????????????.");
                modal.modal("hide");
                return;
            }

            groupRatingService.remove(sn, originalUserId, function(result) {
                alert(result);
                modal.modal("hide");
                showList(pageNum);
            })

        })

        let pageNum = 1;
        let groupRatingPageFooter = $('.paging-footer');

        function showRatingPage(ratingCnt) {

            let endNum = Math.ceil(pageNum / 5.0) * 5;
            let startNum = endNum - 4;

            let prev = startNum != 1;
            let next = false;

            if(endNum * 5 >= ratingCnt) {
                endNum = Math.ceil(ratingCnt / 5.0);
            }

            if(endNum * 5 < ratingCnt) {
                next = true;
            }

            let str = '<ul class="pagination pagination-sm">';

            if(prev) {
                str += "<li id='rating-item' class='page-item'><a id='rating-link' class='page-link' href='"+(startNum - 1)+"'>Previous</a></li>"
            }

            console.log("!!!!!!!!!!!!!!!!!!!!" + pageNum);
            for(let i= startNum ; i <= endNum; i++) {

                let active = pageNum == i ? "active" : "";

                str += "<li id='rating-item' class='page-item "+active+" '><a id='rating-link' class='page-link' href='"+i+"'>"+i+"</a></li>";
            }

            if(next) {
                str += "<li id='rating-item' class='page-item'><a id='rating-link' class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
            }

            str += "</ul></div>";

            console.log(str);

            groupRatingPageFooter.html(str);

        }

        groupRatingPageFooter.on("click", "li[id='rating-item'] a[id='rating-link']", function(e) {
            e.preventDefault();

            console.log("rating page click");

            let targetPageNum = $(this).attr("href");

            console.log("targetPageNum: " + targetPageNum);

            pageNum = targetPageNum;

            showList(pageNum);

        })

    })
</script>

<script type="text/javascript">
    $(document).ready(function() {

        let operForm = $('#operForm');

        $("button[data-oper='modify']").on("click", function(e) {
            operForm.attr('action', '/group/modify').submit();
        })

    })
</script>







<!-- ?????? ?????? -->
<script>
    $(document).ready(function() {
        (function() {

            let grpSn = '<c:out value="${group.sn}"/>';

            $.get("/group/getAttach", {grpSn: grpSn}, function(arr) {

            let picture = '<c:out value="${group.picture}"/>';

            str = "<img src='" + picture + "'/>";

                $(".uploadResult").html(str);
            }).fail(function() {
                $(".uploadResult").html("<img src=/resources/img/default_img.jpg>");
            });
        })();

        $(".uploadResult").on("click", "li", function(e) {
            console.log("view image");

            let liObj = $(this);

            let path = encodeURIComponent(liObj.data("path")+ "/" + liObj.data("uuid") + "_" + liObj.data("filename"));

            if(liObj.data("type")) {
                showImage(path.replace(new RegExp(/\\/g),"/"));
            } else {
                self.location = "/download?fileName=" + path
            }
        })

    })
</script>





<!-- ?????? ??? ??????
<script>
    $(document).ready(function() {
        let list = $('.ratingPlace');
        for (let i = 0; i < list.length; i++) {
            $(list[i]).html(star($(list[i]).data("rating")) + '<b>' + $(list[i]).data("rating") + ' </b>(' + $(list[i]).data("ratingcount") + '?????? ??????)');
        }
    });

    function star(rating){
        let width = 80 * (rating / 5);
        let tag = ''
            +'<span class="star_score" id="netizen_point_tab_inner">'
            +'  <span class="st_off">'
            +'      <span class="st_on" style="width:' + width + 'px;">'
            +'      </span>'
            +'  </span>'
            +'</span>';
        return tag;
    }
</script>
-->


<!-- ????????? ?????? -->
<script>
    function ratingValidation() {

        if(isNaN($('#rating').val()) || $('#rating').val() == "") {
            alert("????????? ?????? ??????????????????")
            return false;
        }else if($('#rating').val() < 0 || $('#rating').val() > 5) {
            alert("????????? 0~5????????? ?????????????????????.")
            return false;
        }

        if($("#review").val() == "") {
            alert("??????????????? ??????????????????");
            return false;
        }else if(getByte($("#review").val()) > 300) {
            alert("??????????????? 100??? ????????? ??????????????????");
            return false;
        }

        if($('#stdSnForm')[0].hidden !== true && (isNaN($('#stdSn').val()) || $('#stdSn').val() == "" || $('#stdSn').val() <= 0)) {
            alert("????????? ????????? ?????????????????? ????????? ????????? ??? ????????????.");
            return false;
        }

        if($('#stdSnForm')[0].hidden && isNaN($('#modifyStdSn').data('sn')) || $('#modifyStdSn').data('sn') == "" || $('#modifyStdSn').data('sn') <= 0) {
            alert("????????? ????????? ?????????????????? ????????? ????????? ??? ????????????.");
            return false;
        }

        return true;
    }

    function getByte(str) {
        let byte = 0;
        for (let i=0; i<str.length; ++i) {
            (str.charCodeAt(i) > 127) ? byte += 3 : byte++ ;
        }
        return byte;
    }

</script>


<!-- topnav javascript -->
<script>
    let topnav = document.getElementsByClassName("topnav")[0];
    $(".topnav").css( "padding-left", $(".container")[0].offsetLeft + 15);
    let sticky = topnav.offsetTop;

    $(document).ready(function() {
        $('.topnav').on("click", "a", function(e) {
            $(".topnav > a").removeClass('active');
            console.dir(e.target);
            $(this).attr("class", "active");
        })


    })


    $(window).resize( function() {
        $(".topnav").css( "padding-left", $(".container")[0].offsetLeft + 15);
    })

    window.onscroll = function() {
        myFunction();
    };

    function myFunction() {
        let topnav = $(".topnav")[0];
        if(window.pageYOffset >= topnav.offsetTop) {
            $(".topnav").css("background-color", "white");
            // topnav.classList.add("sticky");
        } else {
            $(".topnav").css("background-color", "#ffffff00");
            // topnav.classList.remove("sticky");
        }
    }
</script>






<!-- ?????? ??? ??????
<script>
    $(document).ready(function() {
        let grpSn = <c:out value="${group.sn}"/>
            let userId = null;
        <sec:authorize access="isAuthenticated()">
        userId = "${pinfo.username}";
        </sec:authorize>

        let groupWish = {
            grpSn : grpSn,
            userId : userId
        };

        let heartOn = $('#heartOn');
        let heartOff = $('#heartOff');

        heartOn.hide();
        heartOff.show();
        groupWishService.get(groupWish, function(result) {
            heartOn.show();
            heartOff.hide();
        })

        heartOff.on("click", function(e) {
            e.preventDefault();

            groupWishService.add(groupWish, function(result) {
                alert(result);

                heartOff.hide();
                heartOn.show();
            })
        })

        heartOn.on("click", function(e) {
            e.preventDefault();

            groupWishService.remove(groupWish, function(result) {
                alert(result);

                heartOff.show();
                heartOn.hide();
            })
        })
    })
</script>
-->


<!-- ?????? ?????? -->
<script>

    $(document).ready(function() {

        let grpSnValue = '<c:out value="${group.sn}"/>';
        let attendUL = $(".attend");

        let userId = null;
        <sec:authorize access="isAuthenticated()">
        userId = "${pinfo.username}";
        </sec:authorize>

        let attend = {
            grpSn : grpSnValue,
            userId : userId
        }

        let csrfHeaderName = "${_csrf.headerName}";
        let csrfTokenValue = "${_csrf.token}";

        // ajax spring security header
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        });

        // ???????????? ??????
        let attendBtn = $('#attendBtn');
        let withdrawBtn = $('#withdrawBtn');
        //?????? ????????? ??????
        let studyBtn = $('#studyBtn');
        //????????? ????????? ??????
        let boardBnt = $('#boardBtn');
        //?????? ?????? ??????
        let addRatingBtn = $('#addRatingBtn');

        attendBtn.show();
        withdrawBtn.hide();
        // studyBtn.hide();
        // boardBnt.hide();
        groupAttendService.get(attend, function(result) {
            console.log(result.status);
            if(result.status === 'GRUS01') {
                attendBtn.hide();
                withdrawBtn.show();
                studyBtn.show();
                boardBnt.show();
                addRatingBtn.show();

            } else {
                attendBtn.show();
                withdrawBtn.hide();
                studyBtn.hide();
                boardBnt.hide();
                addRatingBtn.hide();

            }
        })


        // ?????? ?????? ?????????
        function showList() {
            groupAttendService.getList({grpSn:grpSnValue}, function(list) {
                let str = "";
                if(list == null || list.length == 0) {
                    attendUL.html("");
                    return;
                }

                for(let i=0, len=list.length || 0; i<len; i++) {

                    str += "<li data-sn='"+list[i].sn+"'>";

                    //if(list[i].picture !== null && list[i].picture !== 'myPicture.jpeg') {
                        //str += '<div><div class="header"><img src="' + '/display?fileName=' + list[i].picture.replace('s_', '') + '" alt="Avatar" class="avatar">';
                    //}else {
                        str += '<div><div class="header"><img src="/resources/img/profileegg2.png" alt="Avatar" class="avatar">';
                    //}

                    // str += "<div><div class='header'><img src='../../../resources/img/img_avatar2.png' alt='Avatar' class='avatar'>";

                    str += "<span><b>"+list[i].name+"</b></span>\t";
                    str += "<span style='color:gray'>"+list[i].grpRole+"</span>";

                    // ????????????????????????, ?????????????????? ????????? ???????????? ?????????

                    <%--
                    if("${pinfo.username}" !== "" && list[i].userId !== "${pinfo.username}") {
                        str += '<div style="float:right">';
                        str += '<a href="http://' + window.location.host + '/chat/register?userId=' + list[i].userId + '">';
                        str += '<img src="../../../resources/img/chat.png" class="listChatBtn">';
                        str += '</a>';
                        str += '</div>';
                    }
                    str += "</div></div></li>"; --%>

                }

                attendUL.html(str);

                //showRatingPage(ratingCnt);
            })
        }

        showAndHide();
        function showAndHide() {
            isAttend().then(function (result) {
                if(result){
                    studyBtn.show();
                    boardBnt.show();
                    addRatingBtn.show();
                    attendBtn.hide();
                    withdrawBtn.show();
                }else {
                    studyBtn.hide();
                    boardBnt.hide();
                    addRatingBtn.hide();
                    attendBtn.show();
                    withdrawBtn.hide();
                }

                showList();
            })
        }

        attendBtn.on("click", function(e) {
            groupAttendService.get(attend, function(result) {
                if(result.status === 'GRUS03') {
                    alert("?????????????????? ???????????????. ??????????????? ???????????????.");
                    return false;
                }
            })

            groupAttendService.add(attend, function(result) {
                alert("????????? ??????????????????.");
                showAndHide();


            })
        })

        withdrawBtn.on("click", function(e) {
            groupAttendService.withdraw(attend, function(result) {
                alert("??????????????? ???????????? ?????????????????????.");
                showAndHide();
            })
        })
        isAttend();
        function isAttend(){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url : "/group/isAttend",
                    data : {
                        sn : ${group.sn},
                        id : "${pinfo.username}"
                    }
                }).done(function (result) {
                    resolve(result);
                })
            })
        }
    })
</script>

<script>
    $(document).ready(function (){

    })

</script>


<%@include file="../includes/footer.jsp" %>
