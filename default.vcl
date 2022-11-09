vcl 4.1;

backend default {
    .host = "httpd";
    .port = "80";
}

sub vcl_recv {
    #indicamos cual es el backend de este sitio.
    set req.backend_hint = default;
    #regla para pasar peticiones backend
    if (req.url ~ "^/wp-admin($|/.*)+"){
        return(pass);
    } else if ( req.method == "POST"){
    	return(pass);
    } else {
    	return(hash);
    }
}

sub vcl_backend_response {
    set beresp.ttl = 5m;
    set beresp.grace = 2h;
}