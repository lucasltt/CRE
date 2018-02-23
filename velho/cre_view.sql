create or replace view cre_view as
select cd.*,
       decode(cg.grid, null, 'Não Processado', cg.grid) as grid,
       cg.erro as erro
  from cre_dados cd
  left join cre_grid cg
    on cg.g3e_fid = cd.fid
   and cg.g3e_fno = cd.fno;
/


create or replace public synonym cre_view for cre_view;
grant select on cre_view to everyone;