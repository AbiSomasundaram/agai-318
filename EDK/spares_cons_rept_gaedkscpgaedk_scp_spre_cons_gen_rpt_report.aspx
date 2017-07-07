<%@ Page Language="C#" enableViewState="true" Inherits="VWReports.AVWReport" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="VWReports" %>

<script language=cs runat=server>
	string strSessionVariable = "";
	public void Page_Init()
	{
		IVWReport Report = null;
		VWSegment NewSeg = null;
		try
		{
			if (!IsPostBack)
			{
				strSessionVariable = "objReport_" + Guid.NewGuid().ToString();
				ReportMetaData ReportData = new ReportMetaData("spare_consumption_report", "spare_consumption_report.rpt");
				ReportData.ReportSessionId = strSessionVariable;

				ReportData.ExcludeUserPreference = true;
				NewSeg = new VWSegment("gaedkscp_spre_c_rep_hr_hsg", SegmentType.Single);
				NewSeg.AddDataItem("spr_cons_from_date", "spr_cons_from_date","spr_cons_from_date", VWDataType.Date, 11);
				NewSeg.AddDataItem("spr_cons_rep_ord", "spr_cons_rep_ord","spr_cons_rep_ord", VWDataType.Character, 40);
				NewSeg.AddDataItem("spr_cons_spare_prt", "spr_cons_spare_prt","spr_cons_spare_prt", VWDataType.Character, 40);
				NewSeg.AddDataItem("spr_cons_supplier", "spr_cons_supplier","spr_cons_supplier", VWDataType.Character, 120);
				NewSeg.AddDataItem("spr_cons_to_date", "spr_cons_to_date","spr_cons_to_date", VWDataType.Date, 11);
				NewSeg.AddDataItem("spr_cons_warehouse", "spr_cons_warehouse","spr_cons_warehouse", VWDataType.Character, 25);
				ReportData.MapSegment(NewSeg);

				Report = VWReports.Utilities.CreateReport();
				Report.Configure(ReportData);
				Session[strSessionVariable] = Report;
			}
		}
		catch (Exception e)
		{
			Response.Write (e.Message);
		}
	}

	public void Page_Load()
	{
		if (!IsPostBack)
		{
			hdnSessionVariableName.Value = strSessionVariable;
		}

		IVWReport Report = (IVWReport)Session[hdnSessionVariableName.Value];

		try
		{
			if (Report != null)
				Report.RenderReport(this);
		}
		catch (Exception e)
		{
			Response.Write (e.Message);
		}
	}

</script>

<html>
	<title>Report</title>
	<body style="margin:0px;" oncontextmenu="return false;" scroll="no" >
		<form id="reportform" method="post" runat="server">
			<input id="hdnSessionVariableName" type="hidden"  name="hdnSessionVariableName"  runat="server">
		</form>
	</body>
</html>

