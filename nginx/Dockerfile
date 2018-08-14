FROM nginx

RUN apt-get update -qq && apt-get -y install apache2-utils

COPY nginx.conf /etc/nginx/nginx.conf

COPY heimdall-lite /var/www/heimdall-lite

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
