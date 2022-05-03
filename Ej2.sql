#1.20 Aplicar un descuento de 10€ a todos los productos cuyo precio sea mayor o igual a 120€

UPDATE articulos SET PRECIO= (articulos.PRECIO)-10 WHERE articulos.PRECIO >= 120;

#2.1 Obtener los apellidos de los empleados
SELECT apellidos FROM empleados;
#2.2 Obtener ls apellidos de los empleados sin repeticiones
SELECT distinct apellidos FROM empleados
#2.3 Obtener todos los datos de los empleados que se apellidan ‘Smith’
SELECT * FROM empleados	 WHERE apellidos LIKE "Smith"
#2.4 Obtener todos  los datos de los empleads que se apellidn ‘Smitch’’ y los que se apellidan ‘Rogers’
SELECT apellidos FROM empleados WHERE apellidos LIKE "%Smith%" OR "Rogers%"
#2.5 Obtener toos los datos de los empeados que trabajan para el departamento 14.

SELECT * FROM empleados WHERE DEPARTAMENTO = 14;

#2.6 Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departameto 77.
SELECT * FROM empleados WHERE DEPARTAMENTO = 37 OR DEPARTAMENTO = 77;

#2.7 Obtener todos los datos de los empleados cuyo apellido comience por ‘P’.
SELECT apellidos FROM empleados WHERE apellidos LIKE "p%";
#2.8 Obtener el prosupuesto total de todos los departamentos.
SELECT SUM(PRESUPUESTO) AS TOTAL_PROSUPUESTO FROM departamentos
#2.9 Obtener el número de empleados en cada departamento
SELECT departamento as ID_DEARTAMENTO,COUNT(departamento) AS TOTAL_PR
FROM empleados
GROUP BY departamento;

#2.10
SELECT * FROM empleados INNER JOIN departamentos as d
#2.11
SELECT e.NOMBRE AS NOMBRE_EMPLEADO, e.APELLIDOS AS APELLIDOS_EMPLEADO, d.NOMBRE AS NOMBRE_DEPARTAMENT, d.PRESUPUESTO FROM empleados as e INNER JOIN departamentos as d;

#2.12
SELECT e.NOMBRE,e.APELLIDOS FROM empleados as e INNER JOIN departamentos AS d ON e.DEPARTAMENTO = d.CODIGO WHERE d.PRESUPUESTO > 60000;
#2.13
SELECT * FROM departamentos WHERE PRESUPUESTO > (SELECT AVG(PRESUPUESTO) FROM departamentos);

#2.14
 SELECT departamentos.nombre
FROM departamentos
INNER JOIN empleados
ON  departamentos.codigo = empleados.departamento
GROUP BY departamentos.nombre
HAVING COUNT(empleados.departamento) > 2;

#2.15

INSERT INTO departamentos (CODIGO,NOMBRE,PRESUPUESTO) VALUES (9,"Calidad",40000);

INSERT INTO empleados (DNI,NOMBRE,APELLIDOS,DEPARTAMENTO) VALUES (89267109,"Esther","Vazquez",9) ;
#2.16
UPDATE departamentos SET PRESUPUESTO= (departamentos.PRESUPUESTO)*0.9
#2.17
UPDATE empleados SET DEPARTAMENTO= 14 WHERE empleados.DEPARTAMENTO = 77;
#2.18
DELETE FROM empleados
WHERE empleados.DEPARTAMENTO = 14;
#2.19
DELETE empleados FROM empleados 
INNER JOIN departamentos 
ON empleados.DEPARTAMENTO = departamentos.CODIGO
WHERE departamentos.PRESUPUESTO >60000;

#2.20

DELETE FROM empleados;
