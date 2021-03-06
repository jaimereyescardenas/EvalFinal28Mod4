<%@page import="com.planificador.dao.ActividadDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.planificador.dao.ActividadDAO" %>
<%@ page import="com.planificador.modelo.Actividad" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modelo de lista de tareas</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- JS de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <!-- Slidebars -->
    <link rel="stylesheet" href="js/Slidebars-2.0.2/dev/slidebars.css">
    <script src="js/Slidebars-2.0.2/dev/slidebars.js"></script>
    <!-- Muuri -->
    <script src="js/muuri/muuri.js"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- JS -->
    <script src="js/main.js"></script>
    <script src="js/listas.js"></script>
    <script src="js/logout.js"></script>
</head>

<body>

    <div canvas="container">
        <div class="wrapper">

            <header>
                <div class="nav-content">
                    <div class="menu_bar">
                        <a href="#" class="bt-menu">Menú</a>
                    </div>
                    <nav>
                        <ul class="nav-list">
                            <li><a href="index.html"><span ></span>Inicio</a></li>
                            <li><a href="quienes-somos.html"><span ></span>Quiénes somos</a></li>
                            <li><a href="lista.jsp"><span ></span>Listas</a></li>
                            <li><a href="calendario.html"><span ></span>Calendario</a></li>
                            <li><a href="rutina.html"><span ></span>Rutinas</a></li>
                            <li><a href="contacto.html"><span ></span>Contacto</a></li>

                            <div class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span ></span>Modo de uso</a>
                                <div class="dropdown-menu">
                                    <a href="lista-uso.html" class="dropdown-item">Listas</a>
                                    <a href="calendario-uso.html" class="dropdown-item">Calendario</a>
                                </div>
                            </div>
                        </ul>

                        <ul class="login">
                            <li><a href="#" id="sld3">Logout</a></li>
                        </ul>

                    </nav>
                </div>

            </header>

            <main>

				<%-- int id_usuario = (int) session.getAttribute("id_usuario"); --%>
                
                <section>
                    <h1>Lista de tareas</h1>
                    <p>Organiza tus tareas de forma sencilla y cómoda. Puedes crear nuevas categorías, asignar fechas de inicio y término, ordenarlas según tus preferencias, y mucho más.</p>
                </section>
                <section class="kanban-demo">
                    <div class="add-task">
                        <button class="btn btn-primary">Nueva actividad</button>
                        <div class="add-task-form">
                            <div><label for="details">Descripción: </label><input type="text" placeholder="Escribe algo" id="desc-add" name="desc-add" maxlength="20"></div>
                            <div><label for="details">Detalles: </label><input type="text" id="detalles-add" name="detalles-add" placeholder="Escribe algo" maxlength="50"></div>
                            <div><label for="start-date">Fecha: </label><input type="date" id="fecha-add" name="fecha-add"></div>
                            <div><label for="category">Categoría: </label><input type="text" id="categoria-add" name="categoria-add" maxlength="20"></div>
                            <button class="btn btn-secondary">Agregar</button>
                        </div>
                    </div>
                    <div class="board-container">
                        <div class="board">
                            <div class="board-column todo">
                                <div class="board-column-header">Por hacer</div>
                                <div class="board-column-content" data-estado="por hacer">
                                
                                <% 
                                	ActividadDAO actdao = new ActividadDAO();
                                	List<Actividad> porhacer = actdao.obtenerActividadesPorEstado(1,"POR HACER");
                                	for (Actividad act: porhacer) {
                                        long fecha = act.getFecha();
                                        Calendar c = Calendar.getInstance();
                                        c.setTimeInMillis(fecha);
                                        int day = c.get(Calendar.DAY_OF_MONTH);
                                        int month = c.get(Calendar.MONTH) + 1;
                                        int year = c.get(Calendar.YEAR);
                                        
                                        String diaString = (day < 10) ? "0" + day : "" + day;
                                        String mesString = (month < 10) ? "0" + month : "" + month;
                                        
                                        String fechaString = year + "-"+ mesString + "-" + diaString;
                                %>
                                
                                    <div class="board-item" data-id="<%= act.getId() %>" data-fecha="<%= fechaString %>" data-categoria="<%= act.getCategoria() %>" data-estado="<%= act.getEstado() %>">
                                    	<div class="board-item-content">
                                    		<span><%= act.getDescripcion() %></span>
                                    		<p><%= act.getDetalle() %></p>
                                   		</div>
                                	</div>
                                
                                <% } %>
                                    
                                </div>
                            </div>
                            <div class="board-column working">
                                <div class="board-column-header">Pendiente</div>
                                <div class="board-column-content" data-estado="pendiente">
                                
                                <% 
                                	List<Actividad> pendiente = actdao.obtenerActividadesPorEstado(1,"PENDIENTE");
                                	for (Actividad act: pendiente) {
                                        long fecha = act.getFecha();
                                        Calendar c = Calendar.getInstance();
                                        c.setTimeInMillis(fecha);
                                        int day = c.get(Calendar.DAY_OF_MONTH);
                                        int month = c.get(Calendar.MONTH) + 1;
                                        int year = c.get(Calendar.YEAR);
                                        
                                        String diaString = (day < 10) ? "0" + day : "" + day;
                                        String mesString = (month < 10) ? "0" + month : "" + month;
                                        
                                        String fechaString = year + "-"+ mesString + "-" + diaString;
                                %>
                                
                                    <div class="board-item" data-id="<%= act.getId() %>" data-fecha="<%= fechaString %>" data-categoria="<%= act.getCategoria() %>" data-estado="<%= act.getEstado() %>">
                                    	<div class="board-item-content">
                                    		<span><%= act.getDescripcion() %></span>
                                    		<p><%= act.getDetalle() %></p>
                                   		</div>
                                	</div>
                                
                                <% } %>
                                    
                                </div>
                            </div>
                            <div class="board-column done">
                                <div class="board-column-header">Completado</div>
                                <div class="board-column-content" data-estado="completado">
                                
                                <% 
                                	List<Actividad> completado = actdao.obtenerActividadesPorEstado(1,"COMPLETADO");
                                	for (Actividad act: completado) {
                                    long fecha = act.getFecha();
                                        Calendar c = Calendar.getInstance();
                                        c.setTimeInMillis(fecha);
                                        int day = c.get(Calendar.DAY_OF_MONTH);
                                        int month = c.get(Calendar.MONTH) + 1;
                                        int year = c.get(Calendar.YEAR);
                                        
                                        String diaString = (day < 10) ? "0" + day : "" + day;
                                        String mesString = (month < 10) ? "0" + month : "" + month;
                                        
                                        String fechaString = year + "-"+ mesString + "-" + diaString;
                                %>
                                
                                    <div class="board-item" data-id="<%= act.getId() %>" data-fecha="<%= fechaString %>" data-categoria="<%= act.getCategoria() %>" data-estado="<%= act.getEstado() %>">
                                    	<div class="board-item-content">
                                    		<span><%= act.getDescripcion() %></span>
                                    		<p><%= act.getDetalle() %></p>
                                   		</div>
                                	</div>
                                
                                <% } %>
                                
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="task-details">
                    	<div><h4>Editar actividad</h4></div>
                        <input type="hidden" id="id-edit" name="id-edit" value="1">
                        <input type="hidden" id="estado-edit" name="id-edit" value="">
                        <div><label for="details">Descripción: </label><input type="text" placeholder="Escribe algo" id="desc-edit" name="desc-edit" maxlength="20"></div>
                        <div><label for="details">Detalles: </label><input type="text" id="detalles-edit" name="detalles-edit" placeholder="Escribe algo" maxlength="50"></div>
                        <div><label for="start-date">Fecha: </label><input type="date" id="fecha-edit" name="fecha-edit"></div>
                        <div><label for="category">Categoría: </label><input type="text" id="categoria-edit" name="categoria-edit" maxlength="20"></div>
                        <div>
                            <button id="add-details" class="btn btn-primary">Editar</button>
                            <button id="remove-act" class="btn btn-danger">Eliminar</button>
                            <button id="edit-cancel" class="btn btn-secondary">Cancelar</button>
                        </div>
                    </div>
                </section>
                <section>
                    <h2>Características</h2>
                    <div>
                        <h3>Úsala como quieras</h3>
                        <p>Puedes usar esta aplicación como un simple to-do list o aprovechar todo su potencial utilizando su integración con el calendario de actividades.</p>
                    </div>
                    <div>
                        <h3>Revisa tu agenda</h3>
                        <p>Puedes ver fácilmente las actividades que tienes durante el día, ordenarlas, y marcarlas como completadas o pendientes.</p>
                    </div>
                    <div>
                        <h3>Organiza tu día</h3>
                        <p>Al crear tus actividades, puedes asignarles una fecha y hora de inicio y de término, lo que las agregará automáticamente a la vista de calendario. Así, podrás ver toda la lista de actividades que debes hacer durante el día, y si
                            existen conflictos de horario con otras actividades que hayas asignado antes.</p>
                    </div>
                    <div>
                        <h3>Clasifica tus tareas</h3>
                        <p>Puedes dividir tus actividades en distintas categorías: trabajo, familia, eventos importantes, cumpleaños, planes para vacaciones, o las categorías que quieras.</p>
                    </div>
                </section>
            </main>

            <footer class="container-fluid">
                <p>Desarrollado por: Claudio Torres, Pamela Machino y Jaime Reyes</p>
                <p>Junio 2020, Todos los derechos reservados.</p>
            </footer>
        </div>
    </div>

    <div off-canvas="id-3 top push" class="custom-fluid-width custom-fluid-height">
        <container class="login" id="logIndex" style="display:none;">
            <h4 id="hlogin">Login</h4>
            <form class="card box-shadow" id="formaLogin">


                <div class="row justify-content-center">
                    <div class="col-3">
                        <label for="ingreso" class="labLog" id="labIng">Usuario o e-mail
                        <input type="text" id="ingreso" name="ingreso" placeholder="Usuario o e-mail" class="inLogin"></label>
                    </div>
                    <div class="col-3">
                        <label for="password" class="labLog" id="labPas">Password
                        <input type="password" id="password" name="password" placeholder="Password" class="inLogin"></label>
                    </div>
                    <div>
                        <input type="submit" value="Ingresar" id="ingresar">
                    </div>
                    <div id="checkRec">
                        <label for="recordar" id="labRecordar">Recordar clave
                        <input type="checkbox" id="checkboxLog" name="recordar">
                        </label>
                    </div>
                </div>

            </form>
        </container>
        <div class="logout-displayer" id="logoutdisplay">
            <p>Has iniciado sesión como: <span id="usuario"></span></p>
            <a href="logout">Cerrar sesión</a>
        </div>
    </div>

</body>

</html>