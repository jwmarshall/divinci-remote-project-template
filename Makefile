SHELL:=pwsh.exe
.SHELLFLAGS:= -NoProfile -Command
POSTGRESQL_HOST=db-postgresql-tor1-18113-do-user-593218-0.b.db.ondigitalocean.com
POSTGRESQL_PORT=25060

postgresql-proxy:
	$(GOPATH)\bin\tcp-proxy.exe -l 0.0.0.0:5432 -r $(POSTGRESQL_HOST):$(POSTGRESQL_PORT)

