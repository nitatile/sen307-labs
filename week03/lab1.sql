
mysql> SELECT VERSION();
+-----------+
| VERSION() |
+-----------+
| 26.10.0   |
+-----------+
1 row in set (0.055 sec)

mysql> SELECT CURRENT_USER();
+----------------+
| CURRENT_USER() |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.064 sec)

mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2026-10-27 00:59:04 |
+---------------------+
1 row in set (0.053 sec)

mysql> STATUS;
--------------
mysql  Ver 26.10.0 for Win64 on x86_64 (MySQL Community Server - GPL)

Connection id:          9
Current database:       sen307_11353
Current user:           root@localhost
SSL:                    Cipher in use is TLS_AES_128_GCM_SHA256
Using delimiter:        ;
Server version:         26.10.0 MySQL Community Server - GPL
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    cp850
Conn.  characterset:    cp850
TCP port:               3306
Binary data as:         Hexadecimal
Uptime:                 10 hours 8 min 46 sec

Threads: 2  Questions: 18  Slow queries: 0  Opens: 137  Flush tables: 3  Open tables: 56  Queries per second avg: 0.000
--------------

mysql> SHOW VARIABLES LIKE 'port';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| port          | 3306  |
+---------------+-------+
1 row in set (0.339 sec)

mysql> SHOW TABLES;
Empty set (0.137 sec)