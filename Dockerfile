FROM node:16-alpine as build
WORKDIR /app
COPY . .
RUN npm install && npm install -g @zeit/ncc && mkdir dist && ncc build app.js -o dist 

FROM node:16-alpine
WORKDIR /app
COPY --from=build /app/dist/index.js .
EXPOSE 80
CMD ["node", "index.js"]



