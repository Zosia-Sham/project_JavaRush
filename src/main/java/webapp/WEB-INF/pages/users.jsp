<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Users Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<hl>User List</hl>

<c:if test="${!empty listUsers}">
  <table class="tg">
    <tr>
      <th width="80">ID</th>
      <th width="120">name</th>
      <th width="120">age</th>
      <th width="120">isAdmin</th>
      <th width="120">createdDate</th>
      <th width="60">Edit</th>
      <th width="60">Delete</th>
    </tr>
    <c:forEach items="${listUsers}" var="user">
    <tr>
      <td>${user.id}</td>
      <td><a href="/userdata/${user.id}" target"_blank">${user.name}</a></td>
      <td>${user.age}</td>
      <td>${user.isAdmin}</td>
      <td>${user.createdDate}</td>
      <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
      <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
    </tr>
    </c:forEach>
  </table>
</c:if>

<hl>Add a User</hl>

<c:url var="addAction" value="/users/add"/>

<form:form action="${addAction}" commandName="user">
    <table>
        <c:if test="${!empty user.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="isAdmin">
                    <spring:message text="isAdmin"/>
                </form:label>
            </td>
            <td>
                <form:input path="isAdmin"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Edit User"/>"/>
                </c:if>
                <c:if test="${empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Add User"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

<hl>Search user by id</hl>

<c:url var="addAction" value="/userdata/${user.id}"/>
<form:form action="${addAction}" commandName="user">
<table>
<tr>
            <td>
                <form:label path="id">
                    <spring:message text="id"/>
                </form:label>
            </td>
            <td>
                <form:input path="id"/>
            </td>
</tr>

<tr>
            <td colspan="2">
                    <input type="submit"
                           value="<spring:message text="Search User"/>"/>
            </td>
        </tr>
</table>

</form:form>

</body>
</html>
