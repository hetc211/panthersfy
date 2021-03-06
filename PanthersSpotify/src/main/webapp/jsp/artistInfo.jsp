<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Artist Page - Panthers Spotify</title>
  <link rel="stylesheet" href="${cp}/resources/css/artistInfo.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<div class="artistinfo-top" id = "release-container" >
  <div class="suggestion-container-top">
    <div class="user_image_box" style="width: 20%">
      <img src="${cp}/resources/data${selectedArtist.photoUrl}" width=100% style="border-radius: 100px;" class="img-rounded" alt="Generic placeholder thumbnail">
    </div>
    <div class="userInfoBoxes" style="width:70%">
      <div id ="userInfo" style="margin-top: 2%; margin-left:7%;">
        <h5> Artist Page </h5>
        <p style="font-size: 1.8em;" id="artist-name">
          <c:out value="${selectedArtist.userName}"></c:out>
        </p>
        
        <div>    
            <button class="w3-button w3-round-xxlarge formButton followArtistButton" style="width:auto" >
              <span id="followArtistStatus" >
                <c:choose>
                  <c:when test="${fn:contains(userFollowingArtist,selectedArtist.email)}">
                    Unfollow
                  </c:when>
                  <c:otherwise>
                    Follow
                  </c:otherwise>
                </c:choose>
              </span>
              <span id="artistEmail" style="display:none;">
                <c:out value="${selectedArtist.email}"></c:out>
              </span>
            </button>
	       </div>
		<div id="artist-followers" style="font-size: 1.5em; margin-top: 3%;">
	         <div id="artist-follower-number"  style="display: inline-block"><c:out value="${selectedArtistFollowers}"></c:out>  </div>
	         <h5 style="display: inline-block">Followers</h5>
	       </div>
      </div>
    </div>
  </div>
</div>
<div class="suggestion-container row" style="margin-top:3%;">
  <div style="width: 60%; margin: 2%;">
    <div>
    <div id="album-header" style="border-bottom: 1px solid white; margin-bottom: 2%;
                                font-size: 1.5em;">
      Albums
    </div>
    <section class="row placeholders" id="infoContainer" style="padding-left: 5%;">
		<c:if test="${not empty album_list}">
			<c:forEach var="album" items="${album_list}">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xl-3 placeholder medium-boxes">
					<div class="hover-control album-item">
						<img src="${cp}/resources/data${album.photoUrl}"
							width=100% height=width class="img-rounded info-image"
							alt="Generic placeholder thumbnail"> <span class="album-ID"
							style="display: none;">${album.aid}</span>
					</div>
					<div class="album-item medium-boxes-description">
						<h6 style="text-align: center;">
							<a href="#"><span id="album-name">${album.aname}</span></a> <span
								class="album-ID" style="display: none;">${album.aid}</span>
						</h6>
					</div>
				</div>
			</c:forEach>
		</c:if>
	  </section>
    </div>
    <div >
      <div id="album-header" style="border-bottom: 1px solid white; margin-bottom: 2%; margin-top: 5%;
                                font-size: 1.5em;">
      Related Artists
      </div>
      <section class="row placeholders" id="infoContainer" style="padding-left: 5%;">
       <c:choose>
		<c:when test="${not empty artist_list}">
			<c:forEach var="artist" items="${artist_list}">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xl-3 placeholder medium-boxes">
					<div class="hover-control artist-item">
						<img src="${cp}/resources/data${artist.photoUrl}"
							width=100% height=width class="img-rounded info-image"
							alt="Generic placeholder thumbnail" style="border-radius: 100px;"> <span class="artist-email"
							style="display: none;">${artist.email}</span>
					</div>
					<div class="artist-item medium-boxes-description">
						<h6 style="text-align: center;">
							<a href="#"><span id="album-name">${artist.userName}</span></a> <span
								class="artist-email" style="display: none;">${artist.email}</span>
						</h6>
					</div>
				</div>
			</c:forEach>
		</c:when>
		 <c:otherwise>
			No artists suggested
		</c:otherwise>
		</c:choose>
	  </section>
    </div>
  </div>
  <div style="width: 30%; margin: 2%;">
  <div id="bio-section" >
    <div id="bio-header" style="border-bottom: 1px solid white; margin-bottom: 2%;
                                font-size: 1.5em;">
      Bio
    </div>
    <div id="artist-info" style="padding: 3%;">
    </div>
  </div>
  <div style="margin-top: 7%;">
    <div id="concert-section">
    <div id="concert-header" style="border-bottom: 1px solid white; margin-bottom: 2%;
                                font-size: 1.5em;">
      Upcoming Concert Info
    </div>
    <div id="artist-concert-info" style="padding: 3%;">
 
      <div id="artist-concert-name" style="font-size:1.2em; font-weight: bolder;color:lightgreen;">Cool Concert</div>
      <div id="artist-concert-date" style="font-size:1em; font-weight: bolder;"> 2018-11-12</div>
      <div id="artist-cocnert-address" style="font-size: 1em;">Main St. New York, NY 11000</div>
    </div>
  </div>
  </div>
</div>
