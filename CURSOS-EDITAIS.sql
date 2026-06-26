SELECT
    ec.id_edital AS 'Id do Edital',
    ed.descricao AS 'Nome do Edital',
    ed.status AS 'Status do Edital',
    ec.id_curso AS 'Id da Matriz',
    c.nome AS 'Nome da Matriz',
    ec.status AS 'Status da Matriz no Edital'

FROM tb_edital_curso ec

LEFT JOIN tb_edital ed
    ON ec.id_edital = ed.id_edital

LEFT JOIN tb_curso c
    ON ec.id_curso = c.id_curso

WHERE 1=1
AND <WHERE_SUB_QUERY>