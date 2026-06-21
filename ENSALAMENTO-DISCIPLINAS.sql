SELECT 
  mdpc.id_course AS 'Course ID',
  p.descricao AS 'PERIODO LETIVO',
  s.nome AS 'Semestre',
  mo.nome_red AS 'MODULO',
  db.codigo AS 'DISCIPLINA CODIGO',
  d.descricao AS 'DISCIPLINA DESCRIÇÃO',
  COUNT(md.id_matricula_disciplina) AS 'Qtd Matriculados',
  t.id_turma AS 'ID DA TURMA',
  t.nome AS 'TURMA',
  c.nome AS 'Matriz',
  org.descricao AS 'Org'

FROM tb_disciplina_professor dp

LEFT JOIN tb_moodle_disciplina_professor_course mdpc 
  ON mdpc.id_disciplina_professor = dp.id_disciplina_professor

LEFT JOIN tb_org org 
  ON org.id_org = dp.id_org 
  AND org.status = 'ATIVO'

LEFT JOIN tb_turma t 
  ON t.id_turma = dp.id_turma

LEFT JOIN tb_disciplina d 
  ON d.id_disciplina = dp.id_disciplina

LEFT JOIN tb_disciplina_base db
  ON db.id_disciplina_base = d.id_disciplina_base

LEFT JOIN tb_curso c 
  ON c.id_curso = t.id_curso

LEFT JOIN tb_modulo mo 
  ON mo.id_modulo = d.id_modulo

LEFT JOIN tb_periodo_letivo p 
  ON p.id_periodo_letivo = t.id_periodo_letivo

LEFT JOIN tb_periodo_item s 
  ON s.id_periodo_item = t.id_periodo_item

LEFT JOIN tb_matricula_disciplina md 
  ON md.id_disciplina_professor = dp.id_disciplina_professor
  AND md.status = 'MATRICULADO'

INNER JOIN tb_matricula m 
  ON m.id_matricula = md.id_matricula
  AND m.status IN ('ATIVA', 'AGUARDANDO', 'REENQUADRADA')

WHERE <WHERE_SUB_QUERY>
  AND t.nome NOT LIKE '%-ADP%'

GROUP BY 
  mdpc.id_course,
  p.descricao,
  s.nome,
  mo.nome_red,
  db.codigo,
  d.descricao,
  t.id_turma,
  t.nome,
  c.nome,
  org.descricao;