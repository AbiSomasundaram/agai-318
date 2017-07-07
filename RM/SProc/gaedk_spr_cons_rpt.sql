/********************************************************************************/
/* procedure      gaedk_spr_cons_rpt                                       */
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
/* author         Abi S                                                         */
/* date           20/6/2017                                                      */
/********************************************************************************/
/* modIFication history                                                         */
/********************************************************************************/
/* modIFied by                                                                  */
/* date                                                                         */
/* description                                                                  */
/********************************************************************************/

CREATE PROCEDURE gaedk_spr_cons_rpt
	@ctxt_language                	udd_ctxt_language,
	@ctxt_ouinstance              	udd_ctxt_ouinstance,
	@ctxt_role                    	udd_ctxt_role,
	@ctxt_user                    	udd_ctxt_user,
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

	SELECT @ctxt_language                   = LTRIM(RTRIM(@ctxt_language))
	SELECT @ctxt_ouinstance                 = LTRIM(RTRIM(@ctxt_ouinstance))
	SELECT @ctxt_role                    	= LTRIM(RTRIM(@ctxt_role))
	SELECT @ctxt_user                    	= LTRIM(RTRIM(@ctxt_user))
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

	
	IF @ctxt_user = '~#~'
		SELECT @ctxt_user = null
	
	IF @spr_cons_from_date= '1900-01-01'
		SELECT @spr_cons_from_date = null

	IF @spr_cons_rep_ord= '~#~' or @spr_cons_rep_ord=''
		SELECT @spr_cons_rep_ord = null

	IF @spr_cons_spare_prt= '~#~' or @spr_cons_spare_prt =''
		SELECT @spr_cons_spare_prt = null

	IF @spr_cons_supplier= '~#~' or @spr_cons_supplier=''
		SELECT @spr_cons_supplier = null

	IF @spr_cons_to_date= '1900-01-01'
		SELECT @spr_cons_to_date = null

	IF @spr_cons_warehouse= '~#~' or @spr_cons_warehouse=''
		SELECT @spr_cons_warehouse = null


	/*
	Errors
	*/

	/*
	OutputList
	SELECT 
	null	'REP_FRM_WREHSE',
	null	'REP_PART_DESC',
	null	'REP_QUANT',
	null	'REP_REP_SHP',
	null	'REP_REPA_SHP_NO',
	null	'REP_RO_DTE',
	null	'REP_RO_NO',
	null	'REP_RO_STATS',
	null	'REP_SERI_LOT',
	null	'REP_SPARE_PART',
	null	'REP_UOM',
	null	'REP_VAL_INR'	*/

	DECLARE @guid udd_guid
	
	SELECT @guid	=	newid()
	
	INSERT INTO RO_SPARE_CONSUMPTION_TMP
	(
		ro_spare_guid_tmp			,	ro_spare_ou_tmp		     ,		ro_Spare_ro_no_tmp		,	ro_spare_rep_shop_tmp			,	ro_spare_shop_desc_tmp	,
		ro_spare_rep_ord_dte_tmp	,	ro_spare_status_tmp		 ,		ro_spare_part_no_tmp	,	ro_spare_part_desc_tmp			,	ro_spare_serial_lot_tmp	,
		ro_spare_quantity_tmp		,	ro_spare_rep_uom_tmp	 ,		ro_spare_value_tmp		,	ro_spare_from_warehouse_tmp		
	)
	SELECT
		@guid						,	@ctxt_ouinstance		 ,		ROHD_RO_NO			    ,	ROHd_Repair_Shop_No				,	NULL        		    ,
		ROHd_Created_Date			,	ROHD_RO_STATUS			 ,		RSPSD_SPARE_PART_NO	    ,	NULL							,	ROHd_RO_Serial_No	    ,
		RSPSD_SPARE_PART_QTY		,	RSPSD_SPARE_PART_UOM	 ,		NULL    			    ,	ROHd_RO_From_Wh_No										    
	FROM   REP_ROHD_REPAIR_ORDER_HDR  WITH (NOLOCK)
	JOIN   REP_RSPSD_SPARE_SHIP_DTL   WITH (NOLOCK)
	ON     ROHD_RO_NO			=	RSPSD_RO_NO
	AND    ROHD_RO_OUINSTANCE	=	RSPSD_RO_OUINSTANCE
	WHERE  ROHd_Created_Date	BETWEEN		@spr_cons_from_date AND @spr_cons_to_date	
	AND    ROHd_RO_no			LIKE	ISNULL(@spr_cons_rep_ord,'%')
	AND    RSPSD_SPARE_PART_NO	LIKE	ISNULL(@spr_cons_spare_prt,'%')
	AND    ROHd_Repair_Shop_No	LIKE	ISNULL(@spr_cons_supplier,'%')
	AND	   ROHd_RO_From_Wh_No	LIKE	ISNULL(@spr_cons_warehouse,'%')
	 
		
	------------------Updating the part desc--------------------
	UPDATE RST
	SET    ro_spare_part_desc_tmp		=	PRCRL_PART_DESC
	FROM   RO_SPARE_CONSUMPTION_TMP RST 
	JOIN   Prt_CentralRefList_Info_vw   WITH (NOLOCK)
	ON     ro_spare_part_no_tmp			=	PRCRL_PART_NO
	AND    ro_spare_ou_tmp				=	PRCRL_CREATED_OUINSTANCE	
	WHERE  ro_spare_ou_tmp				=	@ctxt_ouinstance  
	AND    ro_spare_guid_tmp			=	@guid
	
			
	-------------Updating the RO Status in Temp table-----------------

	UPDATE	RST
	SET		ro_spare_status_tmp		=	REPPRM_PARAMdesc
	FROM	RO_SPARE_CONSUMPTION_TMP RST
	JOIN	Rep_RepPrm_Parameter_dtl  WITH (NOLOCK)
	ON		REPPRM_COMPONENTNAME	=   'BASREPAIRORDER'
	AND		REPPRM_PARAMTYPE		=	'ROSTATUS'
	AND		REPPRM_PARAMCATEGORY	=   'COMBO'
	AND		ro_spare_status_tmp		=	REPPRM_PARAMCODE
	AND		ro_spare_guid_tmp		=	@guid
	AND		ro_spare_ou_tmp			=	@ctxt_ouinstance
	
	

	------------------Updating the Repair Shop----------------------
	UPDATE	RST
	SET		ro_spare_shop_desc_tmp		=	TRD_PARTNER_NAME
	FROM	RO_SPARE_CONSUMPTION_TMP RST	 WITH (NOLOCK)
	JOIN	TRD_PARTNER_CUST_SUPP_VW		 WITH (NOLOCK)
	ON		ro_spare_rep_shop_tmp		=	TRD_PARTNER_CODE
	AND		ro_spare_ou_tmp				=	TRD_PARTNER_OUINSTANCE
	WHERE	ro_spare_guid_tmp			=	@guid
	

	---------------------Updating the Cost--------------------
	UPDATE	RST
	SET		ro_spare_value_tmp		=	ISNULL(ISUID_ISSUE_COST,0)
	FROM	RO_SPARE_CONSUMPTION_TMP RST	
	JOIN	ISU_ISUIH_ISSUE_TRAN_HDR	WITH(NOLOCK)
	ON		ISUIH_REF_DOC_NO		=	ro_Spare_ro_no_tmp
	AND		ISUIH_ORG_UNIT			=	ro_spare_ou_tmp
	JOIN	ISU_ISUDT_ISSUE_PART_DTL    WITH (NOLOCK)
	ON		ISUID_TRANSACTION_NO	=	ISUIH_TRANSACTION_NO
	AND		ISUIH_ORG_UNIT			=	ISUID_ORG_UNIT
	AND		ISUID_ISS_PART_NO		=	ro_spare_part_no_tmp	
	WHERE	ISUIH_ISSUE_TYPE		=	'RO'
	AND		ro_spare_guid_tmp		=	@guid
	AND		ro_spare_ou_tmp			=	@ctxt_ouinstance
	
	SELECT 
		ro_spare_from_warehouse_tmp							'REP_FRM_WREHSE',
		ro_spare_part_desc_tmp								'REP_PART_DESC',
		CAST(ro_spare_quantity_tmp AS DECIMAL(13,2))		'REP_QUANT',
		ro_spare_shop_desc_tmp    							'REP_REP_SHP',
		ro_spare_rep_shop_tmp								'REP_REPA_SHP_NO',
	    CONVERT(varchar(11),ro_spare_rep_ord_dte_tmp,101)	'REP_RO_DTE',
		ro_Spare_ro_no_tmp									'REP_RO_NO',
		ro_spare_status_tmp									'REP_RO_STATS',
		ro_spare_serial_lot_tmp								'REP_SERI_LOT',
		ro_spare_part_no_tmp  								'REP_SPARE_PART',
		UPPER(ro_spare_rep_uom_tmp)  						'REP_UOM',
		CAST(ISNULL(ro_spare_value_tmp,0) AS DECIMAL(13,2)) 'REP_VAL_INR'
	FROM  RO_SPARE_CONSUMPTION_TMP WITH(NOLOCK)
	WHERE ro_Spare_ro_no_tmp			like		ISNULL(@spr_cons_rep_ord,'%')
	AND   ro_spare_guid_tmp				=	@guid
	ORDER BY ro_spare_rep_ord_dte_tmp
	
SET NOCOUNT OFF
END

	
	


