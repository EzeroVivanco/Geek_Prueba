<?php

//include base_url().FB+"FacebookSession.php";
//include $this->load->helper('FacebookSession.php');
//include base_url().FB + "/FacebookSession.php";
//require_once base_url('Facebook/FacebookSession.php');

include ('Facebook/FacebookSession.php');

//include 'Facebook/FacebookSession.php';

//require base_url('http://localhost//App_Bodas/Facebook/FacebookSession.php');
//use Facebook\FacebookSession;


$appId		= "669372229794817";
$appSecret	= "25610df257acf12ccb5373b87f8727f8 ";
//
$setDefaultApplication = FacebookSession::setDefaultApplication($appId, $appSecret);

//$facebook= new FacebookSession(array(
//	'appId'		=> $appIdd,
//	'secret'	=> $appSecret,
//	));


//
//// If you already have a valid access token:
//$session = new FacebookSession($appSecret);
//
//// If you're making app-level requests:
//$session = FacebookSession::newAppSession();
//
//// To validate the session:
//try {
//  $session->validate();
//} catch (FacebookRequestException $ex) {
//  // Session not valid, Graph API returned an exception with the reason.
//  echo $ex->getMessage();
//} catch (\Exception $ex) {
//  // Graph API returned info, but it may mismatch the current app or have expired.
//  echo $ex->getMessage();
//}