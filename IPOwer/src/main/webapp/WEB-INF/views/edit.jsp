<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
  <head>
    <meta charset="UTF-8" />
    <title>게시판 - 글 수정</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
  </head>
  <body>
    <header th:insert="common/header.html"></header>
    <div class="container">
      <form th:action="@{'/board/edit/' + ${post.id}}" method="post">
        <input type="hidden" name="_method" value="put" />
        <input type="hidden" name="id" th:value="${post.id}" />
        <div class="form-group row">
          <label for="inputTitle" class="col-sm-2 col-form-label"><strong>제목</strong></label>
          <div class="col-sm-10">
            <input
              type="text"
              name="title"
              class="form-control"
              id="inputTitle"
              th:value="${post.title}"
            />
          </div>
        </div>
        <div class="form-group row">
          <label for="inputAuthor" class="col-sm-2 col-form-label"><strong>작성자</strong></label>
          <div class="col-sm-10">
            <input
              type="text"
              name="author"
              class="form-control"
              id="inputAuthor"
              th:value="${post.author}"
            />
          </div>
        </div>
        <div class="form-group row">
          <label for="inputContent" class="col-sm-2 col-form-label"><strong>내용</strong></label>
          <div class="col-sm-10">
            <textarea
              type="text"
              name="content"
              class="form-control"
              id="inputContent"
              th:value="${post.content}"
            ></textarea>
          </div>
        </div>
        <div class="row">
          <div class="col-auto mr-auto"></div>
          <div class="col-auto">
            <input class="btn btn-primary" type="submit" role="button" value="수정" />
          </div>
        </div>
      </form>
    </div>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  </body>
</html>