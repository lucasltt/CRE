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
  (g3e_customcommand_seq.net,
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