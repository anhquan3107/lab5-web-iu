<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        h1 { color: #333; }
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin-bottom: 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }
        th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        tr:hover { background-color: #f8f9fa; }
        .action-link {
            color: #007bff;
            text-decoration: none;
            margin-right: 10px;
        }
        .delete-link { color: #dc3545; }

        .pagination {
            margin: 20px 0;
            text-align: center;
        }

        .pagination a {
            padding: 8px 12px;
            margin: 0 4px;
            border: 1px solid #ddd;
            text-decoration: none;
        }

        .pagination strong {
            padding: 8px 12px;
            margin: 0 4px;
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
        }
    </style>
</head>
<body>
    <h1>📚 Student Management System (MVC)</h1>
    
    <c:if test="${not empty param.message}">
        <div class="message success">
            ${param.message}
        </div>
    </c:if>
    
    <c:if test="${not empty param.error}">
        <div class="message error">
            ${param.error}
        </div>
    </c:if>
    
    <a href="student?action=new" class="btn">➕ Add New Student</a>

        <div class="search-box">
        <form action="student" method="get">
            <input type="hidden" name="action" value="search">

            <input type="text" name="keyword" 
                placeholder="Search by name, code, or email..."
                value="${keyword}">

            <button type="submit">🔍 Search</button>

            <!-- Show Clear button ONLY when searching -->
            <c:if test="${not empty keyword}">
                <a href="student?action=list">Clear</a>
            </c:if>
        </form>
    </div>

    <c:if test="${not empty keyword}">
        <p>Search results for: <strong>${keyword}</strong></p>
    </c:if>

    <div class="filter-box">
    <form action="student" method="get">
        <input type="hidden" name="action" value="filterSort">

        <label>Filter by Major:</label>
        <select name="major">
            <option value="">All Majors</option>

            <option value="Computer Science"
                ${selectedMajor == 'Computer Science' ? 'selected' : ''}>Computer Science</option>

            <option value="Information Technology"
                ${selectedMajor == 'Information Technology' ? 'selected' : ''}>Information Technology</option>

            <option value="Software Engineering"
                ${selectedMajor == 'Software Engineering' ? 'selected' : ''}>Software Engineering</option>

            <option value="Business Administration"
                ${selectedMajor == 'Business Administration' ? 'selected' : ''}>Business Administration</option>
        </select>

        <button type="submit">Apply Filter</button>

        <c:if test="${not empty selectedMajor}">
            <a href="student?action=list">Clear Filter</a>
        </c:if>
    </form>
    </div>
        
   <table>
    <thead>
    <tr>
        <th>
            <a href="student?action=filterSort&sortBy=id&order=${order == 'asc' ? 'desc' : 'asc'}">
                ID
            </a>
            <c:if test="${sortBy == 'id'}">
                ${order == 'asc' ? '▲' : '▼'}
            </c:if>
        </th>

        <th>
            <a href="student?action=filterSort&sortBy=student_code&order=${order == 'asc' ? 'desc' : 'asc'}">
                Student Code
            </a>
            <c:if test="${sortBy == 'student_code'}">
                ${order == 'asc' ? '▲' : '▼'}
            </c:if>
        </th>

        <th>
            <a href="student?action=filterSort&sortBy=full_name&order=${order == 'asc' ? 'desc' : 'asc'}">
                Full Name
            </a>
            <c:if test="${sortBy == 'full_name'}">
                ${order == 'asc' ? '▲' : '▼'}
            </c:if>
        </th>

        <th>
            <a href="student?action=filterSort&sortBy=email&order=${order == 'asc' ? 'desc' : 'asc'}">
                Email
            </a>
            <c:if test="${sortBy == 'email'}">
                ${order == 'asc' ? '▲' : '▼'}
            </c:if>
        </th>

        <th>
            <a href="student?action=filterSort&sortBy=major&order=${order == 'asc' ? 'desc' : 'asc'}">
                Major
            </a>
            <c:if test="${sortBy == 'major'}">
                ${order == 'asc' ? '▲' : '▼'}
            </c:if>
        </th>

        <th>Actions</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="student" items="${students}">
        <tr>
            <td>${student.id}</td>
            <td>${student.studentCode}</td>
            <td>${student.fullName}</td>
            <td>${student.email != null ? student.email : 'N/A'}</td>
            <td>${student.major != null ? student.major : 'N/A'}</td>
            <td>
                <a href="student?action=edit&id=${student.id}" class="action-link">✏️ Edit</a>
                <a href="student?action=delete&id=${student.id}" 
                   class="action-link delete-link"
                   onclick="return confirm('Are you sure?')">🗑️ Delete</a>
            </td>
        </tr>
    </c:forEach>

    <c:if test="${empty students}">
        <tr>
            <td colspan="6" style="text-align: center;">No students found.</td>
        </tr>
    </c:if>
    </tbody>
</table>
<div class="pagination">

    <!-- Previous button -->
    <c:if test="${currentPage > 1}">
        <a href="student?action=list&page=${currentPage - 1}">« Previous</a>
    </c:if>

    <!-- Page numbers -->
    <c:forEach begin="1" end="${totalPages}" var="i">
        <c:choose>
            <c:when test="${i == currentPage}">
                <strong>${i}</strong>
            </c:when>
            <c:otherwise>
                <a href="student?action=list&page=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <!-- Next button -->
    <c:if test="${currentPage < totalPages}">
        <a href="student?action=list&page=${currentPage + 1}">Next »</a>
    </c:if>
</div>

<p>Showing page ${currentPage} of ${totalPages}</p>

</body>
</html>
