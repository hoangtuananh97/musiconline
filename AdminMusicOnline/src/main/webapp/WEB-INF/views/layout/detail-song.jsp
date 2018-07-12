<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sufee Admin -  Admin </title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/themify-icons.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/flag-icon.min.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/cs-skin-elastic.css"/> ">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="<c:url value="/resources/scss/style.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/customerCss.css"/> ">
    <link href="<c:url value="/resources/css/lib/vector-map/jqvmap.min.css"/> " rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
	<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<tiles:insertAttribute name="menu" />
	<br/>
	<div id="right-panel" class="right-panel">
		
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="body_detail_song" />
	</div>
	<br/>
	<br/>
	
	
	
	 <script src="<c:url value="/resources/js/vendor/jquery-2.1.4.min.js"/> "></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="<c:url value="/resources/js/plugins.js"/> "></script>
    <script src="<c:url value="/resources/js/main.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/js/hienthi.js"/> "></script>
    <script src="<c:url value="/resources/js/lib/chart-js/Chart.bundle.js"/> "></script>
    <script src="<c:url value="/resources/js/dashboard.js"/> "></script>
<%--     <script src="<c:url value="/resources/js/widgets.js"/> "></script>
    <script src="<c:url value="/resources/js/lib/vector-map/jquery.vmap.js"/> "></script>
    <script src="<c:url value="/resources/js/lib/vector-map/jquery.vmap.min.js"/> "></script>
    <script src="<c:url value="/resources/js/lib/vector-map/jquery.vmap.sampledata.js"/> "></script>
    <script src="<c:url value="/resources/js/lib/vector-map/country/jquery.vmap.world.js"/> "></script> --%>
    <script src="<c:url value="/resources/js/lib/chart-js/chartjs-init.js"/> "></script>

    <script src="https://code.jquery.com/jquery-1.8.0.min.js"></script>
     <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
     <script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>
    <!-- Chart -->
    <script type="text/javascript">
        (function($) {

            var ctx = document.getElementById('myChart').getContext('2d');
            var chart = new Chart(ctx, {
                // The type of chart we want to create
                type: 'line',

                // The data for our dataset
                data: {
                    labels: ["January", "February", "March", "April", "May", "June", "July"],
                    datasets: [{
                        label: "My First dataset",
                        backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: 'rgb(255, 99, 132)',
                        data: [0, 10, 5, 2, 20, 30, 45],
                    }]
                },

                // Configuration options go here
                options: {}
            });
        })(jQuery);
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#table_user').DataTable();
            $('#table_song').DataTable();
            $('#table_arists').DataTable();
            $('#table_type').DataTable();
            $('#table_areas').DataTable();
            $('#table_song_of_user').DataTable();
            $('#table_admin').DataTable();
 
});

    </script>
</body>
</html>