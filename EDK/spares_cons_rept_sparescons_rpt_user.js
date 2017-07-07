/**********************************************************************************************
*  Copyright @ 2000 RAMCO SYSTEMS,  All rights reserved.
*
*  File Name            : spares_cons_rept_sparescons_rpt_user.js
* JS Generated Version  : 1.0.0.43
*  Version/Revision     : EDKII 
*  Author(s) Name(s)    : EDKIICodeGenerator 
*  Date                 : 6/20/2017 11:13:52 AM
*********************************************************************************************** 
*  Modification History                                                                       * 
*********************************************************************************************** 
* Modified by       |   Comments                    |   Date                                  * 
*********************************************************************************************** 
*                   |                               |                                         * 
**********************************************************************************************/ 

if(typeof _top == "undefined")
	_top = top.AirFrame || top;

if(typeof PathPrefix == "undefined")
	PathPrefix = _top.PathPrefix;

PathPrefix += '../';

document.write("<link href='" + PathPrefix + "resources/css/xtheme-default.css' rel='StyleSheet' type='text/css'/>");
document.write("<link href='" + PathPrefix + "resources/css/vw.css' rel='StyleSheet' type='text/css'/>");
document.write("<script language='javascript' type='text/javascript' src='" + PathPrefix + "PlfControlPrototype.js'></script>");

// Initialize Method
function init()
{
	var screenMetaObj = 
	[
	['Main',[["spre_cons_gen_rpt"]],[["SECTION_[MAINSCREEN]_MAINSECTION"],["SECTION_[MAINSCREEN]_SEARCH_SECT"],["SECTION_[MAINSCREEN]_BTN_SECT"]]]
	];
	try{
		PlfApplicationForm.InitializeApplicationParameters('basrepairorder',"Repair Order",'SPARES_CONS_REPT', "Spares Consumption Report",'SPARESCONS_RPT',"Spares Consumption Report",false, true,'MAIN', 4,false, 'scp_',1);
		PlfApplicationForm.InitializeApplicationpage('Spares Consumption Report','SPARES_CONS_REPT','SPARESCONS_RPT','',true, true, true, true, screenMetaObj);
	}
	catch(e) { if (typeof plfState != 'undefined') { if (typeof plfState.DisplayErrorEx == 'function') plfState.DisplayErrorEx('OnLoad', e.message, 5, '');}}
}

function getSections(pagename)
{
	pagename = pagename.toLowerCase();
	switch (pagename)
	{
		case "[mainscreen]":
			return["SECTION_[MAINSCREEN]_MAINSECTION","SECTION_[MAINSCREEN]_SEARCH_SECT","SECTION_[MAINSCREEN]_BTN_SECT"]
			break;
	}
}

function getActivityDesc(ilboName)
{
	ilboName = ilboName.toLowerCase();
	if(ilboName != "sparescons_rpt")
		return true;
	return "Spares Consumption Report";
}

// For Returning Activity Description
function getTrailBarDesc(ilboName)
{
	ilboName = ilboName.toLowerCase();
	if(ilboName != "SPARESCONS_RPT")
		return true;
	return "Spares Consumption Report";
}

// For User Pre Process
function UserPreProcess(eventName, activityName, ilboName, tabName)
{
	eventName 	= eventName.toLowerCase();
	activityName 	= activityName.toLowerCase();
	ilboName 	= ilboName.toLowerCase();
	tabName 	= tabName.toLowerCase();
	var bReturn 	= true;
	try
	{
		if(ilboName != "sparescons_rpt")
			return true;
	}
	catch(e){}
	return bReturn;
}
// For User BeforeUserPostProcess
function BeforeUserPostProcess(eventName, activityName, ilboName, tabName)
{
	eventName 	= eventName.toLowerCase();
	activityName 	= activityName.toLowerCase();
	ilboName 	= ilboName.toLowerCase();
	tabName 	= tabName.toLowerCase();
	var bReturn 	= true;
	try
	{
		if(ilboName != "sparescons_rpt")
			return true;
	}
	catch(e){}
	return bReturn;
}

// For Task Status Message
function getUserTaskStatusMessage(eventName, activityName, ilboName, tabName)
{
	eventName 	= eventName.toLowerCase();
	activityName 	= activityName.toLowerCase();
	ilboName 	= ilboName.toLowerCase();
	tabName 	= tabName.toLowerCase();
	var bReturn 	= true;
	var sTaskStatusMsg = "";
	try
	{
		if(ilboName != "sparescons_rpt")
			return sTaskStatusMsg;
	}
	catch(e){}
	return sTaskStatusMsg;
}

// For Task Confirmation Message
function getUserTaskConfirmationMessage(eventName, activityName, ilboName, tabName)
{
	eventName 	= eventName.toLowerCase();
	activityName 	= activityName.toLowerCase();
	ilboName 	= ilboName.toLowerCase();
	tabName 	= tabName.toLowerCase();
	var bReturn 	= true;
	var sTaskConfirmMsg = "";
	try
	{
		if(ilboName != "sparescons_rpt")
			return sTaskConfirmMsg;
	}
	catch(e){}
	return sTaskConfirmMsg;
}

// For Section Control Association
function GetAssociatedControls(secname)
{
	if (!secname) return;
	switch(secname.toLowerCase())
	{
		case 'search_sect':
		     return ['spr_cons_rep_ord','spr_cons_supplier','spr_cons_spare_prt','spr_cons_warehouse','spr_cons_from_date','spr_cons_to_date'];
	}
}

// For Section Non Control Association
function GetAssociatedNonControls(secname)
{
	if (!secname) return;
	switch(secname.toLowerCase())
	{
		case 'btn_sect':
		     return ['spre_cons_gen_rpt'];
	}
}

// For User AfterUserPostProcess
function AfterUserPostProcess(eventName, activityName, ilboName, tabName)
{
	eventName 	= eventName.toLowerCase();
	activityName 	= activityName.toLowerCase();
	ilboName 	= ilboName.toLowerCase();
	tabName 	= tabName.toLowerCase();
	var bReturn 	= true;
	try
	{
		if(ilboName != "sparescons_rpt")
			return true;
	}
	catch(e){}
	return bReturn;
}

// For Context Menu - Preffered Tasks
function getContextItems(pagename, controlid, sState)
{
	pagename = pagename.toLowerCase();
	if(typeof controlid == "string")
		controlid = controlid.toLowerCase();
}

