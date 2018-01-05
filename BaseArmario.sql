

create table REF_BASE_FEATURETYPE
(
TIPO VARCHAR2(200)
);


insert into g3e_picklist values(2907, 'REF_BASE_FEATURETYPE.TIPO','REF_BASE_FEATURETYPE', 'TIPO', 'TIPO', 'G3ERestricted', null, null, sysdate, null, 'TIPO', 1,null); 
commit;


update g3e_attribute set g3e_username = 'Tipo da Base (CRE)' where g3e_ano = 290106;
commit;

--Popular ref
insert into REF_BASE_FEATURETYPE values('Armário Metálico');
insert into REF_BASE_FEATURETYPE values('Armário Óptico');

commit;

-- Inserir na tabattribute
prompt Importing table g3e_tabattribute...

insert into g3e_tabattribute (G3E_TANO, G3E_ANO, G3E_ORDINAL, G3E_PNO, G3E_READONLY, G3E_DEFAULT, G3E_REFRESH, G3E_DTNO, G3E_FIELDVALUEFILTER, G3E_TRAVERSALANO, G3E_EDITDATE, G3E_TRIGGERPOPULATE, G3E_USEFILTERTOTRANSLATEKEY, G3E_FKQRINO, G3E_FKQARGGROUPNO)
values (29010190, 290106, 16, 2907, 0, null, 0, 290101, null, null, sysdate, 0, 0, null, null);

insert into g3e_tabattribute (G3E_TANO, G3E_ANO, G3E_ORDINAL, G3E_PNO, G3E_READONLY, G3E_DEFAULT, G3E_REFRESH, G3E_DTNO, G3E_FIELDVALUEFILTER, G3E_TRAVERSALANO, G3E_EDITDATE, G3E_TRIGGERPOPULATE, G3E_USEFILTERTOTRANSLATEKEY, G3E_FKQRINO, G3E_FKQARGGROUPNO)
values (29010290, 290106, 16, 2907, 0, null, 0, 290102, null, null, sysdate, 0, 0, null, null);


insert into g3e_tabattribute (G3E_TANO, G3E_ANO, G3E_ORDINAL, G3E_PNO, G3E_READONLY, G3E_DEFAULT, G3E_REFRESH, G3E_DTNO, G3E_FIELDVALUEFILTER, G3E_TRAVERSALANO, G3E_EDITDATE, G3E_TRIGGERPOPULATE, G3E_USEFILTERTOTRANSLATEKEY, G3E_FKQRINO, G3E_FKQARGGROUPNO)
values (29010390, 290106, 16, 2907, 1, null, 0, 290103, null, null, sysdate, 0, 0, null, null);

commit;



EXEC gc_compileinvalidobjects;