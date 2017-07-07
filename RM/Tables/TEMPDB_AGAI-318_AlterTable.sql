/********************************************************************************/
/* FILENAME			:	TEMPDB_AlterTempTable.sql								*/
/* VERSION			:	1.0														*/
/* DESCRIPTION		:															*/
/********************************************************************************/
/* PROJECT			:															*/
/**************************DEVELOPMENT HISTORY***********************************/  
/* COMPONENT			: basrepairorder									    */
/* ACTIVITY				: spares_cons_rept					     	            */
/***************************DEVELOPMENT HISTORY**********************************/
/* AUTHOR				: Abi S 												*/
/* DATE					: 09-JUNE-2017											*/
/* RTRACK ID			: 														*/      
/***************************MODIFICATION HISTORY*********************************/
/* MODIFIED BY                                                                  */
/* DATE                                                                         */
/* DESCRIPTION                                                                  */
/*****************************REVIEW HISTORY ************************************/
/* REVIEWED BY                      :  											*/    
/* NUMBER OF REVIEW DEFECTS         :   										*/
/* REVIEW ID                        :											*/
/* CONFIRMED MOVEMENT TO CONTROLLED SOURCE BY :  								*/    
/********************************************************************************/

IF NOT EXISTS (
				SELECT 'X' FROM SYS.OBJECTS WITH (NOLOCK)
				WHERE NAME	=	'RO_SPARE_CONSUMPTION_TMP'
				AND TYPE	=	'U'
			  )
BEGIN 
CREATE TABLE RO_SPARE_CONSUMPTION_TMP
(
	ro_spare_guid_tmp				UDD_GUID,
	ro_spare_ou_tmp				    UDD_CTXT_OUINSTANCE,
	ro_Spare_ro_no_tmp				VARCHAR(40),
	ro_spare_rep_shop_tmp			VARCHAR(150),
	ro_spare_shop_desc_tmp			VARCHAR(150),
	ro_spare_rep_ord_dte_tmp		DATETIME,
	ro_spare_status_tmp				VARCHAR(15),
	ro_spare_part_no_tmp			VARCHAR(40),
	ro_spare_part_desc_tmp			VARCHAR(150),
	ro_spare_serial_lot_tmp			VARCHAR(40),	
	ro_spare_quantity_tmp			udd_quantity,
	ro_spare_rep_uom_tmp			VARCHAR(10),
	ro_spare_value_tmp				udd_purcost,
	ro_spare_from_warehouse_tmp		udd_warehouse
)
END


