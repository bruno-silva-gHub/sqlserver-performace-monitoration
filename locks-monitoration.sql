SELECT
blocking_session_id AS bloqueador,
session_id AS bloqueado,
wait_type,
wait_time,
wait_resource
FROM sys.dm_exec_requests
WHERE blocking_session_id <> 0
