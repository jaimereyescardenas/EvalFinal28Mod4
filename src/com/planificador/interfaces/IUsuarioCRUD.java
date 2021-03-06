package com.planificador.interfaces;

import com.planificador.modelo.Usuario;

public interface IUsuarioCRUD {

	// Registrar un usuario en la base de datos
	public boolean crearUsuario(Usuario user);
	
	// Obtener datos de un usuario desde la base de datos
	public Usuario obtenerUsuario(int id);
	
	// Actualiza los datos de un usuario
	public boolean modificarUsuario(Usuario user);
	
	// Verifica si el usuario y la contraseņa coinciden con los registros de la base de datos
	public boolean verificarUsuario(String usuario, String password);
	
	// Extrae el id de un usuario usando sus credenciales (nombre de usuario y password)
	public int obtenerIdUsuario(String usuario, String password);
	
}
