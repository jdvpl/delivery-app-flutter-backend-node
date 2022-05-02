DROP TABLE IF EXISTS roles CASCADE;

CREATE TABLE roles(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	image VARCHAR(255) null,
	route VARCHAR(255) null,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);



DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255) NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	phone VARCHAR(80) NOT NULL UNIQUE,
	image VARCHAR(255) NULL,
	password VARCHAR(255) NOT NULL,
	is_available BOOLEAN NULL,
	session_token VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);


DROP TABLE IF EXISTS users_has_roles CASCADE;

CREATE TABLE users_has_roles(
	id_user BIGSERIAL Not NULL,
	id_rol BIGSERIAL Not NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
	FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_rol) REFERENCES roles(id) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (id_user,id_rol)
);

INSERT INTO roles (name,route,created_at,updated_at) values ('CLIENTE','client/products/list','2022-05-02 04:39:56','2022-05-02 04:39:56');
INSERT INTO roles (name,route,created_at,updated_at) values ('RESTAURANTE','restaurant/order/list','2022-05-02 04:39:56','2022-05-02 04:39:56');
INSERT INTO roles (name,route,created_at,updated_at) values ('REPARTIDOR','delivery/order/list','2022-05-02 04:39:56','2022-05-02 04:39:56');