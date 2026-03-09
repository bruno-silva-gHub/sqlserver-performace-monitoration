SELECT TOP 10
qs.total_worker_time / qs.execution_count AS avg_cpu_time,
qs.execution_count,
qs.total_elapsed_time / qs.execution_count AS avg_elapsed_time,
SUBSTRING(qt.text,
(qs.statement_start_offset/2)+1,
((CASE qs.statement_end_offset
WHEN -1 THEN DATALENGTH(qt.text)
ELSE qs.statement_end_offset
END - qs.statement_start_offset)/2)+1) AS query_text
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
ORDER BY avg_cpu_time DESC
