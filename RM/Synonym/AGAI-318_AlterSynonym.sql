/* FILENAME						 : AADI-37-AlterSynonym.SQL				*/
/* VERSION                       : 1.0	                            */
/********************************************************************/
/* COMPONENT		  :  basrepairorder   									*/
/* ACTIVITY			  :  spares_cons_rept							*/
/* ILBO CODE		  :	 											*/
/********************************************************************/
/*	CREATED BY	:  Abi			 									*/
/*	CREATED DATE:  09-JUNE-2017										*/
/*	DESCRIPTION :  SYNONYM FOR TEMP TABLE							*/
/*	CR ID		:  												    */
/********************************************************************/

IF  NOT EXISTS (SELECT 'Y' FROM sys.sysobjects WHERE name = 'RO_SPARE_CONSUMPTION_TMP' AND TYPE = 'SN')
BEGIN
       CREATE SYNONYM  RO_SPARE_CONSUMPTION_TMP FOR AVNAPPDB_TEMPDB.dbo.RO_SPARE_CONSUMPTION_TMP
END
GO




