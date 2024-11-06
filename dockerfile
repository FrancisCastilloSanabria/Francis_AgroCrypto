# Etapa 1: Construcción de la aplicación Angular
FROM node:16-alpine AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia package.json y package-lock.json para instalar solo dependencias
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el código fuente de Angular
COPY . .

# Compila la aplicación Angular en modo producción
RUN npm run build --prod

# Etapa 2: Servidor Nginx con la aplicación construida
FROM nginx:alpine

# Copia los archivos compilados al directorio de Nginx
COPY --from=build /app/dist/agro-crypto /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Comando de inicio de Nginx
CMD ["nginx", "-g", "daemon off;"]
