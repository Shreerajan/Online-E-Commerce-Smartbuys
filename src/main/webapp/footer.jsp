<%@ page language="java" %>

<%
    HttpSession sessionObj = request.getSession(false);
    boolean loggedIn =
        sessionObj != null && sessionObj.getAttribute("currentUser") != null;
    int timeout = loggedIn ? sessionObj.getMaxInactiveInterval() : 0;
%>

</div> <!-- end container -->

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<% if (loggedIn) { %>
<script>
    let remainingTime = <%= timeout %>;

    function startSessionTimer() {
        const el = document.getElementById("sessionTimer");

        const timer = setInterval(() => {
            if (remainingTime <= 0) {
                clearInterval(timer);
                alert("Session expired. Logging out.");
                window.location.href = "logout";
            } else {
                let m = Math.floor(remainingTime / 60);
                let s = remainingTime % 60;
                if (el) el.innerText = m + ":" + (s < 10 ? "0" : "") + s;
                remainingTime--;
            }
        }, 1000);
    }

    document.addEventListener("DOMContentLoaded", startSessionTimer);
</script>
<% } %>

</body>
</html>
