<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="Back.css" rel="stylesheet" type="text/css" />
<title>Main Page</title>
<script type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>

<style>
.pos
{
	position: absolute;
	top:-30px;
}
</style>
</head>




 <!-- it works the same with all jquery version from 1.x to 2.x -->
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <!-- use jssor.slider.mini.js (40KB) instead for release -->
    <!-- jssor.slider.mini.js = (jssor.js + jssor.slider.js) -->
    <script type="text/javascript" src="js/jssor.js"></script>
    <script type="text/javascript" src="js/jssor.slider.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideDuration: 800,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $ArrowNavigatorOptions: {                       //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
                },

                $ThumbnailNavigatorOptions: {
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                    $ActionMode: 1,                                 //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
                    $AutoCenter: 0,                                 //[Optional] Auto center thumbnail items in the thumbnail navigator container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 3
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange thumbnails, default value is 1
                    $SpacingX: 3,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                    $SpacingY: 3,                                   //[Optional] Vertical space between each thumbnail in pixel, default value is 0
                    $DisplayPieces: 9,                              //[Optional] Number of pieces to display, default value is 1
                    $ParkingPosition: 260,                          //[Optional] The offset position to park thumbnail
                    $Orientation: 1,                                //[Optional] Orientation to arrange thumbnails, 1 horizental, 2 vertical, default value is 1
                    $DisableDrag: false                            //[Optional] Disable drag or not, default value is false
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var bodyWidth = document.body.clientWidth;
                if (bodyWidth)
                    jssor_slider1.$ScaleWidth(Math.min(bodyWidth, 980));
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>
    <div style="position: relative; width: 100%; background-color: #003399; overflow: hidden; top:40px;">
        <div style="position: relative; left: 50%; width: 5000px; text-align: center; margin-left: -2500px;">
            <!-- Jssor Slider Begin -->
            <div id="slider1_container" style="position: relative; margin: 0 auto;
                top: 0px; left: 0px; width: 980px; height: 400px; background: url(major/main_bg.jpg) top center no-repeat;">
                <!-- Loading Screen -->
                <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                    <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block;
                        top: 0px; left: 0px; width: 100%; height: 100%;">
                    </div>
                    <div style="position: absolute; display: block; background: url(loading.gif) no-repeat center center;
                        top: 0px; left: 0px; width: 100%; height: 100%;">
                    </div>
                </div>
                <!-- Slides Container -->
                <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 980px;
                    height: 400px; overflow: hidden;">
                    <div>
                        <div style="position: absolute; width: 480px; height: 300px; top: 10px; left: 10px;
                            text-align: left; line-height: 1.8em; font-size: 12px;">
                            <br />
                            <span style="display: block; line-height: 1em; text-transform: uppercase; font-size: 52px;
                                color: #FFFFFF;">Mobiles</span>
                            <br />
                            <br />
                            <span style="display: block; line-height: 1.1em; font-size: 2.5em; color: #FFFFFF;">
                               & it's accessories 
                            </span>
                            <br />
                            <span style="display: block; line-height: 1.1em; font-size: 1.5em; color: #FFFFFF;">
                                Our services helps you to reach
                                 to the latest technologies 
                                 faster 
                            </span>
                            <br />
                            <br />
                            
                        </div>
                        <img src="major/s2.png" style="position: absolute; top: 23px; left: 480px; width: 500px; height: 300px;" />
                        <img u="thumb" src="major/s2t.jpg" />
                    </div>
                    <div>
                        <div style="position: absolute; width: 480px; height: 300px; top: 10px; left: 10px;
                            text-align: left; line-height: 1.8em; font-size: 12px;">
                            <span style="display: block; line-height: 1em; text-transform: uppercase; font-size: 52px;
                                color: #FFFFFF;">Home Accessories</span>
                            <br />
                            <br />
                            <span style="display: block; line-height: 1.1em; font-size: 2.5em; color: #FFFFFF;">
                                We provide you the
                                 best electricity saving 
                                 accessories
                            </span>
                            <br />
                            <br />
                        </div>
                        <img src="major/s3.png" style="position: absolute; top: 23px; left: 480px; width: 500px; height: 300px;" />
                        <img u="thumb" src="major/s3t.jpg" />
                    </div>
                    <div>
                        <div style="position: absolute; width: 480px; height: 300px; top: 10px; left: 10px;
                            text-align: left; line-height: 1.8em; font-size: 12px;">
                            <span style="display: block; line-height: 1em; text-transform: uppercase; font-size: 52px;
                                color: #FFFFFF;">Online shopping</span>
                            <br />
                            <span style="display: block; line-height: 1.1em; font-size: 2.5em; color: #FFFFFF;">
                               You can buy any electronic 
                               thing from your home 
                            </span>
                            <br />
                            <br />
                        </div>
                        <img src="major/s4.png" style="position: absolute; top: 23px; left: 480px; width: 500px; height: 300px;" />
                        <img u="thumb" src="major/s4t.jpg" />
                    </div>
                   
                    <div>
                        <div style="position: absolute; width: 480px; height: 300px; top: 10px; left: 10px;
                            text-align: left; line-height: 1.8em; font-size: 12px;">
                            <span style="display: block; line-height: 1em; text-transform: uppercase; font-size: 52px;
                                color: #FFFFFF;">Best Security </span>
                            <br />
                            <span style="display: block; line-height: 1.1em; font-size: 2.5em; color: #FFFFFF;">
                               We Secure your online identity,
                              so please register 
                                and buy much more here 
                            </span>
                            <br />
                            <br />
                             </div>
                        <img src="major/s6.png" style="position: absolute; top: 23px; left: 480px; width: 500px; height: 300px;" />
                        <img u="thumb" src="major/s6t.jpg" />
                    </div>
                    <div>
                        <div style="position: absolute; width: 480px; height: 300px; top: 10px; left: 10px;
                            text-align: left; line-height: 1.8em; font-size: 12px;">
                            <br />
                            <span style="display: block; line-height: 1em; text-transform: uppercase; font-size: 52px;
                                color: #FFFFFF;">Daily Offers</span>
                            <br />
                            <span style="display: block; line-height: 1.1em; font-size: 2.5em; color: #FFFFFF;">
                               We provide daily offers on 
                               products of various companies
                            </span>
                            <br />
                            <br />
                         </div>
                        <img src="major/s7.png" style="position: absolute; top: 23px; left: 480px; width: 500px; height: 300px;" />
                        <img u="thumb" src="major/s7t.jpg" />
                    </div>
                    <div>
                        <div style="position: absolute; width: 480px; height: 300px; top: 10px; left: 10px;
                            text-align: left; line-height: 1.8em; font-size: 12px;">
                            <span style="display: block; line-height: 1em; text-transform: uppercase; font-size: 52px;
                                color: #FFFFFF;">Product Services</span>
                            <br />
                            <span style="display: block; line-height: 1.1em; font-size: 2.5em; color: #FFFFFF;">
                                We provide you best products of market
                                </span>
                                <br />
                                <br />
                                 </div>
                        <img src="major/s8.png" style="position: absolute; top: 23px; left: 480px; width: 500px; height: 300px;" />
                        <img u="thumb" src="major/s8t.jpg" />
                    </div>
                </div>
                
                <!--#region Arrow Navigator Skin Begin -->
                <!-- Help: http://www.jssor.com/development/slider-with-arrow-navigator-jquery.html -->
                <style>
                    /* jssor slider arrow navigator skin 07 css */
                    /*
                    .jssora07l                  (normal)
                    .jssora07r                  (normal)
                    .jssora07l:hover            (normal mouseover)
                    .jssora07r:hover            (normal mouseover)
                    .jssora07l.jssora07ldn      (mousedown)
                    .jssora07r.jssora07rdn      (mousedown)
                    */
                    .jssora07l, .jssora07r {
                        display: block;
                        position: absolute;
                        /* size of arrow element */
                        width: 50px;
                        height: 50px;
                        cursor: pointer;
                        background: url(major/a07.png) no-repeat;
                        overflow: hidden;
                    }
                    .jssora07l { background-position: -5px -35px; }
                    .jssora07r { background-position: -65px -35px; }
                    .jssora07l:hover { background-position: -125px -35px; }
                    .jssora07r:hover { background-position: -185px -35px; }
                    .jssora07l.jssora07ldn { background-position: -245px -35px; }
                    .jssora07r.jssora07rdn { background-position: -305px -35px; }
                </style>
                <!-- Arrow Left -->
                <span u="arrowleft" class="jssora07l" style="top: 123px; left: 8px;">
                </span>
                <!-- Arrow Right -->
                <span u="arrowright" class="jssora07r" style="top: 123px; right: 8px;">
                </span>
                <!--#endregion Arrow Navigator Skin End -->
                
            <!--#region Thumbnail Navigator Skin Begin -->
            <!-- Help: http://www.jssor.com/development/slider-with-thumbnail-navigator-jquery.html -->
            <style>
                /* jssor slider thumbnail navigator skin 04 css */
                /*
                .jssort04 .p            (normal)
                .jssort04 .p:hover      (normal mouseover)
                .jssort04 .pav          (active)
                .jssort04 .pav:hover    (active mouseover)
                .jssort04 .pdn          (mousedown)
                */

                .jssort04 {
                    position: absolute;
                    /* size of thumbnail navigator container */
                    width: 600px;
                    height: 60px;
                }

                    .jssort04 .p {
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 62px;
                        height: 32px;
                    }

                    .jssort04 .t {
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        border: none;
                    }

                    .jssort04 .w, .jssort04 .pav:hover .w {
                        position: absolute;
                        width: 60px;
                        height: 30px;
                        border: #0099FF 1px solid;
                        box-sizing: content-box;
                    }

                    .jssort04 .pdn .w, .jssort04 .pav .w {
                        border-style: dashed;
                    }

                    .jssort04 .c {
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 62px;
                        height: 32px;
                        background-color: #000;
                        filter: alpha(opacity=45);
                        opacity: .45;
                        transition: opacity .6s;
                        -moz-transition: opacity .6s;
                        -webkit-transition: opacity .6s;
                        -o-transition: opacity .6s;
                    }

                    .jssort04 .p:hover .c, .jssort04 .pav .c {
                        filter: alpha(opacity=0);
                        opacity: 0;
                    }

                    .jssort04 .p:hover .c {
                        transition: none;
                        -moz-transition: none;
                        -webkit-transition: none;
                        -o-transition: none;
                    }

                    * html .jssort04 .w {
                        width /**/: 62px;
                        height /**/: 32px;
                    }
            </style>
            <!-- thumbnail navigator container -->
            <div u="thumbnavigator" class="jssort04" style="right: 0px; bottom: 0px;">
                <!-- Thumbnail Item Skin Begin -->
                <div u="slides" style="bottom: 25px; right: 30px; cursor: default;">
                    <div u="prototype" class="p">
                        <div class=w><div u="thumbnailtemplate" class="t"></div></div>
                       
                    </div>
                </div>
                <!-- Thumbnail Item Skin End -->
            </div>
            <!--#endregion Thumbnail Navigator Skin End -->
                <a style="display: none" href="http://www.jssor.com">Bootstrap Slider</a>
            </div>
            <!-- Jssor Slider End -->
        </div>
    </div>

<div id="search" >
            <form action="Search1.jsp" method="post">
              <input type="text" value="Search Here" name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
              <input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
            </form>
        </div>
    	
        	<div id="menu" class="pos" style="background-color: white;">
     			<ul>
                <li><a href="Main.jsp" class="selected home">Home</a></li>
                <li ><a href="#" class="drop">Register</a>
    			<div class="dropdown_1column ">
        		<div class="col_1">
                <ul class="simple">
                        <li><a href="RegistUser.jsp">User</a></li>
                        <li><a href="RegistEmployee.jsp">Employee</a></li>
                        <li><a href="RegistCompany.jsp">Company</a></li>
                    </ul>   
                </div>
                </div>
        		</li>
                <li><a href="Login.jsp" class="login">Login</a></li>
                <li><a href="#"  class="drop">Category</a>
                 <div class="dropdown_4columns">
        
            <div class="col_4">
                <h2>Electronics</h2>
            </div>
            
             <div class="col_1">
            
                <h3><a href="Search1.jsp?keyword=Mobiles">Mobiles</a></h3>
                <%
                Connection co=ConnectionProvider.getConnection();
                PreparedStatement pst=co.prepareStatement("select c_name from product where p_cat='Mobiles' group by c_name");
                %>
                <ul>
                <%
                ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                %>
                    <li><a href="showcomp.jsp?val=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></li>
                   <%
                }
                   %> 
                </ul>   
                 
            </div>
    
            <div class="col_1">
            
                <h3><a href="Search1.jsp?keyword=Laptops">Laptops</a></h3>
                <%
                PreparedStatement p=co.prepareStatement("select c_name from product where p_cat='Laptops' group by c_name");
                %>
                <ul>
                    <%
                ResultSet r=p.executeQuery();
                while(r.next())
                {
                %>
                    <li><a href="showcomp.jsp?val=<%=r.getString(1)%>"><%=r.getString(1) %></a></li>
                   <%
                }
                   %> 
                    
                </ul>   
                 
            </div>
    
            <div class="col_1">
            
                <h3><a href="Search1.jsp?keyword=Tablets">Tablets</a></h3>
          </div>
    
            <div class="col_1">
            
                <h3 style="color:olive;" >Other Electronic Appliances</h3>
                <ul>
                    <li><a href="Search1.jsp?keyword=LCD">LCD</a></li>
                    <li><a href="Search1.jsp?keyword=Cameras">Cameras</a></li>
                    <li><a href="Search1.jsp?keyword=Headphones">Headphones</a></li>
                    <li><a href="Search1.jsp?keyword=MobileCases&Covers">Mobile Cases & Covers</a></li>
                </ul>   
                 
            </div>
            
        </div>
                </li>
                <li class="last"><a href="#" class=" help">Help Centre</a></li>
                
                <li><a href="ShowCart.jsp"><%session=request.getSession();
                String uname=(String)session.getAttribute("uname");
                int c=0;
             PreparedStatement pppst=co.prepareStatement("select count(itemid) from cart where uname is NULL"); 
             ResultSet rrset=pppst.executeQuery();
           
             while(rrset.next())
            	 c=rrset.getInt(1);
             %><%=c%>Show Cart</a></li>
                </ul>
            </div>
        	
    	   	<div class="sidebar" style="margin-top: 40px;">
        		<div class="gadget">
         			 <h2 class="star"><span>Products</span></h2>
          			 
          			 <ul class="sb_menu">
       			     	<li><a href="Search1.jsp?keyword=Mobiles">Mobiles</a></li>
      			      	<li><a href="Search1.jsp?keyword=Home Appliances">Home Appliances</a></li>
      			      	<li><a href="Search1.jsp?keyword=Laptops">Laptops</a></li>
      			      	<li><a href="Search1.jsp?keyword=Networking">Networking</a></li>
        			  </ul>
        		</div>
        		<div class="gadget">
         			 <h2 class="star"><span>Company Name</span></h2>
         			 <%
         			 PreparedStatement ps=co.prepareStatement("select c_name from product group by c_name");
         			 
         			 %>
         			 <ul class="ex_menu">
         			 <%
         			ResultSet rst=ps.executeQuery();
                while(rst.next())
                {
                %>
                    <li><a href="showcomp.jsp?val=<%=rst.getString(1)%>"><%=rst.getString(1) %></a></li>
                   <%
                }
                   %> 
          		       	
         			 </ul>
       		   </div>
      		</div>
</body>
</html>