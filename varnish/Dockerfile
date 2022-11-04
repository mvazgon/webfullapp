FROM varnish:stable
RUN apt update && apt install -y iputils-ping netcat iproute2 net-tools dnsutils
COPY cfg/default.vcl /etc/varnish/
