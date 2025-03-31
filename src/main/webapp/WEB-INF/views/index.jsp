<%--<%@ page import="org.example.mealisallyouneed.model.vo.Anime" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>애니 커뮤니티 사이트</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--&lt;%&ndash;    <pre>결과는 <%= request.getAttribute("result") %></pre>&ndash;%&gt;--%>
<%--<section>--%>
<%--    <ul>--%>
<%--        <% for (Anime a : (List<Anime>) request.getAttribute("result")) {%>--%>
<%--        <li>--%>
<%--            <%= a.title() %> / <%= a.description() %> / <%= a.createdAt() %> / <%= a.votes() %>--%>
<%--            <form method="post" action="vote">--%>
<%--                <input type="hidden" value="<%= a.uuid() %>" name="uuid" />--%>
<%--                <button>추천</button>--%>
<%--            </form>--%>
<%--        </li>--%>
<%--        <% } %>--%>
<%--    </ul>--%>
<%--</section>--%>

<%--<section>--%>
<%--    <form action="anime" method="post">--%>
<%--        <label>이름 : <input name="title"></label>--%>
<%--        <label>설명 : <input name="description"></label>--%>
<%--        <button>등록</button>--%>
<%--    </form>--%>
<%--</section>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page import="org.example.mealisallyouneed.model.vo.Anime" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>애니 커뮤니티 사이트</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }
        .anime-list {
            list-style-type: none;
            padding: 0;
        }
        .anime-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            overflow: hidden;
        }
        .anime-title {
            background-color: #f5f5f5;
            padding: 10px 15px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .anime-title:hover {
            background-color: #eaeaea;
        }
        .anime-content {
            padding: 15px;
            display: none;
            border-top: 1px solid #eee;
        }
        .anime-content.active {
            display: block;
        }
        .votes {
            background-color: #e0f7fa;
            border-radius: 3px;
            padding: 3px 8px;
            margin-left: 10px;
        }
        .form-section {
            margin-top: 30px;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
        }
        .form-section h2 {
            margin-top: 0;
            font-size: 1.2em;
        }
        .post-form {
            display: flex;
            flex-direction: column;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
        }
        .vote-button {
            background-color: #2196F3;
        }
        button:hover {
            opacity: 0.9;
        }
        .created-at {
            color: #777;
            font-size: 0.8em;
        }
    </style>
</head>
<body>
<h1>애니 커뮤니티</h1>

<section>
    <ul class="anime-list">
        <% for (Anime a : (List<Anime>) request.getAttribute("result")) { %>
        <li class="anime-item">
            <div class="anime-title" onclick="toggleContent(this)">
                <span><%= a.title() %> <span class="votes">추천수: <%= a.votes() %></span></span>
                <span class="created-at"><%= a.createdAt() %></span>
            </div>
            <div class="anime-content">
                <p><%= a.description() %></p>
                <form method="post" action="vote">
                    <input type="hidden" value="<%= a.uuid() %>" name="uuid" />
                    <button class="vote-button">추천하기</button>
                </form>
            </div>
        </li>
        <% } %>
    </ul>
</section>

<section class="form-section">
    <h2>새 애니메이션 등록</h2>
    <form class="post-form" action="anime" method="post">
        <div class="form-group">
            <label for="title">제목:</label>
            <input id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="description">설명:</label>
            <input id="description" name="description" required>
        </div>
        <button type="submit">등록하기</button>
    </form>
</section>

<script>
    function toggleContent(element) {
        const content = element.nextElementSibling;
        content.classList.toggle('active');
    }
</script>
</body>
</html>