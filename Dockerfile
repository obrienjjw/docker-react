# this is an example of a phased process
# this will run during the build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# the second FROM statement is understood to be a second phase
FROM nginx
# copy from the "builder" phase above from the first directory, to the dir on nginx (specified in the container specs on docker hub)
COPY --from=builder /app/build /usr/share/nginx/html 

