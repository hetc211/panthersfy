<%--
  Document   : browse
  Created on : Oct 19, 2017, 8:55:35 PM
  Author     : Weichao ZHao
  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-dark-grey.css">
<script src="${cp}/resources/js/admin.js"></script>

<!--
  <div class="w3-bar w3-black">
  <button class="w3-bar-item w3-button" onclick="openCity('London')">London</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Paris')">Paris</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Tokyo')">Tokyo</button>
  </div> -->
<nav class="navbar navbar-expand-md bg-dark navbar-dark"
  id="bootstrap-overrides-navbar">
  <ul class="navbar-nav mr-auto tab" id="navbar-ul">
    <li class="nav-item">
      <a class="nav-link" href="javascript:displayContent('basicUsersTableDiv')">BASIC USERS</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:displayContent('premiumUsersTableDiv')">PREMIUM USERS</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:displayContent('artistsTableDiv')">ARTISTS</a>
    </li>
    <li class="nav-item">
      <a class="nav-link tablinks" href="javascript:displayContent('songsPendingTableDiv')">PENDING SONGS </a>
    </li>
    <li class="nav-item">
      <a class="nav-link tablinks" href="javascript:displayContent('songsApprovedTableDiv')">APPROVED SONGS </a>
    </li>
    <li class="nav-item">
      <a class="nav-link tablinks" href="javascript:displayContent('albumsTableDiv')">ALBUMS</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:displayContent('playlistsTableDiv')">PLAYLISTS</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:displayContent('revenueTableDiv')">Revenue</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:displayContent('siteStatDiv')">Site Statistic</a>
    </li>
  </ul>
</nav>
<div id="siteStatDiv" class="w3-container info-table" style="color: white; display:none; font-size: 1.5em;">
</div>
<div id="basicUsersTableDiv" class="w3-container info-table">
  <h1 style="color: white;"><span id="num-of-basic-user"></span> basic users registered</h1>
  <table class="w3-table-all w3-hoverable" id = "basic-users-table">
    <thead>
      <tr class="w3-light-grey">
        <th>Email</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Membership</th>
        <th>Username</th>
        <th></th>
        <!--  edit button -->
        <th></th>
        <!--  delete button -->
        <th></th>
        <!--  ban button  -->
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<div id="premiumUsersTableDiv" class="w3-container info-table" style="display:none">
  <h1 style="color: white;"> <span id="num-of-premium-user"></span> premium users registered</h1>
  <table class="w3-table-all w3-hoverable" id = "premium-users-table">
    <thead>
      <tr class="w3-light-grey">
        <th>Email</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Membership</th>
        <th>Username</th>
        <th></th>
        <!--  edit button -->
        <th></th>
        <!--  delete button -->
        <th></th>
        <!--  ban button  -->
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<div id="artistsTableDiv" class="w3-container info-table" style="display:none">
  <h1 style="color: white;"><span id="num-of-artist"></span> artists registered</h1>
  <table class="w3-table-all w3-hoverable" id = "artist-table">
    <thead>
      <tr class="w3-light-grey">
        <th>Email</th>
        <th>Display name</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th></th> <!-- edit -->
        <th></th> <!-- delete  -->
        <th></th> <!-- royalty -->
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<div id="songsPendingTableDiv" class="w3-container info-table" style="display:none">
  <h1 style="color: white;"><span id="num-of-pending-songs"></span> songs to be approved</h1>
  <table class="w3-table-all w3-hoverable" id = "pending-songs-table">
    <thead>
      <tr class="w3-light-grey">
        <th>Song ID</th>
        <th>Song Title</th>
        <th>Artist</th>
        <th>Genre</th>
        <th>Status</th>
        <%-- <th>Created Date</th> --%>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<div id="songsApprovedTableDiv" class="w3-container info-table" style="display:none">
  <h1 style="color: white;"><span id="num-of-approved-songs"></span> songs approved</h1>
  <table class="w3-table-all w3-hoverable" id = "approved-songs-table">
    <thead>
      <tr class="w3-light-grey">
        <th>Song ID</th>
        <th>Song Title</th>
        <th>Artist</th>
        <th>Genre</th>
        <th>Status</th>
        <%-- <th>Created Date</th> --%>
        <th></th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<div id="albumsTableDiv" class="w3-container info-table" style="display:none">
  <h1 style="color: white;"><span id="num-of-album"></span> albums on our site</h1>
  <table class="w3-table-all w3-hoverable" id = "albums-table">
    <thead>
      <tr class="w3-light-grey">
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Number of Songs</th>
        <th>Number of Followers</th>
        <th>Release Date</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<div id="playlistsTableDiv" class="w3-container info-table" style="display:none">
  <h1 style="color: white;"><span id="num-of-playlist"></span> playlist(s) created</h1>
  <table class="w3-table-all w3-hoverable" id = "playlists-table">
    <thead>
      <tr class="w3-light-grey">
        <th>ID</th>
        <th>Name</th>
        <th>Owner</th>
        <th># of Songs</th>
        <th># of Followers</th>
        <th>Created Date</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<div id="revenueTableDiv" class="w3-container info-table" style="display:none">
  <h1 style="color: white; text-align: center;"> Revenue Details</h1>
  <div style="margin-top: 5%;">
    <h3 style="color: white;">Expenditure</h3>
    <table class="w3-table-all w3-hoverable" id = "royalty-table">

      <thead>
        <tr class="w3-light-grey">
          <th>Artist</th>
          <th>Royalty</th>
        </tr>
      </thead>
      <tbody>
      </tbody>
    </table>
    <button id ="show-all-rows"  class="w3-button w3-round-xxlarge w3-green"><span id="show-hide-all-text">Show All</span></button>
  </div>
  
  <div style="margin-top: 5%;">
    <h3 style="color: white;">Income</h3>
    <table class="w3-table-all w3-hoverable" id = "premium-income-table">

      <thead>
        <tr class="w3-light-grey">
          <th>Number of Premium User</th>
          <th>Income</th>
        </tr>
      </thead>
      <tbody>
      </tbody>
    </table>
  </div>
  
   <div style="margin-top: 5%;">
    <h3 style="color: white;">Net Income</h3>
    <table class="w3-table-all w3-hoverable" id = "net-income-table">
        <thead>
            <tr class="w3-light-grey">
          <th>Revenue</th>
          <th id="net-income"></th>
        </tr>
            
        </thead>
        
    </table>

  </div>
  
  
</div>
<div id="edit-user-profile-modal" class="w3-modal w3-animate-opacity">
  <div class="w3-modal-content w3-card-4" style="height:440px; overflow:scroll;">
    <header class="w3-container w3-theme-d3">
      <span onclick="document.getElementById('edit_playlist_modal').style.display='none'"
        class="w3-button w3-large w3-display-topright">&times;</span>
      <h5>Edit User Profile</h5>
    </header>
    <div class="w3-container w3-theme-d4">
      <form:form action="editPlaylistDetails" method="POST" enctype="multipart/form-data">
        <label>Name</label>
        <br>
        <input type="text" class="w3-input" name="playlist_name">
        <br>
        <div class="row" style="margin-top: 3%;">
          <div class="col-md-4" style="margin-left:2%">
            <label>Image</label>
            <div class="content">
              <img src = "https://www.fuse.tv/image/56fe73a1e05e186b2000009b/768/512/the-boxer-rebellion-ocean-by-ocean-album-cover-full-size.jpg" width="100%" height=width>
              <input class="w3-input w3-border" type="file" name="file" accept="image/*">
            </div>
          </div>
          <div class="col-md-2"></div>
          <div class="col-md-5">
            <p>Description <span class="w3-badge w3-blue">7/300</span></p>
            <textarea type="playlist_description" rows="14" cols="30"></textarea>
          </div>
        </div>
        <div style="text-align:center;margin-top: 4%;">
          <button id ="cancel_edit_button"  class="w3-button w3-round-xxlarge w3-black"> Cancel</button>
          <button type="submit" class="w3-button w3-round-xxlarge w3-green" style="margin-left: 40px;">Save</button>
        </div>
      </form:form>
    </div>
  </div>
</div>
<div id="sendRoyalModal" class="w3-modal w3-animate-opacity">
  <div class="w3-modal-content w3-card-4" style="height:250px; overflow:scroll;">
    <header class="w3-container w3-theme-d3">
      <span onclick="document.getElementById('sendRoyalModal').style.display='none'"
        class="w3-button w3-large w3-display-topright">&times;</span>
      <h5>Send Royalty Check</h5>
    </header>
    <div class="w3-container w3-theme-d4">
      <form id="sendSingleRoyaltyForm">
        <div class="w3-row w3-section">
		    <div class="w3-col" style="width:70px"><span style="font-size: 12px">Money</span></div>
		    <div class="w3-rest">
		      <input class="w3-input w3-border" type="number" id="royalty" placeholder="$ send to the artist">
		    </div>
	  	</div>

        <div style="text-align:center;margin-top: 4%;">
          <button onclick="event.preventDefault(); $('#sendRoyalModal').hide();" class="w3-button w3-block w3-section w3-blue w3-ripple">Cancel</button>
          <button type="submit" class="w3-button w3-block w3-section w3-blue w3-ripple">Send</button>
        </div>
      </form>
    </div>
  </div>
</div>
       <div id="confirmDeleteModal" class="w3-modal w3-animate-opacity">
  <div class="w3-modal-content w3-card-4" style="height:180px; overflow:scroll;">
    <header class="w3-container w3-theme-d3">
      <span onclick="document.getElementById('confirmDeleteModal').style.display='none'"
        class="w3-button w3-large w3-display-topright">&times;</span>
        <h3>Confirm Deletion</h3>
    </header>

        <div style="text-align:center;margin-top: 5%;">
          <button onclick="event.preventDefault(); $('#confirmDeleteModal').hide();" class="w3-button w3-block w3-section w3-blue w3-ripple">Cancel</button>
          <button id="confirmDeleteButton" class="w3-button w3-block w3-section w3-blue w3-ripple">Confirm</button>
        </div>
      
    </div>
  
</div>
<script>
  function displayContent(table) {
      var i;
      var x = document.getElementsByClassName("info-table");
      for (i = 0; i < x.length; i++) {
         x[i].style.display = "none";
      }
      document.getElementById(table).style.display = "block";
  }
</script>
