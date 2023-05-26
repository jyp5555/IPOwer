<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css'>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js'></script>
<script>
var cnt = 1;

function file_add() {
	//$("#add_file").append("<br><input type='file' name='file'/>");
	$("#add_file").append("<br><input type='file' accept='image/*' name='file" + cnt + "'/>");
	cnt++;
}

function file_remove() {
	if (cnt > 1) {
		cnt--; // Decrement the cnt variable if there are file inputs to remove
		$("#add_file").find("input[name='file" + cnt + "']").last().remove();
		$("#add_file").find("br").last().remove(); // Remove the last line break tag
	}
}
	
		function fileDelete(index) {
			  var newsPk = "${newsPk}";

			  $.ajax({
			    url: "deleteSaveFile",
			    type: "POST",
			    data: {
			      index: index,
			      newsPk: newsPk
			    }
			  });
			}

		function removeFileDiv(index) {
			  var fileDiv = $("#file_" + index);
			  if (fileDiv.length > 0) {
			    var newsPk = "${newsPk}";

			    $.ajax({
			      url: "deleteSaveFile",
			      type: "POST",
			      data: {
			        index: index,
			        newsPk: newsPk
			      },
			      success: function(response) {
			        fileDiv.remove();
			        // Perform any other necessary actions after the file is deleted
			        // ...
			      }
			    });
			  }
			}
	
 	function updateNewsTitleButton() {
		  var newsPk = ${newsPk}; // Get the newsPk value from the JSP variable
		  var newsTitle = $("input[name='newsTitle']").val(); // Get the news_title value from the input field

		  if (newsTitle === "") {
		    alert("뉴스 제목을 입력해주세요.");
		    return false; // Prevent form submission
		  }
		  
		  $.ajax({
		    url: "updateNewsTitle", // Controller URL for updating nickname
		    type: "POST",
		    data: {
		      newsPk: newsPk,
		      newsTitle: newsTitle
		    },
            success: function(response) {
                // Show pop-up window with the modification confirmation
                console.log(response)
                //location.reload();
                alert("닉네임 수정이 완료되었습니다!");

                // Perform any other necessary actions after the modification
                // ...
            }
		});
	} 
	function validateForm() {
		  var fileInputs = $("input[type='file']");
		  var filesSelected = false;
		  var newsTitle = $("input[name='newsTitle']").val();

		  if (newsTitle === "") {
		    alert("뉴스 제목을 입력해주세요.");
		    return false; // Prevent form submission
		  }
		  
		  for (var i = 0; i < fileInputs.length; i++) {
		    if (fileInputs[i].files.length === 0) {
		      alert("파일을 추가해주시기 바랍니다.");
		      return false; // Prevent form submission
		    } else {
		      filesSelected = true;
		    }
		  }

		  if (!filesSelected) {
		    alert("파일은 하나 이상 첨부해야 합니다.");
		    return false; // Prevent form submission
		  }
		  return true; // Allow form submission
		}
</script>
<head>
<title>adminCardNewsUpdate</title>
</head>
<body>
	<h3>업데이트 페이지</h3>
	
		<div class="container">
		<h2>다중파일 업로드</h2>
		<div class="panel panel-default">
			<div class="panel-heading">스프링을 이용한 다중 파일 업로드 구현</div>
			<div class="panel-body">
				<!-- <form class="form-horizontal" action="newsUpdate" method="post"> -->
				<form class="form-horizontal" action="newsUpdate" enctype="multipart/form-data" method="post" onsubmit="return validateForm();">
					<div class="form-group">
						<label class="control-label col-sm-2" for="newsTitle">뉴스 제목:</label>
						<div class="col-sm-10">
							<!-- <input type="text" class="form-control" name="news_title" value="${news_title}" placeholder="수정할 제목을 입력하세요." style="width: 30%;"> -->
							<input type="text" class="form-control" name="newsTitle" value="${newsTitle}" style="width: 30%;">
							<!-- <input type="button" value="뉴스 제목 수정" onclick="updateNewsTitleButton()" /> -->
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">파일추가:</label>
						<div class="col-sm-10">
							<input type="button" value="파일추가" onClick="file_add()" /><br>
							<input type="button" value="파일삭제" onClick="file_remove()" /><br>
							
							<c:if test="${selectAllFilesByNewsPkSize > 0}">
								<c:forEach var="i" begin="0" end="${selectAllFilesByNewsPkSize-1}">
									<div class="col-sm-10" id="file_${i}">
										기존 파일: ${selectAllFilesByNewsPk[i].fileName}.${selectAllFilesByNewsPk[i].fileContenttype}
										<input type="button" value="등록삭제" onclick="removeFileDiv(${i})"/>
									</div>
								</c:forEach>
							</c:if>
							<div id="add_file"></div>
						</div>
					</div>
					<input type="hidden" name="newsPk" value="${newsPk}">
<!-- 					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">수정</button>
						</div>
					</div> -->
				<%-- <input type="button" value="파일수정" onclick="modifyFile(${i}, this),updateNewsTitleButton()"/> --%>
				<button type="submit" value="파일수정" onclick="updateNewsTitleButton()">수정</button>
				</form>
				<form action="newsDelete" method="POST">
					<input type="hidden" name="newsPk" value="${newsPk}">
					<input type="hidden" name="selectAllFilesBynewsPk" value="${selectAllFilesBynewsPk}">
					<button type="submit" class="form-group">삭제</button>					
				</form>
			</div>
			<div class="panel-footer">
				수정페이지JSP
			</div>
		</div>
	</div>
</body>
</html>