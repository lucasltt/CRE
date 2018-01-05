CREATE TABLE GC_FID_T
(
  G3E_ID         NUMBER(10),
  G3E_FNO        NUMBER(5),
  G3E_FID        NUMBER(10),
  G3E_CNO        NUMBER(5),
  G3E_CID        NUMBER(10),
  G3E_GEOMETRY   CHAR(1 BYTE),
  G3E_ALIGNMENT  NUMBER(5)
);
 
 
begin
g3e_metadata.createsdotable('GC_FID_T',1);
end;
/
 
INSERT INTO G3E_COMPONENT ( G3E_CNO, G3E_USERNAME, G3E_NAME, G3E_TOOLTIP, G3E_TYPE, G3E_TABLE,
G3E_DETAIL, G3E_ALIGNMENTFIELD, G3E_DCNO, G3E_EDITDATE, G3E_DTNO, G3E_GEOMETRYFIELD,
G3E_GEOMETRYTYPE, G3E_SUBSETATTRIBUTE, G3E_SUBTYPE, G3E_LOCALECOMMENT, G3E_LRNO,
G3E_PARTITIONATTRIBUTE ) VALUES ( 
40, 'Texto do FID', 'GC_FID_T', 'FID da entidade', 1024, 'GC_FID_T', 0, 
'G3E_ALIGNMENT', 31, SYSDATE, NULL, 'G3E_GEOMETRY', 'TextPointGeometry', NULL, NULL, NULL, NULL, NULL); 
COMMIT;
 
 
INSERT INTO G3E_FEATURECOMPONENT ( G3E_FCNO, G3E_FNO, G3E_CNO, G3E_REQUIRED, G3E_REPEATING,
G3E_AUTOREPEAT, G3E_PINO, G3E_ORDINAL, G3E_INTERFACEARGUMENT, G3E_DERIVEDFROMCNO, G3E_INSERTORDINAL,
G3E_DELETEORDINAL, G3E_EDITDATE, G3E_REFRESH, G3E_ALTERNATEREQUIREDCNO, G3E_REPLACE,
G3E_BREAKACTION, G3E_COMPONENTELIMINATION, G3E_COMPONENTASSIGNMENT, G3E_COMPONENTADJUSTMENT,
G3E_GEOPROXIMITYTOLERANCE, G3E_BREAKLINEARCNO, G3E_ALTERNATEGEOGRAPHIC, G3E_ALTERNATEGEOORDINAL,
G3E_RINO, G3E_RIARGGROUPNO, G3E_INCLUDEINPLACEMENT, G3E_MERGEMAXDISTANCE, G3E_MERGECOMMONPRECOND,
G3E_MERGEPRECOND, G3E_MERGEOCCURRENCES, G3E_MERGERINO, G3E_MERGERIARGGROUPNO, G3E_CCNO,
G3E_GENERATE ) VALUES ( 
3000 + 40, 3000, 40, 0, 0, 0, 7, 336, (select ag.g3e_interfaceargument from g3e_featurecomponent ag where ag.g3e_cno=3030), NULL, 336, 336, SYSDATE
, 0, 3031, 1, 1, 2, 1, 1, 1, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0); 
COMMIT;

insert into g3e_featurecomponent (G3E_FCNO, G3E_FNO, G3E_CNO, G3E_REQUIRED, G3E_REPEATING, G3E_AUTOREPEAT, G3E_PINO, G3E_ORDINAL, G3E_INTERFACEARGUMENT, G3E_DERIVEDFROMCNO, G3E_INSERTORDINAL, G3E_DELETEORDINAL, G3E_REFRESH, G3E_ALTERNATEREQUIREDCNO, G3E_REPLACE, G3E_EDITDATE, G3E_BREAKACTION, G3E_COMPONENTELIMINATION, G3E_COMPONENTASSIGNMENT, G3E_COMPONENTADJUSTMENT, G3E_GEOPROXIMITYTOLERANCE, G3E_BREAKLINEARCNO, G3E_ALTERNATEGEOGRAPHIC, G3E_ALTERNATEGEOORDINAL, G3E_RINO, G3E_RIARGGROUPNO, G3E_INCLUDEINPLACEMENT, G3E_MERGEMAXDISTANCE, G3E_MERGECOMMONPRECOND, G3E_MERGEPRECOND, G3E_MERGEOCCURRENCES, G3E_MERGERINO, G3E_MERGERIARGGROUPNO, G3E_CCNO, G3E_GENERATE)
values (3000 + 40, 3000, 40, 0, 0, 0, 7, 336, 
'0C20010000001000000001000000010000000C20010000001000000000000000040000000800000000000300000026004800390008000000000000000000080000000000000000000800000000000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', null, 336, 336, 0, 3031, 1, SYSDATE, 1, 2, 1, 1, 1, null, 0, 0, null, null, 1, null, null, null, 1, null, null, null, 0);

 

 --POLE_FID_T
CREATE OR REPLACE VIEW VGC_POLE_FID_T
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
D.G3E_FNO=3000
AND B.G3E_FID=D.G3E_FID;

 
INSERT INTO G3E_COMPONENTVIEWDEFINITION ( G3E_VNO, G3E_VIEW, G3E_FNO, G3E_CNO, G3E_LENO, G3E_FIELDS,
G3E_EDITDATE, G3E_ATTRAFFECTSMEMBERSHIP )
VALUES (3000 + 40, 'VGC_POLE_FID_T', 3000, 40, NULL, NULL, SYSDATE, 0); 
COMMIT;
 

 
INSERT INTO G3E_COMPONENTVIEWCOMPOSITION ( G3E_CVCNO, G3E_VNO, G3E_CNO, G3E_FNO )
VALUES ((3000 + 40) * 100 + 40, 3000 + 40, 40, 3000);
COMMIT; 
 

 
INSERT INTO G3E_COLUMN_METADATA ( TABLENAME, COLUMNNAME, COLUMNTYPE, COLUMNSUBTYPE, ATTRIBUTES, GEOMETRYFORMAT,
 SDOORDCNT, SDOESEQ, COORDSYSTEMINDEX ) 
VALUES ('GC_FID_T', 'G3E_GEOMETRY', 32, 10, NULL, NULL, 2, NULL, NULL);

INSERT INTO G3E_COLUMN_METADATA ( TABLENAME, COLUMNNAME, COLUMNTYPE, COLUMNSUBTYPE, ATTRIBUTES, GEOMETRYFORMAT,
 SDOORDCNT, SDOESEQ, COORDSYSTEMINDEX ) 
VALUES ('VGC_POLE_FID_T', 'G3E_GEOMETRY', 32, 10, NULL, NULL, 2, NULL, NULL);
COMMIT;
 

 
INSERT INTO G3E_LTTTABLE ( G3E_LTTNO, G3E_TABLE)
VALUES ((select max(G3E_LTTNO)+1 from G3E_LTTTABLE),'GC_FID_T');
COMMIT;
 

 
INSERT INTO MODIFIEDTABLES ( MODIFIEDTABLEID, TABLENAME) 
VALUES ((select max(MODIFIEDTABLEID)+1 from MODIFIEDTABLES),'GC_FID_T');

INSERT INTO MODIFIEDTABLES ( MODIFIEDTABLEID, TABLENAME) 
VALUES ((select max(MODIFIEDTABLEID)+1 from MODIFIEDTABLES),'VGC_POLE_FID_T');
COMMIT;
 

 
--Colocar o buffer no OUTPUT em um valor alto
BEGIN
MG3ElanguageSubTableUtils.SynchronizeSubTables;
MG3EConfiguration.SetConfiguration('OI');
MG3EOTCreateOptimizedTables;
MG3ECreateOptableViews;
END;
/

 
BEGIN
gc_compileinvalidobjects;
update G3E_GENERALPARAMETER set G3E_VALUE='1' where G3E_NAME='IgnoreSubsettingForLTT';
update G3E_GENERALPARAMETER_OPTABLE set G3E_VALUE='1' where G3E_NAME='IgnoreSubsettingForLTT';
COMMIT;
G3EOneTable.InstallOneTable('GC_FID_T',1);

update G3E_GENERALPARAMETER set G3E_VALUE='0' where G3E_NAME='IgnoreSubsettingForLTT';
update G3E_GENERALPARAMETER_OPTABLE set G3E_VALUE='0' where G3E_NAME='IgnoreSubsettingForLTT';
COMMIT;
END;
/

 
BEGIN
create_component_view.create_geom_component_view ('VGC_POLE_FID_T','GC_FID_T');
END;
/
 

 
BEGIN
LTT_Role.Create_LTT_View_Synonym;
LTT_Role.Create_Component_View_Synonym;
LTT_Role.Grant_Privs_To_Role; 
END;
/

 
INSERT INTO G3E_TEXTSTYLE (G3E_SNO, G3E_USERNAME, G3E_COLOR, G3E_FONTNAME, G3E_FONTBOLD, G3E_FONTITALIC, G3E_FONTSTRIKETHROUGH, G3E_FONTUNDERLINE, G3E_FONTWEIGHT, G3E_SIZE, G3E_TEXTBOX, G3E_TEXTBOXFILLCOLOR, G3E_TEXTBOXFILLTYPE, G3E_TEXTBOXFRAME, G3E_TEXTBOXFRAMECOLOR, G3E_TEXTBOXFRAMEWIDTH, G3E_PLOTREDLINE, G3E_EDITDATE, G3E_JUSTIFICATION, G3E_UNDERLINESNO, G3E_LEFTTEXTBOXOFFSET, G3E_RIGHTTEXTBOXOFFSET, G3E_TOPTEXTBOXOFFSET, G3E_BOTTOMTEXTBOXOFFSET) 
values (327020420, 'Texto do FID', 16744448, 'Arial', 0, 0, 0, 0, 400, 12, 0, -2, 0, 1, 0, 2.834652, 1, sysdate, 1, null, .22, .22, .22, .22);
COMMIT;
 

 
INSERT INTO G3E_STYLERULE ( G3E_SRROWNO, G3E_SRNO, G3E_RULE, G3E_FILTER, G3E_FILTERORDINAL, G3E_SNO,
G3E_EDITDATE ) VALUES ( 
290550309, 2905507, 'Texto do FID', NULL, 6, 327020420, SYSDATE); 
COMMIT;
 

 
INSERT INTO G3E_LABEL ( G3E_LFNO, G3E_USERNAME, G3E_CONTENT ) VALUES ( 
27301002, 'Texto do FID', '[G3E_FID]'); 
COMMIT;
 

 
INSERT INTO G3E_LABELRULE ( G3E_LRROWNO, G3E_LRNO, G3E_RULE, G3E_FILTERORDINAL, G3E_LFNO
 ) VALUES ( 
327500118, 3275007, 'Texto do FID', 1, 27301002); 
COMMIT;
 

 
INSERT INTO G3E_LEGENDENTRY (G3E_LENO, G3E_LEGENDENTRY, G3E_USERNAME, G3E_VNO, G3E_SRNO, G3E_LRNO,
G3E_EDITDATE, G3E_ROLE ) VALUES ( 
((3000 + 40)*100 + 40), 'VGC_POLE_FID_T', 'Texto FID do Poste', 3000 + 40, 2905507, 3275007, SYSDATE, 'EVERYONE');
COMMIT; 
 

 
UPDATE G3E_COMPONENTVIEWDEFINITION SET G3E_LENO=((3000 + 40)*100 + 40) WHERE G3E_VNO=(3000 + 40);
COMMIT;
 

 
INSERT INTO G3E_LEGGEO_DEFAULT ( G3E_LENO, G3E_DISPLAYMODE, G3E_DISPLAYSCALEMIN, G3E_DISPLAYSCALEMAX
, G3E_DISPLAYORDINAL, G3E_USEDISPLAYSCALE, G3E_LOCATABLE ) VALUES ( 
((3000 + 40)*100 + 40), 1, 1, 10000, 5, 1, 1); 
COMMIT;
 

 
UPDATE G3E_LEGGEO_DEFDSP SET G3E_ORDINAL = G3E_ORDINAL + 3 WHERE G3E_ORDINAL > 43;

INSERT INTO G3E_LEGGEO_DEFDSP ( G3E_LEGENDITEM, G3E_USERNAME, G3E_LEVEL, G3E_ORDINAL
, G3E_LEAFINDICATOR, G3E_DCROWNO ) VALUES ( 
'VGC_POLE_FID_T', 'Texto FID do Poste', 3, 44, 1, (select max(G3E_DCROWNO)+1 from G3E_LEGGEO_DEFDSP)); 
COMMIT;


BEGIN
g3e_metadata.create_gdometadata;
GDOTriggers.Create_GDOTriggers;
END;
/

insert into publicador_ddc_view values ( 450, 60, 'VGC_POLE_FID_T'); 
COMMIT;