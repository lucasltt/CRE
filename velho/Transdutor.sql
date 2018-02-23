
/*
ALTER TABLE B$GC_MARKER ADD FEATURET_CRE VARCHAR2(200);


-- Este bloco abaixo recria views, triggers e outros objetos atrelado à tabela
UPDATE G3E_GENERALPARAMETER SET G3E_VALUE='1' WHERE G3E_NAME='IgnoreSubsettingForLTT';
COMMIT;

EXEC G3E_GENERALPARAMETER_PKG.CREATEOPTIMIZEDTABLE;
COMMIT;

BEGIN
  CREATE_VIEWS.CREATE_LTT_VIEW('B$GC_MARKER');
  CONSTRAINT_TRANSFER.GETPRIMARYCONSTRAINT('B$GC_MARKER');
  CONSTRAINT_TRANSFER.DROPUNIQUECONSTRAINT('B$GC_MARKER');
  CONSTRAINT_TRANSFER.DROPUNIQUEINDEX('B$GC_MARKER');
  CREATE_TRIGGERS.CREATE_LTT_TRIGGER('B$GC_MARKER');
END;
/

-- Este bloco abaixo recria views, triggers e outros objetos atrelado à tabela
UPDATE G3E_GENERALPARAMETER SET G3E_VALUE='0' WHERE G3E_NAME='IgnoreSubsettingForLTT';
COMMIT;

EXEC G3E_GENERALPARAMETER_PKG.CREATEOPTIMIZEDTABLE;
COMMIT;

create table REF_MARKER_FTYPE
(
TIPO VARCHAR2(200)
);


insert into g3e_picklist values(19305, 'REF_MARKER_FTYPE.TIPO','REF_MARKER_FTYPE', 'TIPO', 'TIPO', 'G3ERestricted', null, null, sysdate, null, 'TIPO', 1,null); 
commit;


-- Insere as novas colunas na tabela de metadados G3E_ATTRIBUTE
INSERT INTO G3E_ATTRIBUTE (G3E_ANO,G3E_CNO,G3E_FIELD,G3E_USERNAME,G3E_REQUIRED,G3E_COPY,G3E_EXCLUDEFROMEDIT,G3E_DATATYPE,G3E_EXCLUDEFROMREPLACE,G3E_EDITDATE,G3E_BREAKCOPY,G3E_COPYATTRIBUTE,G3E_WRAPTEXT,G3E_UNIQUE,G3E_FUNCTIONALVALIDATION,G3E_ROLE, g3e_pno) 
VALUES (1930109,19301,'FEATURET_CRE','Tipo do Transdutor (CRE)',0,0,0,10,0,SYSDATE,1,1,0,0,0,'EVERYONE',19305);
COMMIT;

--Popular ref

insert into REF_MARKER_FTYPE values('TRANSDUTOR PRESSAO CABO ENDERECADO INT');

commit;

-- Inserir na tabattribute
prompt Importing table g3e_tabattribute...

insert into g3e_tabattribute (G3E_TANO, G3E_ANO, G3E_ORDINAL, G3E_PNO, G3E_READONLY, G3E_DEFAULT, G3E_REFRESH, G3E_DTNO, G3E_FIELDVALUEFILTER, G3E_TRAVERSALANO, G3E_EDITDATE, G3E_TRIGGERPOPULATE, G3E_USEFILTERTOTRANSLATEKEY, G3E_FKQRINO, G3E_FKQARGGROUPNO)
values (193310116, 1930109, 16, 19305, 0, null, 0, 1933101, null, null, sysdate, 0, 0, null, null);

insert into g3e_tabattribute (G3E_TANO, G3E_ANO, G3E_ORDINAL, G3E_PNO, G3E_READONLY, G3E_DEFAULT, G3E_REFRESH, G3E_DTNO, G3E_FIELDVALUEFILTER, G3E_TRAVERSALANO, G3E_EDITDATE, G3E_TRIGGERPOPULATE, G3E_USEFILTERTOTRANSLATEKEY, G3E_FKQRINO, G3E_FKQARGGROUPNO)
values (193310215, 1930109, 16, 19305, 0, null, 0, 1930102, null, null, sysdate, 0, 0, null, null);


insert into g3e_tabattribute (G3E_TANO, G3E_ANO, G3E_ORDINAL, G3E_PNO, G3E_READONLY, G3E_DEFAULT, G3E_REFRESH, G3E_DTNO, G3E_FIELDVALUEFILTER, G3E_TRAVERSALANO, G3E_EDITDATE, G3E_TRIGGERPOPULATE, G3E_USEFILTERTOTRANSLATEKEY, G3E_FKQRINO, G3E_FKQARGGROUPNO)
values (193310315, 1930109, 16, 19305, 1, null, 0, 1930103, null, null, sysdate, 0, 0, null, null);

commit;



EXEC gc_compileinvalidobjects;
*/