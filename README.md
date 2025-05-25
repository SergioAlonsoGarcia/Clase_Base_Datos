# Clase_Base_Datos

Repositorio con ejercicios y recursos prácticos para aprender y trabajar con bases de datos SQL. Incluye la base de datos **Sakila**, consultas de ejemplo y scripts para pruebas.

---

## 📂 Estructura del repositorio

- `data/`  
  Archivos SQL con bases de datos o datos de ejemplo (por ejemplo, `sakila.sql`).

- `src/`  
  Consultas SQL y scripts organizados por temas o tablas.

- `docs/`  
  Documentación y manuales de uso.

- `tests/`  
  Scripts para probar consultas o validar resultados.

---

## 🛠️ Cómo usar este repositorio

1. Clona el repositorio:

   ```bash
   git clone https://github.com/SergioAlonsoGarcia/Clase_Base_Datos.git
   cd Clase_Base_Datos
   ```

2. Importa la base de datos Sakila (u otra base de datos ubicada en `data/`) en tu servidor MySQL:

   ```bash
   mysql -u tu_usuario -p < data/sakila.sql
   ```

3. Ejecuta consultas de ejemplo desde la carpeta `src`. Por ejemplo, para listar todos los clientes:

   ```sql
   -- src/listar_clientes.sql
   SELECT customer_id, first_name, last_name, email
   FROM customer
   ORDER BY last_name;
   ```

4. Para probar consultas personalizadas, utiliza los scripts en la carpeta `tests`.

---

## 📑 Ejemplos de consultas SQL

### Obtener películas por categoría

```sql
SELECT f.title, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action'
ORDER BY f.title;
```

### Listar los actores con más películas

```sql
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS peliculas
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY peliculas DESC
LIMIT 10;
```

---

## 💡 Recomendaciones

- Usa un cliente SQL (como MySQL Workbench, DBeaver, etc.) para ejecutar los scripts.
- No ejecutes consultas directamente en bases de datos de producción sin pruebas previas.
- Modifica y adapta las consultas según tus necesidades.

---

## 🤝 Contribuciones

1. Crea una rama nueva:

   ```bash
   git checkout -b nombre-de-tu-rama
   ```

2. Realiza tus cambios y haz un commit:

   ```bash
   git commit -m "feat: añadir consulta para películas de acción"
   ```

3. Sube la rama y abre un Pull Request:

   ```bash
   git push origin nombre-de-tu-rama
   ```

---

## 📞 Contacto

Puedes contactarme a través de GitHub para dudas o sugerencias.

¡Gracias por usar y contribuir a este repositorio!
