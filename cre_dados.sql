create or replace view cre_dados as
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--Aterramento
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--Base de Armário
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--Bloqueio
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
   and ps.acessorio = 'BLOQUEIO'
union all
--Cabo
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--Caixa Subterranea
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--Cordoalha
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--Poste
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--Emenda
select ft.g3e_username as "ENTIDADE",
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.FEATURE_TYPE as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.FEATURE_TYPE as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       ne.id_cre as "ID_CRE",
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
union all
--Emenda óptica
select ft.g3e_username as "ENTIDADE",
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.FEATURE_TYPE as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.FEATURE_TYPE as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       ne.id_cre as "ID_CRE",
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
union all
--ETOA
select ft.g3e_username as "ENTIDADE",
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.FEATURE_TYPE as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.FEATURE_TYPE as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       ne.id_cre as "ID_CRE",
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
union all
-- CAIXA TERMINAL
select ft.g3e_username as "ENTIDADE",
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.featuret_cre as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       ne.id_cre as "ID_CRE",
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
union all
--Trandutor
select ft.g3e_username as "ENTIDADE",
       ft.g3e_username || '|' || ne.metodo_ir || '|' || ps.feature_type as "ATIVIDADE",
       ne.fator as "FATOR",
       ne.metodo_ir as "METODO_IR",
       ps.featuret_cre as "FEATURE_TYPE",
       1 as "QTD",
       ne.job_id as "OS",
       ne.g3e_fid as "FID",
       ne.g3e_fno as "FNO",
       ft.g3e_primarygeographiccno as "CNO_MUB",
       decode(ft.g3e_primarydetailcno, null, 0, ft.g3e_primarydetailcno) as "CNO_DET",
       decode(ne.feature_state, 'INC', 'Implantação', 'RM', 'Retirada') as "MACRO_ATIVIDADE",
       ne.id_cre as "ID_CRE",
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
union all
--bastidor óptico
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--Símbolo geral
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--linha de dutos
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all

--Subduto
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--CABO ÓPTICO
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
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
union all
--FIO
select ft.g3e_username as "ENTIDADE",
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
       ne.id_cre as "ID_CRE",
       ne.localidade as "LOCALIDADE",
       ne.switch_centre_clli as "ESTACAO",
       ne.uf as "UF"
  from gc_netelem ne
 inner join gc_wir ps
    on ps.g3e_fid = ne.g3e_fid
 inner join g3e_feature ft
    on ft.g3e_fno = ne.g3e_fno
 where ne.g3e_fno = 7100
   and ne.feature_state in ('RM', 'INC');

create or replace public synonym cre_dados for cre_dados;
grant select on cre_dados to everyone;
