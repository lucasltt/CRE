insert into g3e_customcommand
  (G3E_CCNO,
   G3E_PRJNO,
   G3E_USERNAME,
   G3E_DESCRIPTION,
   G3E_AUTHOR,
   G3E_COMMENTS,
   G3E_LARGEBITMAP,
   G3E_SMALLBITMAP,
   G3E_TOOLTIP,
   G3E_STATUSBARTEXT,
   G3E_COMMANDCLASS,
   G3E_ENABLINGMASK,
   G3E_MODALITY,
   G3E_SELECTSETENABLINGMASK,
   G3E_MENUORDINAL,
   G3E_LOCALECOMMENT,
   G3E_EDITDATE,
   G3E_INTERFACE)
values
  (g3e_customcommand_seq.nextval,
   null,
   'Intergração CRE',
   'Integração CRE',
   'Lucas Turchet',
   'Intergração CRE',
   0,
   0,
   'Intergração CRE',
   'Intergração CRE',
   0,
   8388624,
   0,
   0,
   50,
   null,
   sysdate,
   'CREOi:CREOi.CustomCommand');
commit;

create table CRE_GRID
(
  job_name VARCHAR2(32),
  g3e_fid  NUMBER(10),
  g3e_fno  NUMBER(5),
  grid     VARCHAR2(32),
  erro     VARCHAR2(500)
);

create or replace public synonym CRE_GRID for CRE_GRID;
grant insert, select, delete, update on cre_grid to everyone;

create index idx_netelem_cre on b$gc_netelem(g3e_fno, feature_state, job_id);

create or replace view cre_dados as
select ft.g3e_username as "ENTIDADE", --Armario
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.feature_type as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_itface ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 10300
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Aterramento
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.feature_type as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join GC_GRNDCD ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 19500
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Base de Armário
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.feature_type as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_PBASE ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 2900
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Bloqueio
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.feature_type as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join GC_PSRCON ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 2900
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
   and ps.acessorio = 'BLOQUEIO'
union all
select ft.g3e_username as "ENTIDADE", --Cabo
       ft.g3e_username || '|' || ne.metodo_ir || '|' ||
       ps.descricao_completa as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.descricao_completa as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_CBL ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 7000
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Caixa Subterranea
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.feature_type as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_manhl ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 2700
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Cordoalha
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.feature_type as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_strand ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 2600
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Poste
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.feature_type as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_pole ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 3000
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Emenda
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ne.FTYPE_CRE as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ne.FTYPE_CRE as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_splice ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 10800
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Emenda óptica
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ne.FTYPE_CRE as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ne.FTYPE_CRE as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_fsplice ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 11800
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --ETOA
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ne.FTYPE_CRE as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ne.FTYPE_CRE as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_fterm ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 11900
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", -- CAIXA TERMINAL
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ne.FTYPE_CRE as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ne.FTYPE_CRE as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_term ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 10900
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Trandutor
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ne.FTYPE_CRE as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ne.FTYPE_CRE as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join GC_MARKER ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 19300
   and ps.feature_type = 'TRANSDUTOR'
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --bastidor óptico
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.tipo_onu as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.tipo_onu as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_ispconnect ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 12000
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Símbolo geral
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.feature_type as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_gensym ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 200
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --linha de dutos
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.feature_type as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_cond ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 2200
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --Subduto
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.feature_type as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_IDUCT ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 2100
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --CABO ÓPTICO
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.modo as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.modo as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_FCBL ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 7200
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob()
union all
select ft.g3e_username as "ENTIDADE", --FIO
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.composition as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.composition as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       (select id_cre from G3E_JOB_TAB where g3e_identifier = ltt_user.GetActiveJob()) as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_wir ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 7100
   and ne.feature_state in ('RM', 'INC')
   and ne.job_id = ltt_user.GetActiveJob();


create or replace public synonym cre_dados for cre_dados;
grant select on cre_dados to everyone;


create or replace view cre_view as
select cd.*,
       decode(cg.grid, null, 'Não Processado', cg.grid) as grid,
       cg.erro as erro
  from cre_dados cd
  left join cre_grid cg
    on cg.g3e_fid = cd.fid
   and cg.g3e_fno = cd.fno;


create or replace public synonym cre_view for cre_view;
grant select on cre_view to everyone;


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