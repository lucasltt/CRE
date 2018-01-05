
ALTER TABLE B$GC_NETELEM ADD FATOR NUMBER DEFAULT 1;
ALTER TABLE B$GC_NETELEM ADD METODO_IR VARCHAR2(200);

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
G3E_FNO NUMBER(5),
METODO VARCHAR2(200)
);


insert into g3e_picklist values(40004, 'REF_METODO_IR.METODO','REF_METODO_IR', 'METODO', 'METODO', 'G3ERestricted', null, null, sysdate, null, 'METODO', 1,null); 
commit;

-- Insere as novas colunas na tabela de metadados G3E_ATTRIBUTE
INSERT INTO G3E_ATTRIBUTE (G3E_ANO,G3E_CNO,G3E_FIELD,G3E_USERNAME,G3E_FORMAT,G3E_REQUIRED,G3E_COPY,G3E_EXCLUDEFROMEDIT,G3E_DATATYPE,G3E_EXCLUDEFROMREPLACE,G3E_EDITDATE,G3E_BREAKCOPY,G3E_COPYATTRIBUTE,G3E_WRAPTEXT,G3E_UNIQUE,G3E_FUNCTIONALVALIDATION,G3E_ROLE) 
VALUES (510152,51,'FATOR','Fator','General Number',0,0,0,4,0,SYSDATE,1,1,0,0,0,'EVERYONE');
COMMIT;

-- Insere as novas colunas na tabela de metadados G3E_ATTRIBUTE
INSERT INTO G3E_ATTRIBUTE (G3E_ANO,G3E_CNO,G3E_FIELD,G3E_USERNAME,G3E_REQUIRED,G3E_COPY,G3E_EXCLUDEFROMEDIT,G3E_DATATYPE,G3E_EXCLUDEFROMREPLACE,G3E_EDITDATE,G3E_BREAKCOPY,G3E_COPYATTRIBUTE,G3E_WRAPTEXT,G3E_UNIQUE,G3E_FUNCTIONALVALIDATION,G3E_ROLE, g3e_pno) 
VALUES (510153,51,'METODO_IR','Método de Instalação/Retirada',0,0,0,10,0,SYSDATE,1,1,0,0,0,'EVERYONE',40004);
COMMIT;


                                             
                                             
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

EXEC gc_compileinvalidobjects;