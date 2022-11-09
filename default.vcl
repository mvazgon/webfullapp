vcl 4.1;

backend default {
    .host = "httpd";
    .port = "80";
}

sub vcl_recv {
    #regla para pasar peticiones backend
    if (req.url ~ "^/wp-admin($|/.*)+"){
        return(pass);
    }
    #regla de los metodos para pasar peticiones al backend
    if (req.method != "GET" && req.method != "HEAD"){
        return (pass);
    }
}

sub vcl_backend_response {
    set beresp.ttl = 5m;
    set beresp.grace = 2h;
}
