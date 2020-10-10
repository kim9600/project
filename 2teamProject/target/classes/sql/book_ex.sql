/*계정생성*/
CREATE USER travelo IDENTIFIED BY travelo

/*권한부여*/
GRANT connect, resource, dba to travelo;

/*계정 락 해제*/
ALTER USER travelo ACCOUNT UNLOCK;














