FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
COPY *.css /usr/share/nginx/html/ 2>/dev/null || echo "No CSS files to copy"
COPY *.js /usr/share/nginx/html/ 2>/dev/null || echo "No JS files to copy"

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]