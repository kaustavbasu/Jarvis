<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,700">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="bootstrap.css" rel="stylesheet">
<link rel="icon" type="image/png" href="images/logo.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.js"></script>
<script
	src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-1.3.2.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script
	src="https://rawgithub.com/eligrey/FileSaver.js/master/FileSaver.js"
	type="text/javascript"></script>
<script src="highcharts-ng.js"></script>
<script src="scripts.js" /></script>
<script src="myApp.js" /></script>
<script src="myCtrl.js" /></script>
<script>
	$(document).ready(
			function() {
				$("#header").load("header.html");

				jQuery('.tabs .tab-links a').on(
						'click',
						function(e) {
							var currentAttrValue = jQuery(this).attr('href');

							// Show/Hide Tabs
							jQuery('.tabs ' + currentAttrValue).show()
									.siblings().hide();

							// Change/remove current tab to active
							jQuery(this).parent('li').addClass('active')
									.siblings().removeClass('active');

							e.preventDefault();
						});

			});
</script>
<title>Ad Verification Report</title>
</head>
<body>
	<div id="header"></div>
	<div id="blank"></div>
	<span class="pageHeading">AD VERIFICATION REPORT</span>
	<div id="narrowblank"></div>
	<div id="mainDiv" ng-app="adqualityApp" ng-controller="adqualityCtrl">
		<div id="spinner" ng-hide="showData">
			<img class="spinningwheel" src="images/spinningwheel.gif" />
		</div>
		<div ng-show="showData">

			<div>
				<highchart id="theoremChart" config="theoremChart"></highchart>
			</div>
			<br>
			<div>
				<highchart id="theoremChart2" config="theoremChart2"></highchart>
			</div>
			<br>
			<br>

			<div
				style="border: 2px solid grey; padding: 1px 10px 1px 2px; width: 25%;">
				<i class="fa fa-search"></i> <input type="text" name="filter"
					ng-model="filter.bidder"
					style="border: 0px solid #000000; width: 300px; height: 20px; font-size: 15px;"
					placeholder="Search bidder...">
			</div>
			<br>
			<table class="dataTable" style="width: 100%;"
				ng-init="predicate = 'bidder'; reverse = false;">
				<tr class="headerRow">
					<th><a href="#" ng-click="order('bidder')">Bidder</a><span
						class="sortorder" ng-show="predicate === 'bidder'"
						ng-class="{reverse:reverse}"></span></th>
					<th><a href="#" ng-click="order('verified')">Verified
							Count</a><span class="sortorder" ng-show="predicate === 'verified'"
						ng-class="{reverse:reverse}"></span></th>
					<th><a href="#" ng-click="order('verifiedp')">Verified %</a><span
						class="sortorder" ng-show="predicate === 'verifiedp'"
						ng-class="{reverse:reverse}"></span></th>
					<th><a href="#" ng-click="order('unverified')">Unverifiable
							Count</a><span class="sortorder" ng-show="predicate === 'unverified'"
						ng-class="{reverse:reverse}"></span></th>
					<th><a href="#" ng-click="order('unverifiedp')">Unverifiable
							%</a><span class="sortorder" ng-show="predicate === 'unverifiedp'"
						ng-class="{reverse:reverse}"></span></th>
				</tr>
				<tr
					ng-repeat="bidder in data | orderBy: predicate : reverse | filter: filter"
					ng-init="bidder.verifiedp = bidder.verified/(bidder.verified+bidder.unverified); bidder.unverifiedp = bidder.unverified/(bidder.verified+bidder.unverified);">
					<td><a href="adQualityBidder.jsp?bidder={{bidder.bidder}}">{{ bidder.bidder }}</a></td>
					<td>{{ bidder.verified | number }}</td>
					<td>{{ bidder.verifiedp | percentage:2 }}</td>
					<td>{{ bidder.unverified | number }}</td>
					<td>{{ bidder.unverifiedp | percentage:2 }}</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>