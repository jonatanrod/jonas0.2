Este es el README de Jonas

Para tener en cuenta. 

1. Para el cargue de archivos se debe habilitar en el archivo php.ini del servidor:
	* file_uploads=On
 	* upload_max_filesize=20M (Para imagenes basta con 3M Revisar para los .pdf)
	* upload_tmp_dir ??
	* post_max_size ??
	* max_input_time 

Para seguridad de acceso a la base de datos se debe configurar en el archivo 
	xampp2 : 	* Windows(C:)/xampp2/mysql/bin/my

 para restringir el acceso local (solo se pueda acceder a la db desde localhost)
	* bind-adress="127.0.0.1"