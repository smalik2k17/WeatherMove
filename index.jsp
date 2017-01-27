<%-- 
    Document   : index.jsp
    Created on : Apr 9, 2015, 12:53:27 PM
    Author     : Jeff
--%>
<%@page import= "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            html, body, #map-canvas{
                height: 90%;
                margin: 0px;
                padding: 0px;
            }
            #panel{
               position: relative;
               top: 5px;
               left: 50%;
               margin-left: -180px;
               z-index: 5;
               background-color: #fff;
               padding: 5px;
               border: 1px solid #999;
            }
        </style>       
    </head>
    <body>
        <h1>Jeff and Shai's Final Project</h1>
        Our Goal: To help a person find the best location to live based on rainfall averages in various cities in Texas
        <h1>Heat Map</h1>
        <h1>Key</h1>
        Cluster 1: Least rainfall 34 inches a year (lightest color on the graph)<br>
        Cluster 2: Below average 39 inches a year<br>
        Cluster 3: Average rain 45 inches a year<br>
        Cluster 4: Above average rain 51 inches a year<br>
        Cluster 5: Most rainfall 58+ inches a year (Darkest Color)<br>
        <a href="cluster.jsp">View Clusters</a>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=visualization"></script>
        <script>
            var map, pointarray, heatmap;
            var heatMapData = [
                <%
                    ResultSet rs = db.Map.GetMapData();
                    while(rs.next())
                    {
                        out.print("{location: new google.maps.LatLng(");
                        out.print(rs.getString(2));
                        out.print(",");
                        out.print(rs.getString(1));
                        out.print("), weight: ");
                        out.print(rs.getString(3));
                        out.print("0");
                        if (rs.isLast())
                        {
                            out.println("}");
                        }
                        else
                        {
                            out.print("},");
                            out.print("\n");
                        }
                    }
                    %>
            ];
            function initialize()
            {
                var austin = new google.maps.LatLng(30.25,-97.75);
                var mapOptions = {
                    zoom: 13,
                    center: austin,
                    mapTypeId: google.maps.MapTypeId.SATELLITE
                };
                map = new google.maps.Map(document.getElementById('map-canvas')
                ,mapOptions);
                heatmap = new google.maps.visualization.HeatmapLayer({
                    data: heatMapData
                });
                heatmap.setMap(map);
                heatmap.set('radius',heatmap.get('radius') ? null : 20);
            }
            function toggleHeatMap()
            {
                heatmap.setMap(heatmap.getMap() ? null: map);
            }
            function changeRadius()
            {
                heatmap.set('radius',heatmap.get('radius') ? null : 50);
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
        <div id="panel">
            <button onclick="toggleHeatMap()">Toggle Heatmap</button>
            <button onclick="changeRadius()">Change radius</button>
        </div>
        <div id="map-canvas"></div>
        
    </body>
</html>
