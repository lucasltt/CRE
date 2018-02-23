

ALTER TABLE B$GC_NETELEM ADD FATOR NUMBER;
ALTER TABLE B$GC_NETELEM ADD METODO_IR VARCHAR2(200);
ALTER TABLE B$GC_NETELEM ADD FTYPE_CRE VARCHAR2(200);

-- Este bloco abaixo recria views, triggers e outros objetos atrelado à tabela


EXEC G3E_GENERALPARAMETER_PKG.CREATEOPTIMIZEDTABLE;
COMMIT;

BEGIN
  CREATE_VIEWS.CREATE_LTT_VIEW('B$GC_NETELEM');
  CONSTRAINT_TRANSFER.GETPRIMARYCONSTRAINT('B$GC_NETELEM');
  CONSTRAINT_TRANSFER.DROPUNIQUECONSTRAINT('B$GC_NETELEM');
  CONSTRAINT_TRANSFER.DROPUNIQUEINDEX('B$GC_NETELEM');
  CREATE_TRIGGERS.CREATE_LTT_TRIGGER('B$GC_NETELEM');
END;
/

EXEC G3E_GENERALPARAMETER_PKG.CREATEOPTIMIZEDTABLE;
COMMIT;


create table REF_METODO_IR
(
  g3e_fno NUMBER(5),
  metodo  VARCHAR2(200)
);


create table REF_FTYPE_CRE
(
  g3e_fno NUMBER(5),
  tipo    VARCHAR2(200)
);


create or replace public synonym REF_METODO_IR for REF_METODO_IR;
grant select on REF_METODO_IR to everyone;
grant insert, delete, update on REF_METODO_IR to administrator;

create or replace public synonym REF_FTYPE_CRE for REF_FTYPE_CRE;
grant select on REF_FTYPE_CRE to everyone;
grant insert, delete, update on REF_FTYPE_CRE to administrator;

insert into g3e_picklist values(40004, 'REF_METODO_IR.METODO','REF_METODO_IR', 'METODO', 'METODO', 'G3ERestricted', null, null, sysdate, null, 'METODO', 1,null); 
commit;


insert into g3e_picklist values(40005, 'REF_FTYPE_CRE.TIPO','REF_FTYPE_CRE', 'TIPO', 'TIPO', 'G3ERestricted', null, null, sysdate, null, 'TIPO', 1,null); 
commit;


-- Insere as novas colunas na tabela de metadados G3E_ATTRIBUTE
INSERT INTO G3E_ATTRIBUTE (G3E_ANO,G3E_CNO,G3E_FIELD,G3E_USERNAME,G3E_FORMAT,G3E_REQUIRED,G3E_COPY,G3E_EXCLUDEFROMEDIT,G3E_DATATYPE,G3E_EXCLUDEFROMREPLACE,G3E_EDITDATE,G3E_BREAKCOPY,G3E_COPYATTRIBUTE,G3E_WRAPTEXT,G3E_UNIQUE,G3E_FUNCTIONALVALIDATION,G3E_ROLE) 
VALUES (510152,51,'FATOR','Fator','General Number',0,0,0,4,0,SYSDATE,1,1,0,0,0,'EVERYONE');
COMMIT;

-- Insere as novas colunas na tabela de metadados G3E_ATTRIBUTE
INSERT INTO G3E_ATTRIBUTE (G3E_ANO,G3E_CNO,G3E_FIELD,G3E_USERNAME,G3E_REQUIRED,G3E_COPY,G3E_EXCLUDEFROMEDIT,G3E_DATATYPE,G3E_EXCLUDEFROMREPLACE,G3E_EDITDATE,G3E_BREAKCOPY,G3E_COPYATTRIBUTE,G3E_WRAPTEXT,G3E_UNIQUE,G3E_FUNCTIONALVALIDATION,G3E_ROLE, g3e_pno) 
VALUES (510153,51,'METODO_IR','Método de Instalação/Retirada',0,0,0,10,0,SYSDATE,1,1,0,0,0,'EVERYONE',40004);
COMMIT;


-- Insere as novas colunas na tabela de metadados G3E_ATTRIBUTE
INSERT INTO G3E_ATTRIBUTE (G3E_ANO,G3E_CNO,G3E_FIELD,G3E_USERNAME,G3E_REQUIRED,G3E_COPY,G3E_EXCLUDEFROMEDIT,G3E_DATATYPE,G3E_EXCLUDEFROMREPLACE,G3E_EDITDATE,G3E_BREAKCOPY,G3E_COPYATTRIBUTE,G3E_WRAPTEXT,G3E_UNIQUE,G3E_FUNCTIONALVALIDATION,G3E_ROLE, g3e_pno) 
VALUES (510154,51,'FTYPE_CRE','Tipo do Elemento (CRE)',0,0,0,10,0,SYSDATE,1,1,0,0,0,'EVERYONE',40005);
COMMIT;


                                             
--FATOR                                             
DECLARE
v_tano number;
v_ordinal number;
v_cont number;
v_lock number;
requ   number;
cursor c_tab is select distinct G3E_DTNO from g3e_tabattribute where g3e_ANO=5112;
begin
     for c_tab_reg in c_tab loop
         select max(g3e_tano)+1, max(g3e_ordinal)+1 into v_tano,v_ordinal from g3e_tabattribute where g3e_dtno=c_tab_reg.g3e_dtno;
         select count(g3e_tano) into v_cont from g3e_tabattribute where g3e_dtno=c_tab_reg.g3e_dtno and g3e_ano in(510152);
         select g3e_readonly into requ from g3e_tabattribute where g3e_dtno = c_tab_reg.g3e_dtno and g3e_ano = 5112 and rownum = 1;
         
         if (v_cont=0)  then
             v_lock:=1;
             while v_lock=1  loop
                SELECT COUNT(G3E_TANO) into v_lock FROM G3E_TABATTRIBUTE WHERE G3E_tano=v_tano;
                if v_lock=0 then 
                   insert into g3e_tabattribute values(v_tano,510152,v_ordinal,null,requ,NULL,0,c_tab_reg.g3e_dtno,NULL,NULL,SYSDATE,0,0,NULL,NULL);
                   commit;
                else
                    v_tano:= v_tano+1;
                end if;                 
             end loop;
         end if;         
     end loop;
end;
/


                                        
--METODO_IR                                 
DECLARE
v_tano number;
v_ordinal number;
v_cont number;
v_lock number;
requ   number;
cursor c_tab is select distinct G3E_DTNO from g3e_tabattribute where g3e_ANO=5112;
begin
     for c_tab_reg in c_tab loop
         select max(g3e_tano)+1, max(g3e_ordinal)+1 into v_tano,v_ordinal from g3e_tabattribute where g3e_dtno=c_tab_reg.g3e_dtno;
         select count(g3e_tano) into v_cont from g3e_tabattribute where g3e_dtno=c_tab_reg.g3e_dtno and g3e_ano in(510153);
         select g3e_readonly into requ from g3e_tabattribute where g3e_dtno = c_tab_reg.g3e_dtno and g3e_ano = 5112 and rownum = 1;
         
         if (v_cont=0)  then
             v_lock:=1;
             while v_lock=1  loop
                SELECT COUNT(G3E_TANO) into v_lock FROM G3E_TABATTRIBUTE WHERE G3E_tano=v_tano;
                if v_lock=0 then 
                   insert into g3e_tabattribute values(v_tano,510153,v_ordinal,null,requ,NULL,0,c_tab_reg.g3e_dtno,NULL,NULL,SYSDATE,0,0,NULL,NULL);
                   commit;
                else
                    v_tano:= v_tano+1;
                end if;                 
             end loop;
         end if;         
     end loop;
end;
/


                                        
--FTYPE_CRE                             
DECLARE
v_tano number;
v_ordinal number;
v_cont number;
v_lock number;
requ   number;
cursor c_tab is select distinct G3E_DTNO from g3e_tabattribute where g3e_ANO=5112 and g3e_dtno in 
    (select g3e_dtno from g3e_dialog where  g3e_fno in (2600, 2900, 11900, 2400, 10800, 10900, 19600, 11800, 19300));
begin
     for c_tab_reg in c_tab loop
         select max(g3e_tano)+1, max(g3e_ordinal)+1 into v_tano,v_ordinal from g3e_tabattribute where g3e_dtno=c_tab_reg.g3e_dtno;
         select count(g3e_tano) into v_cont from g3e_tabattribute where g3e_dtno=c_tab_reg.g3e_dtno and g3e_ano in(510154);
         select g3e_readonly into requ from g3e_tabattribute where g3e_dtno = c_tab_reg.g3e_dtno and g3e_ano = 5112 and rownum = 1;
         
         if (v_cont=0)  then
             v_lock:=1;
             while v_lock=1  loop
                SELECT COUNT(G3E_TANO) into v_lock FROM G3E_TABATTRIBUTE WHERE G3E_tano=v_tano;
                if v_lock=0 then 
                   insert into g3e_tabattribute values(v_tano,510154,v_ordinal,null,requ,NULL,0,c_tab_reg.g3e_dtno,NULL,NULL,SYSDATE,0,0,NULL,NULL);
                   commit;
                else
                    v_tano:= v_tano+1;
                end if;                 
             end loop;
         end if;         
     end loop;
end;
/



--PICKLISTS METODO_IR
declare

begin
  for f in (select distinct g3e_fno from g3e_feature) loop
  
    insert into g3e_picklist
    values
      (40004 + f.g3e_fno,
       'REF_METODO_IR.METODO.' || f.g3e_fno,
       'REF_METODO_IR',
       'METODO',
       'METODO',
       'G3ERestricted',
       'G3E_FNO =  ' || f.g3e_fno,
       null,
       sysdate,
       null,
       'METODO',
       1,
       null);
    commit;
  
    update g3e_tabattribute
       set g3e_pno = 40004 + f.g3e_fno
     where g3e_dtno in (select distinct g3e_dtno
                          from g3e_dialog
                         where g3e_fno = f.g3e_fno)
       and g3e_ano = 510153
       and g3e_readonly = 0;
    commit;
  
  end loop;
end;
/



--PICKLISTS FTYPER_CRE
declare

begin
  for f in (select  g3e_fno from g3e_feature where  g3e_fno in (2600, 2900, 11900, 2400, 10800, 10900, 19600, 11800, 19300)) loop
  
    insert into g3e_picklist
    values
      (40005 + f.g3e_fno,
       'REF_FTYPE_CRE.TIPO.' || f.g3e_fno,
       'REF_FTYPE_CRE',
       'TIPO',
       'TIPO',
       'G3ERestricted',
       'G3E_FNO =  ' || f.g3e_fno,
       null,
       sysdate,
       null,
       'TIPO',
       1,
       null);
    commit;
  
    update g3e_tabattribute
       set g3e_pno = 40005 + f.g3e_fno
     where g3e_dtno in (select distinct g3e_dtno
                          from g3e_dialog
                         where g3e_fno = f.g3e_fno)
       and g3e_ano = 510154
       and g3e_readonly = 0;
    commit;
  
  end loop;
end;
/


--editar tabelas de referencia
declare

  idRef Number;
begin
  select max(id) into idRef from tabelas_de_referencia;

  for f in (select distinct g3e_username
              from g3e_feature
             order by g3e_username) loop
    idRef := idRef + 1;
    insert into tabelas_de_referencia
    values
      (idRef,
       f.g3e_username,
       'Método de Instalação/Retirada',
       'REF_METODO_IR',
       'METODO');
    commit;
  
    idRef := idRef + 1;
    insert into tabelas_de_referencia
    values
      (idRef,
       f.g3e_username,
       'Tipo do Elemento (CRE)',
       'REF_FTYPE_CRE',
       'TIPO');
    commit;
  
  end loop;
end;
/

update g3e_tabattribute set g3e_default = 1 where g3e_ano = 510152 and g3e_readonly = 0;
commit;

--EXEC gc_compileinvalidobjects;