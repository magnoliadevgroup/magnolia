/**
 * Created with JetBrains PhpStorm.
 * User: farida
 * Date: 25.03.17
 * Time: 18:24
 * To change this template use File | Settings | File Templates.
 */

/*
$('#about').click(function(){
    $("#about").load("about.php");
});
*/

$(document).ready(function(){
    $("#navigatorDiv").load('home.php');
    $("#home").click(function(){
        $("#navigatorDiv").load('home.php');
    });
    $("#about").click(function(){
        $("#navigatorDiv").load('about.php');
    });
    $("#category").click(function(){
        $("#navigatorDiv").load('category.php');
    });
    $("#sign").click(function(){
        $("#navigatorDiv").load('sign.php');
    });
    
    $("#contact").click(function(){
        $("#navigatorDiv").load('contact.php');
    });
   /* $("#about").click(function(){
        $("#navigatorDiv").load('about3.php');
    });*/
  /*  $("#learnMore").click(function(){
        $("#navigatorDiv").load('about.php');
        })*/
});