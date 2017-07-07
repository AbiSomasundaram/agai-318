
/********************************************************************************/
/* procedure      gaedkscp_ft                                             */
/* description                                                                  */
/********************************************************************************/
/* project                                                                      */
/* version                                                                      */
/********************************************************************************/
/* referenced                                                                   */
/* tables                                                                       */
/********************************************************************************/
/* development history                                                          */
/********************************************************************************/
/* author                                                                       */
/* date           6/6/2017                                                   */
/********************************************************************************/
/* modIFication history                                                         */
/********************************************************************************/
/* modIFied by                                                                  */
/* date                                                                         */
/* description                                                                  */
/********************************************************************************/

CREATE PROCEDURE gaedkscp_ft
	@ctxt_language                	udd_ctxt_language,
	@ctxt_ouinstance              	udd_ctxt_ouinstance,
	@ctxt_role                    	udd_ctxt_role,
	@ctxt_service                 	udd_ctxt_service,
	@ctxt_user                    	udd_ctxt_user,
	@ctxt_base_component           	udd_ctxt_component,
	@ctxt_base_activity            	udd_activity_name,
	@ctxt_base_ou                  	udd_ctxt_ouinstance,
	@ctxt_base_ui                  	udd_task_name,
	@ctxt_extn_based_on            	udd_data_item_name,
	@hidden_int                    	UDD_INT,
	@spr_cons_from_date            	udd_date11,
	@spr_cons_rep_ord              	udd_documentno,
	@spr_cons_spare_prt            	udd_documentno,
	@spr_cons_supplier             	udd_desc120,
	@spr_cons_to_date              	udd_date11,
	@spr_cons_warehouse            	udd_warehouse,
	@m_errorid                    	INT OUTPUT --TO RETURN EXECUTION STATUS
AS
BEGIN

	SET NOCOUNT ON

	SET @m_errorid = 0

	SELECT @ctxt_role                    	= LTRIM(RTRIM(@ctxt_role))
	SELECT @ctxt_service                 	= LTRIM(RTRIM(@ctxt_service))
	SELECT @ctxt_user                    	= LTRIM(RTRIM(@ctxt_user))
	SELECT @ctxt_base_component           	= LTRIM(RTRIM(@ctxt_base_component))
	SELECT @ctxt_base_activity            	= LTRIM(RTRIM(@ctxt_base_activity))
	SELECT @ctxt_base_ui                  	= LTRIM(RTRIM(@ctxt_base_ui))
	SELECT @ctxt_extn_based_on            	= LTRIM(RTRIM(@ctxt_extn_based_on))
	SELECT @spr_cons_rep_ord              	= LTRIM(RTRIM(@spr_cons_rep_ord))
	SELECT @spr_cons_spare_prt            	= LTRIM(RTRIM(@spr_cons_spare_prt))
	SELECT @spr_cons_supplier             	= LTRIM(RTRIM(@spr_cons_supplier))
	SELECT @spr_cons_warehouse            	= LTRIM(RTRIM(@spr_cons_warehouse))

	--null checking
	IF @ctxt_language = -915
		SELECT @ctxt_language = null

	IF @ctxt_ouinstance = -915
		SELECT @ctxt_ouinstance = null

	IF @ctxt_role = '~#~'
		SELECT @ctxt_role = null

	IF @ctxt_service = '~#~'
		SELECT @ctxt_service = null

	IF @ctxt_user = '~#~'
		SELECT @ctxt_user = null

	IF @ctxt_base_component= '~#~'
		SELECT @ctxt_base_component = null

	IF @ctxt_base_activity= '~#~'
		SELECT @ctxt_base_activity = null

	IF @ctxt_base_ou=0
		SELECT @ctxt_base_ou = null

	IF @ctxt_base_ui= '~#~'
		SELECT @ctxt_base_ui = null

	IF @ctxt_extn_based_on= '~#~'
		SELECT @ctxt_extn_based_on = null

	IF @hidden_int=-915
		SELECT @hidden_int = null

	IF @spr_cons_from_date= '1900-01-01'
		SELECT @spr_cons_from_date = null

	IF @spr_cons_rep_ord= '~#~'
		SELECT @spr_cons_rep_ord = null

	IF @spr_cons_spare_prt= '~#~'
		SELECT @spr_cons_spare_prt = null

	IF @spr_cons_supplier= '~#~'
		SELECT @spr_cons_supplier = null

	IF @spr_cons_to_date= '1900-01-01'
		SELECT @spr_cons_to_date = null

	IF @spr_cons_warehouse= '~#~'
		SELECT @spr_cons_warehouse = null


	/*
	--Errors
	*/

	/*
	--OutputList
	SELECT 
	null	'HIDDEN_INT',
	null	'SPR_CONS_FROM_DATE',
	null	'SPR_CONS_REP_ORD',
	null	'SPR_CONS_SPARE_PRT',
	null	'SPR_CONS_SUPPLIER',
	null	'SPR_CONS_TO_DATE',
	null	'SPR_CONS_WAREHOUSE'	*/

	SELECT 
	NULL	'HIDDEN_INT',
	NULL	'SPR_CONS_FROM_DATE',
	NULL	'SPR_CONS_REP_ORD',
	NULL	'SPR_CONS_SPARE_PRT',
	NULL	'SPR_CONS_SUPPLIER',
	NULL	'SPR_CONS_TO_DATE',
	NULL	'SPR_CONS_WAREHOUSE'

	SET NOCOUNT OFF

END
