--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: contactos; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE contactos (
    codigo_contacto character varying(10),
    nombre_contacto character varying(100),
    nit_contacto character varying(20),
    ubicacion_contacto character varying(100),
    direccion_contacto character varying(100),
    telefono_contacto character varying(30),
    mail_contacto character varying(30),
    representante_legal character varying(100),
    fecha_creacion character varying(100),
    creador_contacto character varying(100)
);


ALTER TABLE public.contactos OWNER TO admin;

--
-- Name: TABLE contactos; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE contactos IS 'Tabla con contactos frecuentes de la entidad';


--
-- Name: COLUMN contactos.codigo_contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN contactos.codigo_contacto IS 'Identificador ascendente para contactos';


--
-- Name: COLUMN contactos.nombre_contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN contactos.nombre_contacto IS 'Nombre completo con sigla del contacto';


--
-- Name: COLUMN contactos.nit_contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN contactos.nit_contacto IS 'Nit del contacto';


--
-- Name: COLUMN contactos.ubicacion_contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN contactos.ubicacion_contacto IS 'Ubicacion geografica (Continente, Pais, Departamento, Municipio) del contacto';


--
-- Name: COLUMN contactos.direccion_contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN contactos.direccion_contacto IS 'Direccion exacta del contacto';


--
-- Name: COLUMN contactos.telefono_contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN contactos.telefono_contacto IS 'Numero telefonico del contacto';


--
-- Name: COLUMN contactos.mail_contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN contactos.mail_contacto IS 'Correo electronico del contacto';


--
-- Name: COLUMN contactos.representante_legal; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN contactos.representante_legal IS 'Nombre del representante legal o a quien van dirigidas generalmente los radicados';


--
-- Name: COLUMN contactos.fecha_creacion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN contactos.fecha_creacion IS 'Fecha en la que se inserta en base de datos el contacto';


--
-- Name: COLUMN contactos.creador_contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN contactos.creador_contacto IS 'Usuario que inserta el contacto en la base de datos';


--
-- Name: municipios; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE municipios (
    id_continente numeric(1,0) NOT NULL,
    nombre_continente character varying(100) NOT NULL,
    id_pais numeric(4,0),
    nombre_pais character varying(100) NOT NULL,
    id_departamento numeric(4,0),
    nombre_departamento character varying(100) NOT NULL,
    id_municipio numeric(4,0),
    nombre_municipio character varying(100) NOT NULL,
    fecha_creacion character varying(100),
    creador_municipio character varying(100)
);


ALTER TABLE public.municipios OWNER TO admin;

--
-- Name: TABLE municipios; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE municipios IS 'Listado Continentes-Paises-Departamentos-Municipios';


--
-- Name: COLUMN municipios.id_continente; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipios.id_continente IS 'Codigo del Continente';


--
-- Name: COLUMN municipios.nombre_continente; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipios.nombre_continente IS 'Nombre del Continente';


--
-- Name: COLUMN municipios.id_pais; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipios.id_pais IS 'Codigo del Pais';


--
-- Name: COLUMN municipios.nombre_pais; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipios.nombre_pais IS 'Nombre del Pais';


--
-- Name: COLUMN municipios.id_departamento; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipios.id_departamento IS 'Codigo del Departamento';


--
-- Name: COLUMN municipios.nombre_departamento; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipios.nombre_departamento IS 'Nombre del Departamento';


--
-- Name: COLUMN municipios.id_municipio; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipios.id_municipio IS 'Codigo del Municipio';


--
-- Name: COLUMN municipios.nombre_municipio; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipios.nombre_municipio IS 'Nombre del Municipio';


--
-- Name: COLUMN municipios.fecha_creacion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipios.fecha_creacion IS 'Fecha en la que se inserta en base de datos el municipio';


--
-- Name: COLUMN municipios.creador_municipio; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipios.creador_municipio IS 'Usuario que inserta el municipio';


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE usuarios
(
  id_usuario integer NOT NULL DEFAULT nextval('usuarios_id_usuario_seq'::regclass), -- ID del usuario
  codigo_dependencia character varying(5) NOT NULL, -- Codigo de la dependencia del usuario
  login character varying(50) NOT NULL, -- Login del usuario
  pass character varying(35) NOT NULL, -- ContraseÃ±a cifrada del usuario
  estado character varying(10) NOT NULL DEFAULT 1, -- Estado del usuario inactivo (0) o Activo(1)
  perfil character varying(30) NOT NULL, -- Codigo del usuario
  nombre_completo character varying(50) NOT NULL, -- Nombres y apellidos completos del usuario
  usuario_nuevo character varying(5) NOT NULL DEFAULT 1, -- Usuario nuevo (1) usuario no es nuevo (0)
  documento_usuario character varying(15) NOT NULL, -- Numero de documento del usuario
  sesion character varying(30) NOT NULL, -- Sesion actual o Ãºltima sesion del usuario
  fecha_sesion date, -- Fecha de sesion actual o ultima fecha
  nivel_seguridad numeric(2,0) DEFAULT 1, -- Nivel de seguridad del usuario (1 al 5)
  mail_usuario character varying, -- Correo electrÃ³nico del funcionario
  path_foto character varying,
  ventanilla_radicacion character varying(10)
)


ALTER TABLE public.usuarios OWNER TO admin;

--
-- Name: TABLE usuarios; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE usuarios IS 'Tabla de usuarios del sistema';

COMMENT ON COLUMN usuarios.perfil IS 'Codigo del usuario';
COMMENT ON COLUMN usuarios.codigo_dependencia IS 'Codigo de la dependencia del usuario';
COMMENT ON COLUMN usuarios.login IS 'Login del usuario';
COMMENT ON COLUMN usuarios.pass IS 'Contrasena cifrada del usuario';
COMMENT ON COLUMN usuarios.estado IS 'Estado del usuario inactivo (0) o Activo(1)';
COMMENT ON COLUMN usuarios.nombre_completo IS 'Nombres y apellidos completos del usuario';
COMMENT ON COLUMN usuarios.usuario_nuevo IS 'Usuario nuevo (1) usuario no es nuevo (0)';
COMMENT ON COLUMN usuarios.documento_usuario IS 'Numero de documento del usuario';
COMMENT ON COLUMN usuarios.sesion IS 'Sesion actual o ultima sesion del usuario';
COMMENT ON COLUMN usuarios.fecha_sesion IS 'Fecha de sesion actual o ultima fecha';
COMMENT ON COLUMN usuarios.nivel_seguridad IS 'Nivel de seguridad del usuario (1 al 5)';
COMMENT ON COLUMN usuarios.mail_usuario IS 'Correo electronico del funcionario';
COMMENT ON COLUMN usuarios.id_usuario IS 'ID del usuario';


--
-- Data for Name: contactos; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO contactos VALUES ('1', 'INSTITUTO NACIONAL DE VIGILANCIA DE MEDICAMENTOS Y ALIMENTOS  INVIMA', '8300001672', 'AMERICA-COLOMBIA-DC-BOGOTA', 'CARRERA 10 # 64 - 28', '2948700  ', 'jonatanrod@yahoo.es', NULL, NULL, NULL);
INSERT INTO contactos VALUES ('2', 'INSTITUTO NACIONAL PARA CIEGOS INCI', '8600159712', 'AMERICA-COLOMBIA-DC-BOGOTA', 'CARRERA 13 Nº 34 - 91', '5101625 Ext 110 ', 'aciudadano@inci.gov.co ', 'Sonia Cardozo', NULL, 'Parametrización inicial');


--
-- Data for Name: municipios; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 1, 'LETICIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 503, 'OPORAPA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 518, 'PAICOL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 524, 'PALERMO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 530, 'PALESTINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 548, 'PITAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 551, 'PITALITO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 615, 'RIVERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 660, 'SALADOBLANCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 668, 'SAN AGUSTIN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 676, 'SANTA MARIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 770, 'SUAZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 791, 'TARQUI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 797, 'TESALIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 799, 'TELLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 801, 'TERUEL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 807, 'TIMANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 872, 'VILLAVIEJA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 885, 'YAGUARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 1, 'RIOHACHA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 35, 'ALBANIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 78, 'BARRANCAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 90, 'DIBULLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 98, 'DISTRACCION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 110, 'EL MOLINO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 279, 'FONSECA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 378, 'HATONUEVO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 420, 'LA JAGUA DEL PILAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 430, 'MAICAO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 560, 'MANAURE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 650, 'SAN JUAN DEL CESAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 847, 'URIBIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 855, 'URUMITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 44, 'LA GUAJIRA', 874, 'VILLANUEVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 1, 'SANTA MARTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 30, 'ALGARROBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 53, 'ARACATACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 58, 'ARIGUANI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 161, 'CERRO SAN ANTONIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 170, 'CHIBOLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 189, 'CIENAGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 205, 'CONCORDIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 245, 'EL BANCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 258, 'EL PIÑON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 268, 'EL RETEN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 288, 'FUNDACION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 318, 'GUAMAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 460, 'NUEVA GRANADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 541, 'PEDRAZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 430, 'LA VICTORIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 401, 'LA VICTORIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 403, 'LA VICTORIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 31, 'AMALFI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 34, 'ANDES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 36, 'ANGELOPOLIS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 38, 'ANGOSTURA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 40, 'ANORI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 42, 'SANTAFE DE ANTIOQUIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 44, 'ANZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 45, 'APARTADO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 51, 'ARBOLETES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 55, 'ARGELIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 59, 'ARMENIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 79, 'BARBOSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 86, 'BELMIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 88, 'BELLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 91, 'BETANIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 93, 'BETULIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 101, 'CIUDAD BOLIVAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 107, 'BRICEÑO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 113, 'BURITICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 120, 'CACERES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 125, 'CAICEDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 129, 'CALDAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 134, 'CAMPAMENTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 138, 'CAÑASGORDAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 142, 'CARACOLI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 145, 'CARAMANTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 147, 'CAREPA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 148, 'EL CARMEN DE VIBORAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 150, 'CAROLINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 154, 'CAUCASIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 172, 'CHIGORODO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 190, 'CISNEROS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 197, 'COCORNA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 206, 'CONCEPCION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 209, 'CONCORDIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 212, 'COPACABANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 234, 'DABEIBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 237, 'DON MATIAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 240, 'EBEJICO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 250, 'EL BAGRE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 264, 'ENTRERRIOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 266, 'ENVIGADO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 282, 'FREDONIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 284, 'FRONTINO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 306, 'GIRALDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 308, 'GIRARDOTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 310, 'GOMEZ PLATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 313, 'GRANADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 315, 'GUADALUPE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 318, 'GUARNE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 321, 'GUATAPE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 347, 'HELICONIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 353, 'HISPANIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 360, 'ITAGUI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 361, 'ITUANGO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 364, 'JARDIN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 368, 'JERICO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 376, 'LA CEJA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 380, 'LA ESTRELLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 390, 'LA PINTADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 400, 'LA UNION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 411, 'LIBORINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 425, 'MACEO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 440, 'MARINILLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 467, 'MONTEBELLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 475, 'MURINDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 480, 'MUTATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 483, 'NARIÑO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 490, 'NECOCLI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 495, 'NECHI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 501, 'OLAYA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 541, 'PEÐOL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 543, 'PEQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 576, 'PUEBLORRICO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 579, 'PUERTO BERRIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 585, 'PUERTO NARE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 591, 'PUERTO TRIUNFO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 604, 'REMEDIOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 607, 'RETIRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 615, 'RIONEGRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 628, 'SABANALARGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 631, 'SABANETA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 642, 'SALGAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 647, 'SAN ANDRES DE CUERQUIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 649, 'SAN CARLOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 652, 'SAN FRANCISCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 656, 'SAN JERONIMO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 658, 'SAN JOSE DE LA MONTAÑA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 659, 'SAN JUAN DE URABA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 660, 'SAN LUIS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 664, 'SAN PEDRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 665, 'SAN PEDRO DE URABA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 667, 'SAN RAFAEL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 670, 'SAN ROQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 674, 'SAN VICENTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 679, 'SANTA BARBARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 686, 'SANTA ROSA DE OSOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 690, 'SANTO DOMINGO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 697, 'EL SANTUARIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 736, 'SEGOVIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 756, 'SONSON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 761, 'SOPETRAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 789, 'TAMESIS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 790, 'TARAZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 792, 'TARSO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 809, 'TITIRIBI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 819, 'TOLEDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 837, 'TURBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 842, 'URAMITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 847, 'URRAO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 854, 'VALDIVIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 856, 'VALPARAISO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 858, 'VEGACHI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 861, 'VENECIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 873, 'VIGIA DEL FUERTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 885, 'YALI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 887, 'YARUMAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 890, 'YOLOMBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 893, 'YONDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 895, 'ZARAGOZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 81, 'ARAUCA', 1, 'ARAUCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 81, 'ARAUCA', 65, 'ARAUQUITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 81, 'ARAUCA', 220, 'CRAVO NORTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 81, 'ARAUCA', 300, 'FORTUL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 81, 'ARAUCA', 591, 'PUERTO RONDON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 81, 'ARAUCA', 736, 'SARAVENA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 81, 'ARAUCA', 794, 'TAME', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 1, 'BARRANQUILLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 78, 'BARANOA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 137, 'CAMPO DE LA CRUZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 141, 'CANDELARIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 296, 'GALAPA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 372, 'JUAN DE ACOSTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 421, 'LURUACO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 433, 'MALAMBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 436, 'MANATI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 520, 'PALMAR DE VARELA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 549, 'PIOJO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 558, 'POLONUEVO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 560, 'PONEDERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 573, 'PUERTO COLOMBIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 606, 'REPELON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 634, 'SABANAGRANDE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 638, 'SABANALARGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 675, 'SANTA LUCIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 685, 'SANTO TOMAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 758, 'SOLEDAD', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 770, 'SUAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 832, 'TUBARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 8, 'ATLANTICO', 849, 'USIACURI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 11, 'BOGOTA', 1, 'BOGOTA, D.C.', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 1, 'CARTAGENA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 6, 'ACHI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 30, 'ALTOS DEL ROSARIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 42, 'ARENAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 52, 'ARJONA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 62, 'ARROYOHONDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 74, 'BARRANCO DE LOBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 140, 'CALAMAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 160, 'CANTAGALLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 188, 'CICUCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 212, 'CORDOBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 222, 'CLEMENCIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 244, 'EL CARMEN DE BOLIVAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 248, 'EL GUAMO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 268, 'EL PEÑON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 300, 'HATILLO DE LOBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 430, 'MAGANGUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 433, 'MAHATES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 440, 'MARGARITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 442, 'MARIA LA BAJA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 458, 'MONTECRISTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 468, 'MOMPOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 473, 'MORALES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 490, 'NOROSI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 549, 'PINILLOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 580, 'REGIDOR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 600, 'RIO VIEJO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 620, 'SAN CRISTOBAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 647, 'SAN ESTANISLAO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 650, 'SAN FERNANDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 654, 'SAN JACINTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 655, 'SAN JACINTO DEL CAUCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 657, 'SAN JUAN NEPOMUCENO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 667, 'SAN MARTIN DE LOBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 670, 'SAN PABLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 673, 'SANTA CATALINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 683, 'SANTA ROSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 688, 'SANTA ROSA DEL SUR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 744, 'SIMITI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 760, 'SOPLAVIENTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 780, 'TALAIGUA NUEVO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 810, 'TIQUISIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 836, 'TURBACO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 838, 'TURBANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 873, 'VILLANUEVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 13, 'BOLIVAR', 894, 'ZAMBRANO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 1, 'TUNJA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 22, 'ALMEIDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 47, 'AQUITANIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 51, 'ARCABUCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 87, 'BELEN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 90, 'BERBEO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 92, 'BETEITIVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 97, 'BOAVITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 104, 'BOYACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 106, 'BRICEÑO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 109, 'BUENAVISTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 114, 'BUSBANZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 131, 'CALDAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 135, 'CAMPOHERMOSO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 162, 'CERINZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 172, 'CHINAVITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 176, 'CHIQUINQUIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 180, 'CHISCAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 183, 'CHITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 185, 'CHITARAQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 187, 'CHIVATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 189, 'CIENEGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 204, 'COMBITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 212, 'COPER', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 215, 'CORRALES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 218, 'COVARACHIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 223, 'CUBARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 224, 'CUCAITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 226, 'CUITIVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 232, 'CHIQUIZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 236, 'CHIVOR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 238, 'DUITAMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 244, 'EL COCUY', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 248, 'EL ESPINO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 272, 'FIRAVITOBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 276, 'FLORESTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 293, 'GACHANTIVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 296, 'GAMEZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 299, 'GARAGOA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 317, 'GUACAMAYAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 322, 'GUATEQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 325, 'GUAYATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 332, 'GsICAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 362, 'IZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 367, 'JENESANO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 368, 'JERICO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 377, 'LABRANZAGRANDE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 380, 'LA CAPILLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 403, 'LA UVITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 407, 'VILLA DE LEYVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 425, 'MACANAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 442, 'MARIPI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 455, 'MIRAFLORES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 464, 'MONGUA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 466, 'MONGUI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 469, 'MONIQUIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 476, 'MOTAVITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 480, 'MUZO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 491, 'NOBSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 494, 'NUEVO COLON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 500, 'OICATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 507, 'OTANCHE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 511, 'PACHAVITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 514, 'PAEZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 516, 'PAIPA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 518, 'PAJARITO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 522, 'PANQUEBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 531, 'PAUNA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 533, 'PAYA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 537, 'PAZ DE RIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 542, 'PESCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 550, 'PISBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 572, 'PUERTO BOYACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 580, 'QUIPAMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 599, 'RAMIRIQUI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 600, 'RAQUIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 621, 'RONDON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 632, 'SABOYA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 638, 'SACHICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 646, 'SAMACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 660, 'SAN EDUARDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 664, 'SAN JOSE DE PARE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 667, 'SAN LUIS DE GACENO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 673, 'SAN MATEO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 676, 'SAN MIGUEL DE SEMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 681, 'SAN PABLO DE BORBUR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 686, 'SANTANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 690, 'SANTA MARIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 693, 'SANTA ROSA DE VITERBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 696, 'SANTA SOFIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 720, 'SATIVANORTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 723, 'SATIVASUR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 740, 'SIACHOQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 753, 'SOATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 755, 'SOCOTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 757, 'SOCHA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 759, 'SOGAMOSO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 761, 'SOMONDOCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 762, 'SORA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 763, 'SOTAQUIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 764, 'SORACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 774, 'SUSACON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 776, 'SUTAMARCHAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 778, 'SUTATENZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 790, 'TASCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 798, 'TENZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 804, 'TIBANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 806, 'TIBASOSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 808, 'TINJACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 810, 'TIPACOQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 814, 'TOCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 816, 'TOGsI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 820, 'TOPAGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 822, 'TOTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 832, 'TUNUNGUA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 835, 'TURMEQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 837, 'TUTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 839, 'TUTAZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 842, 'UMBITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 861, 'VENTAQUEMADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 879, 'VIRACACHA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 15, 'BOYACA', 897, 'ZETAQUIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 1, 'MANIZALES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 13, 'AGUADAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 42, 'ANSERMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 50, 'ARANZAZU', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 88, 'BELALCAZAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 174, 'CHINCHINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 272, 'FILADELFIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 380, 'LA DORADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 388, 'LA MERCED', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 433, 'MANZANARES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 442, 'MARMATO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 444, 'MARQUETALIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 446, 'MARULANDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 486, 'NEIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 495, 'NORCASIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 513, 'PACORA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 524, 'PALESTINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 541, 'PENSILVANIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 614, 'RIOSUCIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 616, 'RISARALDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 653, 'SALAMINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 662, 'SAMANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 665, 'SAN JOSE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 777, 'SUPIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 867, 'VICTORIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 873, 'VILLAMARIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 17, 'CALDAS', 877, 'VITERBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 1, 'FLORENCIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 29, 'ALBANIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 94, 'BELEN DE LOS ANDAQUIES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 150, 'CARTAGENA DEL CHAIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 205, 'CURILLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 247, 'EL DONCELLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 256, 'EL PAUJIL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 410, 'LA MONTAÑITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 460, 'MILAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 479, 'MORELIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 592, 'PUERTO RICO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 610, 'SAN JOSE DEL FRAGUA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 753, 'SAN VICENTE DEL CAGUAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 756, 'SOLANO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 785, 'SOLITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 18, 'CAQUETA', 860, 'VALPARAISO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 1, 'YOPAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 10, 'AGUAZUL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 15, 'CHAMEZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 125, 'HATO COROZAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 136, 'LA SALINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 139, 'MANI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 162, 'MONTERREY', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 225, 'NUNCHIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 230, 'OROCUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 250, 'PAZ DE ARIPORO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 263, 'PORE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 279, 'RECETOR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 300, 'SABANALARGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 315, 'SACAMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 325, 'SAN LUIS DE PALENQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 400, 'TAMARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 410, 'TAURAMENA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 430, 'TRINIDAD', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 85, 'CASANARE', 440, 'VILLANUEVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 300, 'GUACHENE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 1, 'POPAYAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 22, 'ALMAGUER', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 50, 'ARGELIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 75, 'BALBOA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 100, 'BOLIVAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 110, 'BUENOS AIRES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 130, 'CAJIBIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 137, 'CALDONO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 142, 'CALOTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 212, 'CORINTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 256, 'EL TAMBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 290, 'FLORENCIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 318, 'GUAPI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 355, 'INZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 364, 'JAMBALO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 392, 'LA SIERRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 397, 'LA VEGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 418, 'LOPEZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 450, 'MERCADERES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 455, 'MIRANDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 473, 'MORALES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 513, 'PADILLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 517, 'PAEZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 532, 'PATIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 533, 'PIAMONTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 548, 'PIENDAMO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 573, 'PUERTO TEJADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 585, 'PURACE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 622, 'ROSAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 693, 'SAN SEBASTIAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 698, 'SANTANDER DE QUILICHAO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 701, 'SANTA ROSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 743, 'SILVIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 760, 'SOTARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 780, 'SUAREZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 785, 'SUCRE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 807, 'TIMBIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 809, 'TIMBIQUI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 821, 'TORIBIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 824, 'TOTORO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 19, 'CAUCA', 845, 'VILLA RICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 1, 'VALLEDUPAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 11, 'AGUACHICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 13, 'AGUSTIN CODAZZI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 32, 'ASTREA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 45, 'BECERRIL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 60, 'BOSCONIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 175, 'CHIMICHAGUA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 178, 'CHIRIGUANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 228, 'CURUMANI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 238, 'EL COPEY', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 250, 'EL PASO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 295, 'GAMARRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 310, 'GONZALEZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 383, 'LA GLORIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 400, 'LA JAGUA DE IBIRICO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 443, 'MANAURE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 517, 'PAILITAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 550, 'PELAYA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 570, 'PUEBLO BELLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 614, 'RIO DE ORO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 621, 'LA PAZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 710, 'SAN ALBERTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 750, 'SAN DIEGO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 770, 'SAN MARTIN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 20, 'CESAR', 787, 'TAMALAMEQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 1, 'QUIBDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 6, 'ACANDI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 25, 'ALTO BAUDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 50, 'ATRATO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 73, 'BAGADO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 75, 'BAHIA SOLANO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 77, 'BAJO BAUDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 99, 'BOJAYA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 135, 'EL CANTON DEL SAN PABLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 150, 'CARMEN DEL DARIEN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 160, 'CERTEGUI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 205, 'CONDOTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 245, 'EL CARMEN DE ATRATO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 250, 'EL LITORAL DEL SAN JUAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 361, 'ISTMINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 372, 'JURADO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 413, 'LLORO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 425, 'MEDIO ATRATO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 430, 'MEDIO BAUDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 450, 'MEDIO SAN JUAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 491, 'NOVITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 495, 'NUQUI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 580, 'RIO IRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 600, 'RIO QUITO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 615, 'RIOSUCIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 660, 'SAN JOSE DEL PALMAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 745, 'SIPI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 787, 'TADO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 800, 'UNGUIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 27, 'CHOCO', 810, 'UNION PANAMERICANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 1, 'MONTERIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 68, 'AYAPEL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 79, 'BUENAVISTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 90, 'CANALETE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 162, 'CERETE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 168, 'CHIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 182, 'CHINU', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 189, 'CIENAGA DE ORO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 300, 'COTORRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 350, 'LA APARTADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 417, 'LORICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 419, 'LOS CORDOBAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 464, 'MOMIL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 466, 'MONTELIBANO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 500, 'MOÑITOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 555, 'PLANETA RICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 570, 'PUEBLO NUEVO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 574, 'PUERTO ESCONDIDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 580, 'PUERTO LIBERTADOR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 586, 'PURISIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 660, 'SAHAGUN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 670, 'SAN ANDRES SOTAVENTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 672, 'SAN ANTERO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 675, 'SAN BERNARDO DEL VIENTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 678, 'SAN CARLOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 686, 'SAN PELAYO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 807, 'TIERRALTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 23, 'CORDOBA', 855, 'VALENCIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 1, 'AGUA DE DIOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 19, 'ALBAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 35, 'ANAPOIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 40, 'ANOLAIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 53, 'ARBELAEZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 86, 'BELTRAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 95, 'BITUIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 99, 'BOJACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 120, 'CABRERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 123, 'CACHIPAY', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 126, 'CAJICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 148, 'CAPARRAPI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 151, 'CAQUEZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 154, 'CARMEN DE CARUPA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 168, 'CHAGUANI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 175, 'CHIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 178, 'CHIPAQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 181, 'CHOACHI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 183, 'CHOCONTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 200, 'COGUA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 214, 'COTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 224, 'CUCUNUBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 245, 'EL COLEGIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 258, 'EL PEÑON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 260, 'EL ROSAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 269, 'FACATATIVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 279, 'FOMEQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 281, 'FOSCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 286, 'FUNZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 288, 'FUQUENE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 290, 'FUSAGASUGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 293, 'GACHALA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 295, 'GACHANCIPA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 297, 'GACHETA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 299, 'GAMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 307, 'GIRARDOT', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 312, 'GRANADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 317, 'GUACHETA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 320, 'GUADUAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 322, 'GUASCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 324, 'GUATAQUI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 326, 'GUATAVITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 328, 'GUAYABAL DE SIQUIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 335, 'GUAYABETAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 339, 'GUTIERREZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 368, 'JERUSALEN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 372, 'JUNIN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 377, 'LA CALERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 386, 'LA MESA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 394, 'LA PALMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 398, 'LA PEÑA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 402, 'LA VEGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 407, 'LENGUAZAQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 426, 'MACHETA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 26, 'ALVARADO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 430, 'MADRID', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 436, 'MANTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 438, 'MEDINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 473, 'MOSQUERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 483, 'NARIÑO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 486, 'NEMOCON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 488, 'NILO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 489, 'NIMAIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 491, 'NOCAIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 506, 'VENECIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 513, 'PACHO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 518, 'PAIME', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 524, 'PANDI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 530, 'PARATEBUENO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 535, 'PASCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 572, 'PUERTO SALGAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 580, 'PULI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 592, 'QUEBRADANEGRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 594, 'QUETAME', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 596, 'QUIPILE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 599, 'APULO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 612, 'RICAURTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 645, 'SAN ANTONIO DEL TEQUENDAMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 649, 'SAN BERNARDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 653, 'SAN CAYETANO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 658, 'SAN FRANCISCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 662, 'SAN JUAN DE RIO SECO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 718, 'SASAIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 736, 'SESQUILE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 740, 'SIBATE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 743, 'SILVANIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 745, 'SIMIJACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 754, 'SOACHA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 758, 'SOPO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 769, 'SUBACHOQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 772, 'SUESCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 777, 'SUPATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 779, 'SUSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 781, 'SUTATAUSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 785, 'TABIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 793, 'TAUSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 797, 'TENA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 799, 'TENJO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 805, 'TIBACUY', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 807, 'TIBIRITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 815, 'TOCAIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 817, 'TOCANCIPA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 823, 'TOPAIPI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 839, 'UBALA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 263, 'EL ENCANTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 405, 'LA CHORRERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 407, 'LA PEDRERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 460, 'MIRITI - PARANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 530, 'PUERTO ALEGRIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 536, 'PUERTO ARICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 540, 'PUERTO NARIÑO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 669, 'PUERTO SANTANDER', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 91, 'AMAZONAS', 798, 'TARAPACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 1, 'MEDELLIN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 2, 'ABEJORRAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 4, 'ABRIAQUI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 21, 'ALEJANDRIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 5, 'ANTIOQUIA', 30, 'AMAGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 890, 'YOTOCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 892, 'YUMBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 895, 'ZARZAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 97, 'VAUPES', 511, 'PACOA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 97, 'VAUPES', 1, 'MITU', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 97, 'VAUPES', 161, 'CARURU', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 97, 'VAUPES', 666, 'TARAIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 97, 'VAUPES', 777, 'PAPUNAUA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 97, 'VAUPES', 889, 'YAVARATE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 99, 'VICHADA', 1, 'PUERTO CARREÑO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 99, 'VICHADA', 524, 'LA PRIMAVERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 99, 'VICHADA', 624, 'SANTA ROSALIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 99, 'VICHADA', 773, 'CUMARIBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 841, 'UBAQUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 843, 'VILLA DE SAN DIEGO DE UBATE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 845, 'UNE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 851, 'UTICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 862, 'VERGARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 867, 'VIANI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 871, 'VILLAGOMEZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 873, 'VILLAPINZON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 875, 'VILLETA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 878, 'VIOTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 885, 'YACOPI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 898, 'ZIPACON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 25, 'CUNDINAMARCA', 899, 'ZIPAQUIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 94, 'GUAINIA', 663, 'MAPIRIPANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 94, 'GUAINIA', 887, 'PANA PANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 94, 'GUAINIA', 888, 'MORICHAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 94, 'GUAINIA', 1, 'INIRIDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 94, 'GUAINIA', 343, 'BARRANCO MINAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 94, 'GUAINIA', 883, 'SAN FELIPE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 94, 'GUAINIA', 884, 'PUERTO COLOMBIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 94, 'GUAINIA', 885, 'LA GUADALUPE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 94, 'GUAINIA', 886, 'CACAHUAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 95, 'GUAVIARE', 1, 'SAN JOSE DEL GUAVIARE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 95, 'GUAVIARE', 15, 'CALAMAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 95, 'GUAVIARE', 25, 'EL RETORNO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 95, 'GUAVIARE', 200, 'MIRAFLORES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 1, 'NEIVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 6, 'ACEVEDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 13, 'AGRADO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 16, 'AIPE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 20, 'ALGECIRAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 26, 'ALTAMIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 78, 'BARAYA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 132, 'CAMPOALEGRE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 206, 'COLOMBIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 244, 'ELIAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 298, 'GARZON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 306, 'GIGANTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 319, 'GUADALUPE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 349, 'HOBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 357, 'IQUIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 359, 'ISNOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 378, 'LA ARGENTINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 396, 'LA PLATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 41, 'HUILA', 483, 'NATAGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 545, 'PIJIÑO DEL CARMEN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 551, 'PIVIJAY', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 555, 'PLATO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 570, 'PUEBLOVIEJO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 605, 'REMOLINO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 660, 'SABANAS DE SAN ANGEL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 675, 'SALAMINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 692, 'SAN SEBASTIAN DE BUENAVISTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 703, 'SAN ZENON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 707, 'SANTA ANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 720, 'SANTA BARBARA DE PINTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 745, 'SITIONUEVO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 798, 'TENERIFE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 960, 'ZAPAYAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 47, 'MAGDALENA', 980, 'ZONA BANANERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 1, 'VILLAVICENCIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 6, 'ACACIAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 110, 'BARRANCA DE UPIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 124, 'CABUYARO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 150, 'CASTILLA LA NUEVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 223, 'CUBARRAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 226, 'CUMARAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 245, 'EL CALVARIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 251, 'EL CASTILLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 270, 'EL DORADO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 287, 'FUENTE DE ORO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 313, 'GRANADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 318, 'GUAMAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 325, 'MAPIRIPAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 330, 'MESETAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 350, 'LA MACARENA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 370, 'URIBE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 400, 'LEJANIAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 450, 'PUERTO CONCORDIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 568, 'PUERTO GAITAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 573, 'PUERTO LOPEZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 577, 'PUERTO LLERAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 590, 'PUERTO RICO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 606, 'RESTREPO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 680, 'SAN CARLOS DE GUAROA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 683, 'SAN JUAN DE ARAMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 686, 'SAN JUANITO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 689, 'SAN MARTIN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 50, 'META', 711, 'VISTAHERMOSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 1, 'CUCUTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 3, 'ABREGO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 51, 'ARBOLEDAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 99, 'BOCHALEMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 109, 'BUCARASICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 125, 'CACOTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 128, 'CACHIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 172, 'CHINACOTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 174, 'CHITAGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 206, 'CONVENCION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 223, 'CUCUTILLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 239, 'DURANIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 245, 'EL CARMEN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 250, 'EL TARRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 261, 'EL ZULIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 313, 'GRAMALOTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 344, 'HACARI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 347, 'HERRAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 377, 'LABATECA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 385, 'LA ESPERANZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 398, 'LA PLAYA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 405, 'LOS PATIOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 418, 'LOURDES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 480, 'MUTISCUA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 498, 'OCAÑA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 518, 'PAMPLONA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 520, 'PAMPLONITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 553, 'PUERTO SANTANDER', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 599, 'RAGONVALIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 660, 'SALAZAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 670, 'SAN CALIXTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 673, 'SAN CAYETANO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 680, 'SANTIAGO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 720, 'SARDINATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 743, 'SILOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 800, 'TEORAMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 810, 'TIBU', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 820, 'TOLEDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 871, 'VILLA CARO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 54, 'N. DE SANTANDER', 874, 'VILLA DEL ROSARIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 1, 'PASTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 19, 'ALBAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 22, 'ALDANA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 36, 'ANCUYA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 51, 'ARBOLEDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 79, 'BARBACOAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 83, 'BELEN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 110, 'BUESACO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 203, 'COLON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 207, 'CONSACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 210, 'CONTADERO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 215, 'CORDOBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 224, 'CUASPUD', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 227, 'CUMBAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 233, 'CUMBITARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 240, 'CHACHAGsI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 250, 'EL CHARCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 254, 'EL PEÑOL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 256, 'EL ROSARIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 258, 'EL TABLON DE GOMEZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 260, 'EL TAMBO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 287, 'FUNES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 317, 'GUACHUCAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 320, 'GUAITARILLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 323, 'GUALMATAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 352, 'ILES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 354, 'IMUES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 356, 'IPIALES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 378, 'LA CRUZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 381, 'LA FLORIDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 385, 'LA LLANADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 390, 'LA TOLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 399, 'LA UNION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 405, 'LEIVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 411, 'LINARES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 418, 'LOS ANDES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 427, 'MAGsI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 435, 'MALLAMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 473, 'MOSQUERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 480, 'NARIÑO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 490, 'OLAYA HERRERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 506, 'OSPINA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 520, 'FRANCISCO PIZARRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 540, 'POLICARPA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 560, 'POTOSI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 565, 'PROVIDENCIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 573, 'PUERRES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 585, 'PUPIALES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 612, 'RICAURTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 621, 'ROBERTO PAYAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 678, 'SAMANIEGO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 683, 'SANDONA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 685, 'SAN BERNARDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 687, 'SAN LORENZO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 693, 'SAN PABLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 694, 'SAN PEDRO DE CARTAGO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 696, 'SANTA BARBARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 699, 'SANTACRUZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 720, 'SAPUYES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 786, 'TAMINANGO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 788, 'TANGUA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 835, 'SAN ANDRES DE TUMACO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 838, 'TUQUERRES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 52, 'NARIÑO', 885, 'YACUANQUER', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 1, 'MOCOA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 219, 'COLON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 320, 'ORITO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 568, 'PUERTO ASIS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 569, 'PUERTO CAICEDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 571, 'PUERTO GUZMAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 573, 'LEGUIZAMO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 749, 'SIBUNDOY', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 755, 'SAN FRANCISCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 757, 'SAN MIGUEL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 760, 'SANTIAGO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 865, 'VALLE DEL GUAMUEZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 86, 'PUTUMAYO', 885, 'VILLAGARZON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 1, 'ARMENIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 111, 'BUENAVISTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 130, 'CALARCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 190, 'CIRCASIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 212, 'CORDOBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 272, 'FILANDIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 302, 'GENOVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 401, 'LA TEBAIDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 470, 'MONTENEGRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 548, 'PIJAO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 594, 'QUIMBAYA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 63, 'QUINDIO', 690, 'SALENTO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 1, 'PEREIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 45, 'APIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 75, 'BALBOA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 88, 'BELEN DE UMBRIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 170, 'DOSQUEBRADAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 318, 'GUATICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 383, 'LA CELIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 400, 'LA VIRGINIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 440, 'MARSELLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 456, 'MISTRATO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 572, 'PUEBLO RICO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 594, 'QUINCHIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 682, 'SANTA ROSA DE CABAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 66, 'RISARALDA', 687, 'SANTUARIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 88, 'SAN ANDRES', 1, 'SAN ANDRES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 88, 'SAN ANDRES', 564, 'PROVIDENCIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 1, 'BUCARAMANGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 13, 'AGUADA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 20, 'ALBANIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 51, 'ARATOCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 77, 'BARBOSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 79, 'BARICHARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 81, 'BARRANCABERMEJA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 92, 'BETULIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 101, 'BOLIVAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 121, 'CABRERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 132, 'CALIFORNIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 147, 'CAPITANEJO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 152, 'CARCASI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 160, 'CEPITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 162, 'CERRITO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 167, 'CHARALA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 169, 'CHARTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 176, 'CHIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 179, 'CHIPATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 190, 'CIMITARRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 207, 'CONCEPCION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 209, 'CONFINES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 211, 'CONTRATACION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 217, 'COROMORO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 229, 'CURITI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 235, 'EL CARMEN DE CHUCURI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 245, 'EL GUACAMAYO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 250, 'EL PEÑON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 255, 'EL PLAYON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 264, 'ENCINO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 266, 'ENCISO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 271, 'FLORIAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 276, 'FLORIDABLANCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 296, 'GALAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 298, 'GAMBITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 307, 'GIRON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 318, 'GUACA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 320, 'GUADALUPE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 322, 'GUAPOTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 324, 'GUAVATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 327, 'GsEPSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 344, 'HATO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 368, 'JESUS MARIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 370, 'JORDAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 377, 'LA BELLEZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 385, 'LANDAZURI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 397, 'LA PAZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 406, 'LEBRIJA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 418, 'LOS SANTOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 425, 'MACARAVITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 432, 'MALAGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 444, 'MATANZA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 464, 'MOGOTES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 468, 'MOLAGAVITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 498, 'OCAMONTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 500, 'OIBA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 502, 'ONZAGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 522, 'PALMAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 524, 'PALMAS DEL SOCORRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 533, 'PARAMO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 547, 'PIEDECUESTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 549, 'PINCHOTE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 572, 'PUENTE NACIONAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 573, 'PUERTO PARRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 575, 'PUERTO WILCHES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 615, 'RIONEGRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 655, 'SABANA DE TORRES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 669, 'SAN ANDRES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 673, 'SAN BENITO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 679, 'SAN GIL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 682, 'SAN JOAQUIN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 684, 'SAN JOSE DE MIRANDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 686, 'SAN MIGUEL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 689, 'SAN VICENTE DE CHUCURI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 705, 'SANTA BARBARA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 720, 'SANTA HELENA DEL OPON', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 745, 'SIMACOTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 755, 'SOCORRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 770, 'SUAITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 773, 'SUCRE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 780, 'SURATA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 820, 'TONA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 855, 'VALLE DE SAN JOSE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 861, 'VELEZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 867, 'VETAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 872, 'VILLANUEVA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 68, 'SANTANDER', 895, 'ZAPATOCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 1, 'SINCELEJO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 110, 'BUENAVISTA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 124, 'CAIMITO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 204, 'COLOSO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 215, 'COROZAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 221, 'COVEÑAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 230, 'CHALAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 233, 'EL ROBLE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 235, 'GALERAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 265, 'GUARANDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 400, 'LA UNION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 418, 'LOS PALMITOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 429, 'MAJAGUAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 473, 'MORROA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 508, 'OVEJAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 523, 'PALMITO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 670, 'SAMPUES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 678, 'SAN BENITO ABAD', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 702, 'SAN JUAN DE BETULIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 708, 'SAN MARCOS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 713, 'SAN ONOFRE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 717, 'SAN PEDRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 742, 'SAN LUIS DE SINCE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 771, 'SUCRE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 820, 'SANTIAGO DE TOLU', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 70, 'SUCRE', 823, 'TOLU VIEJO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 1, 'IBAGUE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 24, 'ALPUJARRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 30, 'AMBALEMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 43, 'ANZOATEGUI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 55, 'ARMERO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 67, 'ATACO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 124, 'CAJAMARCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 148, 'CARMEN DE APICALA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 152, 'CASABIANCA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 168, 'CHAPARRAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 200, 'COELLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 217, 'COYAIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 226, 'CUNDAY', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 236, 'DOLORES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 268, 'ESPINAL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 270, 'FALAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 275, 'FLANDES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 283, 'FRESNO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 319, 'GUAMO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 347, 'HERVEO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 349, 'HONDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 352, 'ICONONZO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 408, 'LERIDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 411, 'LIBANO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 443, 'MARIQUITA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 449, 'MELGAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 461, 'MURILLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 483, 'NATAGAIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 504, 'ORTEGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 520, 'PALOCABILDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 547, 'PIEDRAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 555, 'PLANADAS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 563, 'PRADO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 585, 'PURIFICACION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 616, 'RIOBLANCO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 622, 'RONCESVALLES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 624, 'ROVIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 671, 'SALDAÑA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 675, 'SAN ANTONIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 678, 'SAN LUIS', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 686, 'SANTA ISABEL', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 770, 'SUAREZ', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 854, 'VALLE DE SAN JUAN', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 861, 'VENADILLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 870, 'VILLAHERMOSA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 73, 'TOLIMA', 873, 'VILLARRICA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 1, 'CALI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 20, 'ALCALA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 36, 'ANDALUCIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 41, 'ANSERMANUEVO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 54, 'ARGELIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 100, 'BOLIVAR', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 109, 'BUENAVENTURA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 111, 'GUADALAJARA DE BUGA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 113, 'BUGALAGRANDE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 122, 'CAICEDONIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 126, 'CALIMA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 130, 'CANDELARIA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 147, 'CARTAGO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 233, 'DAGUA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 243, 'EL AGUILA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 246, 'EL CAIRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 248, 'EL CERRITO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 250, 'EL DOVIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 275, 'FLORIDA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 306, 'GINEBRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 318, 'GUACARI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 364, 'JAMUNDI', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 377, 'LA CUMBRE', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 400, 'LA UNION', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 497, 'OBANDO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 520, 'PALMIRA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 563, 'PRADERA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 606, 'RESTREPO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 616, 'RIOFRIO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 622, 'ROLDANILLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 670, 'SAN PEDRO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 736, 'SEVILLA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 823, 'TORO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 828, 'TRUJILLO', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 834, 'TULUA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 845, 'ULLOA', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 863, 'VERSALLES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');
INSERT INTO municipios VALUES (1, 'AMERICA', 170, 'COLOMBIA', 76, 'VALLE DEL CAUCA', 869, 'VIJES', 'Saturday 26th of September 2015 01:05:52 PM', 'Parametrización Inicial');


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: admin
--

--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

