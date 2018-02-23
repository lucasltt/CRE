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