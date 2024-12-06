
FROM node:20-slim as build
WORKDIR /app
COPY . .
RUN npm install


FROM node:20-slim
WORKDIR /app
COPY --from=build /app/server.js .
COPY --from=build /app/node_modules/ node_modules
CMD ["node","/app/server.js"]
