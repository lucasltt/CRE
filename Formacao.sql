
create table REF_FORM_FTYPE
(
TIPO VARCHAR2(200)
);


insert into g3e_picklist values(2402, 'REF_FORM_FTYPE.TIPO','REF_FORM_FTYPE', 'TIPO', 'TIPO', 'G3ERestricted', null, null, sysdate, null, 'TIPO', 1,null); 
commit;


-- Insere as novas colunas na tabela de metadados G3E_ATTRIBUTE
update G3E_ATTRIBUTE set g3e_username = 'Tipo Duto (CRE)' where g3e_ano = 240106;
commit;
--Popular ref

insert into REF_FORM_FTYPE values('TDUTO CORRUGADO PEAD DIAM 124 MM');
insert into REF_FORM_FTYPE values('DUTO LISO PVC DIAM 100 X 6000 MM C/PB');
insert into REF_FORM_FTYPE values('DUTO RD CORRUG P/FORA LISO P/DENT PEAD');
insert into REF_FORM_FTYPE values('DUTO LISO ACO GALVAN DIAM 114 X 6000 MM');
insert into REF_FORM_FTYPE values('NA');

commit;

-- Inserir na tabattribute
prompt Importing table g3e_tabattribute...

insert into g3e_tabattribute (G3E_TANO, G3E_ANO, G3E_ORDINAL, G3E_PNO, G3E_READONLY, G3E_DEFAULT, G3E_REFRESH, G3E_DTNO, G3E_FIELDVALUEFILTER, G3E_TRAVERSALANO, G3E_EDITDATE, G3E_TRIGGERPOPULATE, G3E_USEFILTERTOTRANSLATEKEY, G3E_FKQRINO, G3E_FKQARGGROUPNO)
values (24010194, 240106, 20, 2402, 0, null, 0, 240101, null, null, sysdate, 0, 0, null, null);

insert into g3e_tabattribute (G3E_TANO, G3E_ANO, G3E_ORDINAL, G3E_PNO, G3E_READONLY, G3E_DEFAULT, G3E_REFRESH, G3E_DTNO, G3E_FIELDVALUEFILTER, G3E_TRAVERSALANO, G3E_EDITDATE, G3E_TRIGGERPOPULATE, G3E_USEFILTERTOTRANSLATEKEY, G3E_FKQRINO, G3E_FKQARGGROUPNO)
values (24010294, 240106, 20, 2402, 0, null, 0, 240102, null, null, sysdate, 0, 0, null, null);


insert into g3e_tabattribute (G3E_TANO, G3E_ANO, G3E_ORDINAL, G3E_PNO, G3E_READONLY, G3E_DEFAULT, G3E_REFRESH, G3E_DTNO, G3E_FIELDVALUEFILTER, G3E_TRAVERSALANO, G3E_EDITDATE, G3E_TRIGGERPOPULATE, G3E_USEFILTERTOTRANSLATEKEY, G3E_FKQRINO, G3E_FKQARGGROUPNO)
values (24010394, 240106, 20, 2402, 1, null, 0, 240103, null, null, sysdate, 0, 0, null, null);

commit;



EXEC gc_compileinvalidobjects;