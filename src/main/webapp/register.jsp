<%@ page language="java" %>
<%@ include file="header.jsp" %>

<%
    if (session != null && session.getAttribute("user") != null) {
        response.sendRedirect("products.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">

            <div class="card shadow-sm">
                <div class="card-body">

                    <h3 class="text-center mb-3">Create Account</h3>

                    <form action="register" method="post">

                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="name" class="form-control" placeholder="Enter your full name" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Create password" required>
                        </div>

                        <button type="submit" class="btn btn-success w-100">Register</button>
                    </form>

                    <p class="text-center mt-3">
                        Already have an account? <a href="login.jsp">Login</a>
                    </p>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
