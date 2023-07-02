CREATE TABLE din.fatgastos (
	 id_movimento int GENERATED ALWAYS AS IDENTITY
	,dt_movimento date not null
	,dt_referencia date not null
	,nome varchar not null
	,id_tipo int not null
	,id_forma_pagto int not null
	,id_parcela int not null
	,desc_complemento varchar null
	,origem varchar not null
	,valor decimal(15,2) not null
	,dt_carga timestamp not null
	,PRIMARY KEY(id_movimento)
	,CONSTRAINT fk_tipo
      FOREIGN KEY(id_tipo) 
	  REFERENCES din.dimtipo(id_tipo)
	,CONSTRAINT fk_id_forma_pagto
      FOREIGN KEY(id_forma_pagto) 
	  REFERENCES din.dimformapagto(id_forma_pagto)
	,CONSTRAINT fk_parcela
      FOREIGN KEY(id_parcela) 
	  REFERENCES din.dim_parcela(id_parcela)
);

CREATE TABLE din.dimtipo (
	 id_tipo int GENERATED ALWAYS AS IDENTITY
	,desc_tipo varchar not null
	,dt_carga timestamp not null
	,PRIMARY KEY(id_tipo)
);

CREATE TABLE din.dimformapagto(
	 id_forma_pagto int GENERATED ALWAYS AS IDENTITY
	,desc_forma_pagto varchar not null
	,dt_carga timestamp not null
	,PRIMARY KEY(id_forma_pagto)
);

CREATE TABLE din.dimparcela(
	 id_parcela int GENERATED ALWAYS AS IDENTITY 
	,desc_parcela varchar not null
	,dt_carga timestamp not null
	,PRIMARY KEY(id_parcela)
);

CREATE TABLE din.fatreceita (
	 id_movimento int GENERATED ALWAYS AS IDENTITY
	,dt_movimento date not null
	,dt_referencia date not null
	,nome varchar not null
	,id_tipo int not null
	,id_parcela int not null
	,desc_complemento varchar null
	,origem varchar not null
	,valor decimal(15,2) not null
	,dt_carga timestamp not null
	,PRIMARY KEY(id_movimento)
	,CONSTRAINT fk_tipo
      FOREIGN KEY(id_tipo) 
	  REFERENCES din.dimtipo(id_tipo)
	,CONSTRAINT fk_parcela
      FOREIGN KEY(id_parcela) 
	  REFERENCES din.dimparcela(id_parcela)
);