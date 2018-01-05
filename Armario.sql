insert into g3e_featurecomponent (G3E_FCNO, G3E_FNO, G3E_CNO, G3E_REQUIRED, G3E_REPEATING, G3E_AUTOREPEAT, G3E_PINO, G3E_ORDINAL, G3E_INTERFACEARGUMENT, G3E_DERIVEDFROMCNO, G3E_INSERTORDINAL, G3E_DELETEORDINAL, G3E_REFRESH, G3E_ALTERNATEREQUIREDCNO, G3E_REPLACE, G3E_EDITDATE, G3E_BREAKACTION, G3E_COMPONENTELIMINATION, G3E_COMPONENTASSIGNMENT, G3E_COMPONENTADJUSTMENT, G3E_GEOPROXIMITYTOLERANCE, G3E_BREAKLINEARCNO, G3E_ALTERNATEGEOGRAPHIC, G3E_ALTERNATEGEOORDINAL, G3E_RINO, G3E_RIARGGROUPNO, G3E_INCLUDEINPLACEMENT, G3E_MERGEMAXDISTANCE, G3E_MERGECOMMONPRECOND, G3E_MERGEPRECOND, G3E_MERGEOCCURRENCES, G3E_MERGERINO, G3E_MERGERIARGGROUPNO, G3E_CCNO, G3E_GENERATE)
values (10300 + 40, 10300, 40, 0, 0, 0, 7, 337, 
'0C20010000001000000001000000010000000C20010000001000000000000000040000000800000000000300000026004800390008000000000000000000080000000000000000000800000000000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', null, 337, 337, 0, 3031, 1, SYSDATE, 1, 2, 1, 1, 1, null, 0, 0, null, null, 1, null, null, null, 1, null, null, null, 0);
COMMIT;


CREATE OR REPLACE VIEW VGC_ITFACE_FID_T
(G3E_ID, G3E_FNO, G3E_CNO, G3E_FID, G3E_CID, G3E_GEOMETRY, G3E_ALIGNMENT,
 JOB_ID, JOB_STATE, FEATURE_STATE, SWITCH_CENTRE_CLLI, OWNERSHIP)
AS 
SELECT 
B.G3E_ID,
B.G3E_FNO,
B.G3E_CNO,
B.G3E_FID,
B.G3E_CID,
B.G3E_GEOMETRY,
B.G3E_ALIGNMENT,
D.JOB_ID,
D.JOB_STATE,
D.FEATURE_STATE,
D.SWITCH_CENTRE_CLLI,
D.OWNERSHIP
FROM
GC_FID_T B,
GC_NETELEM D
WHERE
D.G3E_FNO=10300
AND B.G3E_FID=D.G3E_FID;


INSERT INTO G3E_COMPONENTVIEWDEFINITION ( G3E_VNO, G3E_VIEW, G3E_FNO, G3E_CNO, G3E_LENO, G3E_FIELDS,
G3E_EDITDATE, G3E_ATTRAFFECTSMEMBERSHIP )
VALUES (10300 + 40 + 2, 'VGC_ITFACE_FID_T', 10300, 40, NULL, NULL, SYSDATE, 0); 
COMMIT;

INSERT INTO G3E_COMPONENTVIEWCOMPOSITION ( G3E_CVCNO, G3E_VNO, G3E_CNO, G3E_FNO )
VALUES ((10300 + 40 + 2) * 100 + 40 + 2, 10300 + 40 + 2, 40, 10300);
COMMIT;


INSERT INTO G3E_COLUMN_METADATA ( TABLENAME, COLUMNNAME, COLUMNTYPE, COLUMNSUBTYPE, ATTRIBUTES, GEOMETRYFORMAT,
 SDOORDCNT, SDOESEQ, COORDSYSTEMINDEX ) 
VALUES ('VGC_ITFACE_FID_T', 'G3E_GEOMETRY', 32, 10, NULL, NULL, 2, NULL, NULL);
COMMIT; 


INSERT INTO MODIFIEDTABLES ( MODIFIEDTABLEID, TABLENAME) 
VALUES ((select max(MODIFIEDTABLEID)+1 from MODIFIEDTABLES),'VGC_ITFACE_FID_T');
COMMIT;


BEGIN
MG3ElanguageSubTableUtils.SynchronizeSubTables;
MG3EConfiguration.SetConfiguration('OI');
MG3EOTCreateOptimizedTables;
MG3ECreateOptableViews;
END;
/

BEGIN
create_component_view.create_geom_component_view ('VGC_ITFACE_FID_T','GC_FID_T');
END;
/

BEGIN
LTT_Role.Create_LTT_View_Synonym;
LTT_Role.Create_Component_View_Synonym;
LTT_Role.Grant_Privs_To_Role; 
END;
/


INSERT INTO G3E_LEGENDENTRY (G3E_LENO, G3E_LEGENDENTRY, G3E_USERNAME, G3E_VNO, G3E_SRNO, G3E_LRNO,
G3E_EDITDATE, G3E_ROLE ) VALUES ( 
((10300 + 40 + 2)*100 + 40), 'VGC_ITFACE_FID_T', 'Texto FID do Armario', 10300 + 40 + 2, 2905507, 3275007, SYSDATE, 'EVERYONE');
COMMIT;

UPDATE G3E_COMPONENTVIEWDEFINITION SET G3E_LENO=((10300 + 40 + 2)*100 + 40) WHERE G3E_VNO=10300 + 40 + 2;
COMMIT;


INSERT INTO G3E_LEGGEO_DEFAULT ( G3E_LENO, G3E_DISPLAYMODE, G3E_DISPLAYSCALEMIN, G3E_DISPLAYSCALEMAX
, G3E_DISPLAYORDINAL, G3E_USEDISPLAYSCALE, G3E_LOCATABLE ) VALUES ( 
((10300 + 40 + 2)*100 + 40), 1, 1, 10000, 5, 1, 1); 
COMMIT;

UPDATE G3E_LEGGEO_DEFDSP SET G3E_ORDINAL = G3E_ORDINAL + 3 WHERE G3E_ORDINAL > 70;

INSERT INTO G3E_LEGGEO_DEFDSP ( G3E_LEGENDITEM, G3E_USERNAME, G3E_LEVEL, G3E_ORDINAL
, G3E_LEAFINDICATOR, G3E_DCROWNO ) VALUES ( 
'VGC_ITFACE_FID_T', 'Texto FID do Armario', 3, 71, 1, (select max(G3E_DCROWNO)+1 from G3E_LEGGEO_DEFDSP)); 
COMMIT;

BEGIN
g3e_metadata.create_gdometadata;
GDOTriggers.Create_GDOTriggers;
END;
/

insert into publicador_ddc_view values ( 451, 61, 'VGC_ITFACE_FID_T'); 
COMMIT;