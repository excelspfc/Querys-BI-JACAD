SELECT
d.descricao 'DISCIPLINA',
d.nome_red 'SHORTNAME',
dp.id_disciplina_professor 'ID DISCIPLINA PROFESSOR',
mo.nome_red 'MODULO',
dp.data_acesso_ava_inicio 'INICIO AVA',
t.nome 'TURMA',
pl.descricao 'PERIODO LETIVO',
SUBSTRING_INDEX(SUBSTRING_INDEX(t.nome, '(',-1), ')',1) AS 'PERIODO LETIVO REAL',
c.nome 'MATRIZ',
cb.nome_para_impressao2 'CURSO',
cb.nome_para_impressao3 'COORDENADOR DE AREA',
t.nome_red 'TURMA REDUZIDO',
UPPER(pi.nome) 'SEMESTRE DA TURMA',
UPPER(p.nome) 'SEMESTRE DA DISCIPLINA NA MATRIZ',
mdpc.id_course 'ID CURSO VINCULO MOODLE',
d.carga_horaria_teorica AS 'CARGA HORÁRIA TEÓRICA',
d.carga_horaria AS 'CARGA HORÁRIA',
d.carga_horaria_cobrada AS 'CARGA HORÁRIA COBRADA'

FROM tb_disciplina_professor dp

LEFT JOIN tb_turma t ON t.id_turma = dp.id_turma
LEFT JOIN tb_curso c ON c.id_curso = t.id_curso
LEFT JOIN tb_curso_base cb ON cb.id_curso_base = c.id_curso_base
LEFT JOIN tb_disciplina d ON d.id_disciplina = dp.id_disciplina
LEFT JOIN tb_periodo p ON p.id_periodo = d.id_periodo
LEFT JOIN tb_modulo mo ON mo.id_modulo = d.id_modulo
LEFT JOIN tb_periodo_letivo pl ON pl.id_periodo_letivo = t.id_periodo_letivo
LEFT JOIN tb_professor prof ON prof.id_professor = dp.id_professor
LEFT JOIN tb_funcionario f ON  f.id_funcionario = prof.id_funcionario
LEFT JOIN tb_perfil perfil ON  perfil.id_perfil = f.id_perfil
LEFT JOIN tb_professor profcoord ON profcoord.id_professor = c.id_professor_coordenador
LEFT JOIN tb_funcionario fcoord ON fcoord.id_funcionario = profcoord.id_funcionario
LEFT JOIN tb_perfil perfilcoord ON  perfilcoord.id_perfil = fcoord.id_perfil
LEFT JOIN tb_moodle_disciplina_professor_course mdpc ON  mdpc.id_disciplina_professor = dp.id_disciplina_professor
LEFT JOIN tb_periodo_item pi ON  pi.id_periodo_item = t.id_periodo_item

WHERE <WHERE_SUB_QUERY>