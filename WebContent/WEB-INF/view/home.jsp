
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>${pageTitle}</title>
<!-- reference our style sheet -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/semantic.min.css">
<link href='http://fonts.googleapis.com/css?family=Lato:400,700'
	rel='stylesheet' type='text/css'>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/semantic.min.js"></script>
<style type="text/css">

    .hidden.menu {
      display: none;
    }

    .masthead.segment {
      min-height: 700px;
      padding: 1em 0em;
    }
    .masthead .logo.item img {
      margin-right: 1em;
    }
    .masthead .ui.menu .ui.button {
      margin-left: 0.5em;
    }
   
    .masthead h2 {
      font-size: 1.7em;
      font-weight: normal;
    }

    .ui.vertical.stripe {
      padding: 8em 0em;
    }
    .ui.vertical.stripe h3 {
      font-size: 2em;
    }
    .ui.vertical.stripe .button + h3,
    .ui.vertical.stripe p + h3 {
      margin-top: 3em;
    }
    .ui.vertical.stripe .floated.image {
      clear: both;
    }
    .ui.vertical.stripe p {
      font-size: 1.33em;
    }
    .ui.vertical.stripe .horizontal.divider {
      margin: 3em 0em;
    }

    .quote.stripe.segment {
      padding: 0em;
    }
    .quote.stripe.segment .grid .column {
      padding-top: 5em;
      padding-bottom: 5em;
    }

    .footer.segment {
      padding: 1.5em 0em;
    }

    .secondary.pointing.menu .toc.item {
      display: none;
    }

    @media only screen and (max-width: 700px) {
      .ui.fixed.menu {
        display: none !important;
      }
      .secondary.pointing.menu .item,
      .secondary.pointing.menu .menu {
        display: none;
      }
      .secondary.pointing.menu .toc.item {
        display: block;
      }
      .masthead.segment {
        min-height: 350px;
      }
  
      .masthead h2 {
        margin-top: 0.5em;
        font-size: 1.5em;
      }
    }


  </style>


</head>


<body>




<!-- Page Contents -->
<div class="pusher">
  <div class="ui inverted vertical masthead center aligned segment">


<img src="${pageContext.request.contextPath}/resources/css/images/logo-kteo.jpg" style="width:500px;height:300px;">
    <div class="ui text container">
      <h1 class="ui inverted header">
       KTEO HUA
      </h1>
      <h2>Official Page</h2>
    <a href="${pageContext.request.contextPath}/customer/AboutUs" class="ui primary button"> Learn everything for us <i class="right arrow icon"></i></a>  
    </div>

  </div>

  <div class="ui vertical stripe segment">
    <div class="ui middle aligned stackable grid container">
       <div class="six wide left floated column">
          <img src="${pageContext.request.contextPath}/resources/css/images/check.png" >
        </div>
      </div>
      <br><br><br>
      <div class="row">
        <div class="eight wide column">
          <h3 class="ui header">Is your vehicle available for techical check? Book now!</h3>
          <p>Check this in our website and book now! Enter your license plate below to make a free vehicle enquiry. <br>Also , give a date and we'll let you know if this day is available for your reservation.</p>
          
        </div>
      
      <br><br><br>
      
      <div class="row">
        <div class="center aligned column">
          <a href="${pageContext.request.contextPath}/booking/showBookingForm" class="ui huge button">Check This Out</a>
        </div>
      </div>
    </div>
  </div>


  <div class="ui vertical stripe segment">
    <div class="ui text container">
      <h3 class="ui header">Vehicle maintenance and overhaul instructions</h3>
      <p>We have extensive experience in the development, creation, issuing and updating of maintenance and overhaul manuals.</p>

<p>We also provide a service to clients where if there is an urgent requirement we will respond quickly to create and issue technical bulletins. We maintain document control for our clients through maintaining registers and master documentation.</p>
      <a href="${pageContext.request.contextPath}/customer/MaintenanceInstructions" class="ui large button">Read More</a>
      <h4 class="ui horizontal header divider">
      </h4>
      <h3 class="ui header">Check your vehicle</h3>
      <p>It's very important for the vehicle to have a technical inspection every two years at the most. Learn important information about when your vehicle must be checked.</p>
      <a href="${pageContext.request.contextPath}/customer/checkVehicle" class="ui large button">Check</a>
    </div>
  </div>


</div>

</body>

</html>