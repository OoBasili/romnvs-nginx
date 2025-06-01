FROM nginx:alpine AS nginx

WORKDIR /etc/nginx

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 user

USER user
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
