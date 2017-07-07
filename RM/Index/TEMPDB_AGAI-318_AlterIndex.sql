/* FILENAME						 : TEMPDB_AADI-37-AlterIndex.SQL	*/
/* VERSION                       : 1.0	                            */
/********************************************************************/
/* COMPONENT		  : basrepairorder								*/
/* ACTIVITY			  : spares_cons_rept							*/
/* ILBO CODE		  :	 											*/
/********************************************************************/
/*	CREATED BY	:  Abi 				 								*/
/*	CREATED DATE:  09-JUNE-2017										*/
/*	DESCRIPTION :  INDEX FOR TEMP TABLE								*/
/*	CR ID		:												    */
/********************************************************************/

IF NOT EXISTS (	SELECT	'X'
				FROM	SYSINDEXES	
				WHERE	name	=	'RO_SPARE_CONSUMPTION_TMP_INX' 
				AND		id		=	OBJECT_ID('RO_SPARE_CONSUMPTION_TMP'))
BEGIN
	CREATE CLUSTERED INDEX RO_SPARE_CONSUMPTION_TMP_INX
	ON RO_SPARE_CONSUMPTION_TMP(ro_spare_guid_tmp)
END


