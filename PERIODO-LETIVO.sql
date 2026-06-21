SELECT
    pl.id_periodo_letivo AS  'idPeriodoLetivo',
    pl.descricao AS  'descricao',
    pl.data_inicio AS  'dataInicio',
    pl.data_termino AS  'dataTermino',
    pl.periodo_atual AS  'periodoAtual',
    pl.data_inicio_matricula AS  'dataInicioMatricula',
    pl.data_termino_matricula AS  'dataTerminoMatricula',
    pl.id_org AS  'id_org'

FROM tb_periodo_letivo pl

WHERE <WHERE_SUB_QUERY>