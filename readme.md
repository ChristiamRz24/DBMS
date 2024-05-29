# Documentación del Proyecto

Este proyecto está construido utilizando varias tecnologías clave. A continuación, se detalla cada una de ellas junto con sus respectivos enlaces para más información:

| Tecnología  | URL                                                       |
|-------------|-----------------------------------------------------------|
| pnpm        | [pnpm Package](https://community.chocolatey.org/packages/pnpm#install) |
| Astro       | [Astro Documentation](https://docs.astro.build/en/editor-setup/) |
| DaisyUI     | [DaisyUI Components](https://daisyui.com/components/)     |
| TailwindCSS | [TailwindCSS Setup](https://tailwindcss.com/docs/editor-setup) |

## Configuración Inicial

1. **Instalación de pnpm:** 
  Primero, instala `pnpm` usando [Chocolatey](https://chocolatey.org):
  ```
  choco install pnpm
  ```

2. Configuración del entorno de desarrollo:  
  Abre el proyecto en Visual Studio Code.  
  Abre una terminal integrada en VS Code.

3. Instalación de dependencias y ejecución del proyecto:  
  Ejecuta los siguientes comandos en la terminal:
    1. `pnpm i`
    2. `pnpm run dev`  
  Una vez iniciado, el proyecto estará disponible en http://localhost:4321/

4. Configuración de Variables de Entorno  
  Crea un archivo .env en la raíz del proyecto, copia el contenido de .env.example, y completa la información requerida para las conexiones a las bases de datos:
      - MariaDB
      - MySQL
      - Oracle
      - PostgreSQL
      - SQLite
      - SQL Server

5. Guías de Astro que necesitas revisar  
  [Routing](https://docs.astro.build/en/guides/routing/)  
  [API Endpoints](https://docs.astro.build/en/guides/endpoints/)  
  [Imports](https://docs.astro.build/en/guides/imports/#javascript)

6. TODOs:  
  [ ] Usar Docker para la configuración de las bases de datos  
  [x] Realizar un diseño de la aplicación final  
  [ ] Integrar Oracle a las bases de datos soportadas