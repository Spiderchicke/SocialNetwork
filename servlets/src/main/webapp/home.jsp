<!DOCTYPE html>
<%@page import="util.User"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>
<html class="st-layout ls-top-navbar ls-bottom-footer show-sidebar sidebar-l2" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Social Network</title>
    <link href="static/css/vendor/all.css" rel="stylesheet">
    <link href="static/css/app/app.css" rel="stylesheet">
    <script src="static/js/vendor/all.js"></script>
    <script src="static/js/app/app.js"></script>
</head>

<body>

<!-- Wrapper required for sidebar transitions -->
<div class="st-container">

    <!-- Fixed navbar -->
    <div class="navbar navbar-main navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">

            <div class="navbar-header">
                <a href="#sidebar-menu" data-effect="st-effect-1" data-toggle="sidebar-menu"
                   class="toggle pull-left visible-xs"><i class="fa fa-bars"></i></a>
                <a class="navbar-brand navbar-brand-primary hidden-xs" href="index.html">Social Network <i
                        class="fa fa-child"></i></a>
            </div>

            <div class="collapse navbar-collapse" id="main-nav">
                <ul class="nav navbar-nav navbar-user">
                    <!-- User -->
                    <li class="dropdown">

                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="static/images/people/50/guy-5.jpg" width="50" alt="Alex" class="img-circle"/>


                            <%User user = (User) session.getAttribute("User");%>
                            <%=user.getFirstName() + " " + user.getLastName()%>

                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">
                            <li><a href="index.html">Profile</a></li>
                            <li><a href="messages.html">Messages</a></li>
                            <li><a href="login.html">Logout</a></li>
                        </ul>
                    </li>
                </ul>

                <form class="navbar-form margin-none navbar-left hidden-xs ">
                    <!-- Search -->
                    <div class="search-1">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icon-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search a friend">
                        </div>
                    </div>
                </form>

                <ul class="nav navbar-nav navbar-right hidden-xs">
                    <li class="pull-right">
                        <a href="#sidebar-chat" data-effect="st-effect-1" data-toggle="sidebar-menu">
                            <i class="fa fa-comments"></i>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>

    <!-- Sidebar component with st-effect-1 (set on the toggle button within the navbar) -->
    <div class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-visible-desktop sidebar-visible-mobile sidebar-skin-dark"
         id="sidebar-menu" data-type="collapse">
        <div data-scrollable>
            <ul class="sidebar-menu">
                <div class="sidebar-block">
                    <div class="profile">
                        <img src="static/images/people/110/guy-5.jpg" alt="people" class="img-circle">
                        <h4><%=user.getFirstName() + ", " + user.getLastName()%></h4>
                    </div>
                </div>

                <li class="active"><a href="index.html"><i class="icon-user-1"></i><span>Profile</span></a></li>
                <li><a href="photos.html"><i class="fa fa-camera-retro"></i><span>Photos</span></a></li>
                <li><a href="users.html"><i class="fa fa-group"></i><span>Friends</span></a></li>
                <li><a href="messages.html"><i class="icon-comment-fill-1"></i> <span>Messages</span></a></li>
                <li><a href="login.html"><i class="icon-unlock-fill"></i><span>Logout</span></a></li>
            </ul>
        </div>
    </div>
    <!-- Sidebar component with st-effect-1 (set on the toggle button within the navbar) -->
    <div class="sidebar sidebar-chat right sidebar-size-2 sidebar-offset-0 chat-skin-white sidebar-visible-mobile"
         id=sidebar-chat>
        <div class="split-vertical">

            <div class="chat-search">
                <input type="text" class="form-control" placeholder="Search"/>
            </div>

            <ul class="chat-filter nav nav-pills ">
                <li class="active"><a href="#" data-target="li">All</a></li>
                <li><a href="#" data-target=".online">Online</a></li>
                <li><a href="#" data-target=".offline">Offline</a></li>
            </ul>

            <div class="split-vertical-body">
                <div class="split-vertical-cell">
                    <div data-scrollable>
                        <ul class="chat-contacts">
                            <li class="online" data-user-id="1">
                                <a href="#">
                                    <div class="media">
                                        <div class="pull-left">
                                            <span class="status"></span>
                                            <img src="images/people/110/guy-6.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">

                                            <div class="contact-name">Jonathan S.</div>
                                            <small>"Free Today"</small>
                                        </div>
                                    </div>
                                </a>
                            </li>

                            <li class="online away" data-user-id="2">
                                <a href="#">

                                    <div class="media">
                                        <div class="pull-left">
                                            <span class="status"></span>
                                            <img src="images/people/110/woman-5.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">
                                            <div class="contact-name">Mary A.</div>
                                            <small>"Feeling Groovy"</small>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="online" data-user-id="3">
                                <a href="#">
                                    <div class="media">
                                        <div class="pull-left ">
                                            <span class="status"></span>
                                            <img src="images/people/110/guy-3.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">
                                            <div class="contact-name">Adrian D.</div>
                                            <small>Busy</small>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="offline" data-user-id="4">
                                <a href="#">
                                    <div class="media">
                                        <div class="pull-left">
                                            <img src="images/people/110/woman-6.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">
                                            <div class="contact-name">Michelle S.</div>
                                            <small>Offline</small>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="offline" data-user-id="5">
                                <a href="#">
                                    <div class="media">
                                        <div class="pull-left">
                                            <img src="images/people/110/woman-7.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">
                                            <div class="contact-name">Daniele A.</div>
                                            <small>Offline</small>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="online" data-user-id="6">
                                <a href="#">
                                    <div class="media">
                                        <div class="pull-left">
                                            <span class="status"></span>
                                            <img src="images/people/110/guy-4.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">
                                            <div class="contact-name">Jake F.</div>
                                            <small>Busy</small>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="online away" data-user-id="7">
                                <a href="#">
                                    <div class="media">
                                        <div class="pull-left">
                                            <span class="status"></span>
                                            <img src="images/people/110/woman-6.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">
                                            <div class="contact-name">Jane A.</div>
                                            <small>"Custom Status"</small>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="offline" data-user-id="8">
                                <a href="#">
                                    <div class="media">
                                        <div class="pull-left">
                                            <span class="status"></span>
                                            <img src="images/people/110/woman-8.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">
                                            <div class="contact-name">Sabine J.</div>
                                            <small>"Offline right now"</small>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="online away" data-user-id="9">
                                <a href="#">
                                    <div class="media">
                                        <div class="pull-left">
                                            <span class="status"></span>
                                            <img src="images/people/110/woman-9.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">
                                            <div class="contact-name">Danny B.</div>
                                            <small>Be Right Back</small>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="online" data-user-id="10">
                                <a href="#">
                                    <div class="media">
                                        <div class="pull-left">
                                            <span class="status"></span>
                                            <img src="images/people/110/woman-8.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">
                                            <div class="contact-name">Elise J.</div>
                                            <small>My Status</small>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="online" data-user-id="11">
                                <a href="#">
                                    <div class="media">
                                        <div class="pull-left">
                                            <span class="status"></span>
                                            <img src="images/people/110/guy-3.jpg" width="40" class="img-circle"/>
                                        </div>
                                        <div class="media-body">
                                            <div class="contact-name">John J.</div>
                                            <small>My Status #1</small>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script id="chat-window-template" type="text/x-handlebars-template">
        <div class="panel panel-default">

            <div class="panel-heading" data-toggle="chat-collapse" data-target="#chat-bill">
                <a href="#" class="close"><i class="fa fa-times"></i></a>
                <a href="#">
            <span class="pull-left">
                    <img src="{{ user_image }}" width="40">
                </span>
                    <span class="contact-name">{{user}}</span>
                </a>
            </div>

            <div class="panel-body" id="chat-bill">

                <div class="media">
                    <div class="media-left">
                        <img src="{{ user_image }}" width="25" class="img-circle" alt="people"/>
                    </div>
                    <div class="media-body">
                        <span class="message">Feeling Groovy?</span>
                    </div>
                </div>

                <div class="media">
                    <div class="media-left">
                        <img src="{{ user_image }}" width="25" class="img-circle" alt="people"/>
                    </div>
                    <div class="media-body">
                        <span class="message">Yep.</span>
                    </div>
                </div>

                <div class="media">
                    <div class="media-left">
                        <img src="{{ user_image }}" width="25" class="img-circle" alt="people"/>
                    </div>
                    <div class="media-body">
                        <span class="message">This chat window looks amazing.</span>
                    </div>
                </div>

                <div class="media">
                    <div class="media-left">
                        <img src="{{ user_image }}" width="25" class="img-circle" alt="people"/>
                    </div>
                    <div class="media-body">
                        <span class="message">Thanks!</span>
                    </div>
                </div>
            </div>
            <input type="text" class="form-control" placeholder="Type message..."/>
        </div>
    </script>

    <div class="chat-window-container"></div>

    <!-- sidebar effects OUTSIDE of st-pusher: -->
    <!-- st-effect-1, st-effect-2, st-effect-4, st-effect-5, st-effect-9, st-effect-10, st-effect-11, st-effect-12, st-effect-13 -->

    <!-- content push wrapper -->
    <div class="st-pusher" id="content">

        <!-- sidebar effects INSIDE of st-pusher: -->
        <!-- st-effect-3, st-effect-6, st-effect-7, st-effect-8, st-effect-14 -->

        <!-- this is the wrapper for the content -->
        <div class="st-content">

            <!-- extra div for emulating position:fixed of the menu -->
            <div class="st-content-inner">

                <div class="container-fluid">

                    <h1>Main Page</h1>

                </div>

            </div>
            <!-- /st-content-inner -->

        </div>
        <!-- /st-content -->

    </div>
    <!-- /st-pusher -->
    <!-- Footer -->
    <footer class="footer">
        <strong>Alex Shakhov</strong> &copy; Final Project 2016
    </footer>
    <!-- // Footer -->
</div>
<!-- /st-container -->
</body>
</html>