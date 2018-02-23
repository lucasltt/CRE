alter table g3e_job_tab add ID_CRE varchar2(80);

CREATE OR REPLACE VIEW G3E_JOB AS
SELECT "G3E_IDENTIFIER",
       "G3E_DESCRIPTION",
       "G3E_OWNER",
       "G3E_STATUS",
       "G3E_CREATION",
       "G3E_POSTED",
       "G3E_CLOSED",
       "G3E_ADDJOBATTR",
       "G3E_ID",
       "WR_STATE_CODE",
       "SUBMITTED_DATE",
       "G3E_STATUS_CODE",
       "G3E_FIELDUSER",
       "CD_SEQ",
       "TS_EXTWR",
       "CD_CREWHQ",
       "FG_DESIGN_BY_TOOL",
       "FG_MULTI_DSGN_CMPLT",
       "DT_IN_SERVICE",
       "CD_ZONE",
       "ADDITIONALINFO",
       "G3E_PROCESSINGSTATUS",
       "G3E_JOBCLASS",
       "WORK_REQUEST",
       "VERSION",
       "VERSION_NEXT",
       "GIS_JOB_STATUS",
       "DESIGN_DESCRIPTION",
       "ASSIGNED_TO",
       "REGION",
       "DISTRICT",
       "JOB_TYPE",
       "JOB_CODE",
       "ELECTRICAL_ACCOUNT",
       "WR_ADDRESS",
       "CONTACT_NM",
       "CONTACT_TELE",
       "DT_REQUIRED",
       "FG_LOCKED_DOWN",
       "DT_COMPLETE",
       "CONTACT_ADDR",
       "CD_JOB_MODE",
       "ID_OPER_RESP_EST",
       "ID_OPER_RESP_ASB",
       "JOB_STATE",
       "WORK_ORDER_ID",
       "G3E_POSTFLAG",
       "VSN_VR",
       "UF",
       "LOCALIDADE",
       "SIGLA_ESTACAO",
       "LOCALIDADE_DESTINO",
       "ESTACAO_DESTINO",
       "ID_CRE"
  FROM G3E_JOB_TAB J
 WHERE (J.LOCALIDADE IN
       (SELECT G3E_RegionName
           FROM G3E_Configurations
          WHERE G3E_ConfigurationName = LTT_USER.CONFIGURATION) OR
       J.LOCALIDADE IS NULL)
   AND EXISTS (SELECT X.COLUMN_VALUE
          FROM TABLE(SIS_FN_TIPO_OS_USU()) X
         WHERE X.COLUMN_VALUE = J.JOB_TYPE);



create table ref_id_cre
(
    id_projeto_cre varchar2(80)
);


create or replace public synonym ref_id_cre for ref_id_cre;
grant select on ref_id_cre to everyone;
grant insert, delete, update on ref_id_cre to administrator;


create table cre_config
(
    chave varchar2(50),
    valor varchar2(100),
    desp  varchar2(300)
);

create or replace public synonym cre_config for cre_config;
grant select on cre_config to everyone;
grant insert, delete, update on cre_config to administrator;


insert into cre_config values('PastaRecebimento', 'D:\Geoplex\cre_recebiemnto', 'Pasta onde está localizado os arquivo CSVs com ID do CRE');
insert into cre_config values('PastaEnvio', 'D:\Geoplex\cre_envio', 'Pasta onde exporta o CSV');
insert into cre_config values('UltimoArquivo', null, 'Pasta onde exporta o CSV');
insert into cre_config values('UltimaAtualizacao', null, 'Ultimo horario que o ID foi atualizado');
insert into cre_config values('Intervalo', '30', 'Intervalo para atualização dos ID do CRE');
commit;



create or replace view cre_delta_t as
select (extract(minute from
               numtodsinterval((sysdate -
                               to_date(valor, 'dd/mm/yyyy hh24:mi:ss')),
                               'day')) +
       extract(hour from
               numtodsinterval((sysdate -
                               to_date(valor, 'dd/mm/yyyy hh24:mi:ss')),
                               'day')) * 60 +
       extract(day from
               numtodsinterval((sysdate -
                               to_date(valor, 'dd/mm/yyyy hh24:mi:ss')),
                               'day')) * 60 * 24) delta_t

  from cre_config
 where chave = 'UltimaAtualizacao';

create or replace public synonym cre_delta_t for cre_delta_t;
grant select on cre_delta_t to everyone;