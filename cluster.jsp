<%-- 
    Document   : cluster.jsp
    Created on : Apr 9, 2015, 9:42:06 PM
    Author     : Jeff
--%>
<%@page import= "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Clusters</h1>
        Cluster Definition: <br>
        Cluster 1: Least rainfall 34 inches a year (lightest color on the graph)<br>
        Cluster 2: Below average 39 inches a year<br>
        Cluster 3: Average rain 45 inches a year<br>
        Cluster 4: Above average rain 51 inches a year<br>
        Cluster 5: Most rainfall 58+ inches a year (Darkest Color)<br>  
        <form>
            <p>Select Cluster: </p><select id="cluster_dropdown" name = "cluster_dropdown" size="10"></select>
            <input type="submit" value="Submit" name="Submit">
        </form>
        <script>
            buildCluster = function()
            {
                var sel = document.getElementById("cluster_dropdown");
                sel.options.lenght = 0;
                sel.options[0] = new Option("1");
                sel.options[1] = new Option("2");
                sel.options[2] = new Option("3");
                sel.options[3] = new Option("4");
                sel.options[4] = new Option("5");
            }
            buildCluster();
        </script>
        <a href="index.jsp">Go to Cluster Map</a>
        <h1>Clusters</h1>
        <form>
            <table border="1" cellpadding="3">
                <tr>  
                    <th>City</th>
                    <th>Average Rainfall</th>
                    <th>Winter Rainfall</th>
                    <th>Spring Rainfall</th>
                    <th>Summer Rainfall</th>
                    <th>Fall Rainfall</th>
                    <th>Cluster</th>
                </tr>
                <%
                    if (request.getParameter("Submit") != null)
                    {
                        String cluster = request.getParameter("cluster_dropdown");
                        ResultSet rs = db.Map.GetCluster(cluster);
                        while (rs.next())
                        {
                            out.println("<tr>");
                            out.print("<th>");
                            out.print(rs.getString(1));
                            out.println("</th>");
                            out.print("<th>");
                            out.print(rs.getString(2));
                            out.println("</th>");
                            out.print("<th>");
                            out.print(rs.getString(3));
                            out.println("</th>");
                            out.print("<th>");
                            out.print(rs.getString(4));
                            out.println("</th>");
                            out.print("<th>");
                            out.print(rs.getString(5));
                            out.println("</th>");
                            out.print("<th>");
                            out.print(rs.getString(6));
                            out.println("</th>");
                            out.print("<th>");
                            out.print(rs.getString(7));
                            out.println("</th>");
                            out.println("</tr>");
                        }
                    }
                   %> 
            </table>
        </form>
    </body>
</html>
